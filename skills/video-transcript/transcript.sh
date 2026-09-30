#!/usr/bin/env bash
# Pull a YouTube (or any yt-dlp-supported) video's transcript as clean text.
# Usage: yt-transcript.sh <url-or-id> [outdir] [lang]
set -euo pipefail

URL="${1:?usage: yt-transcript.sh <url-or-id> [outdir] [lang]}"
OUTDIR="${2:-.}"
LANG_PREF="${3:-en}"

command -v yt-dlp >/dev/null || { echo "yt-dlp missing: brew install yt-dlp" >&2; exit 1; }
mkdir -p "$OUTDIR"

# Metadata (--print implies --simulate, so this must be its own call)
meta=$(yt-dlp --no-update --skip-download --no-warnings \
  --print "%(title)s|%(uploader)s|%(duration_string)s|%(upload_date>%Y-%m-%d)s|%(webpage_url)s" "$URL")
IFS='|' read -r TITLE UPLOADER DURATION UPDATE URLFULL <<<"$meta"

slug=$(printf '%s' "$TITLE" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-//; s/-$//' | cut -c1-50)
base="$OUTDIR/$slug"

# Subtitles: manual first, auto-generated as fallback. Both land as .vtt
yt-dlp --no-update --skip-download --write-sub --write-auto-sub \
  --sub-lang "$LANG_PREF.*" --sub-format vtt --no-warnings \
  -o "$base.%(ext)s" "$URL" >/dev/null

vtt=$(ls -S "$base".*.vtt 2>/dev/null | head -1) || true
[ -n "${vtt:-}" ] || { echo "No $LANG_PREF subtitles available for: $TITLE" >&2; exit 2; }

# VTT -> text: drop headers/cue timings, strip inline tags, keep the final line of
# each cue (auto-subs roll the previous line into the next cue), drop repeats.
awk '
  /^WEBVTT/ || /^Kind:/ || /^Language:/ || /^NOTE/ || /^[0-9]+$/ { next }
  /-->/ { incue = 1; last = ""; next }
  /^[[:space:]]*$/ { if (last != "" && last != prev) { print last; prev = last } incue = 0; last = ""; next }
  incue {
    line = $0
    gsub(/<[^>]*>/, "", line)
    gsub(/&#39;/, "'"'"'", line); gsub(/&quot;/, "\"", line)
    gsub(/&gt;/, ">", line); gsub(/&lt;/, "<", line); gsub(/&amp;/, "\\&", line)
    gsub(/^[[:space:]]+|[[:space:]]+$/, "", line)
    if (line != "") last = line
  }
  END { if (last != "" && last != prev) print last }
' "$vtt" > "$base.txt"

words=$(wc -w < "$base.txt" | tr -d ' ')
cat > "$base.json" <<EOF
{"title":$(printf '%s' "$TITLE" | python3 -c 'import json,sys;print(json.dumps(sys.stdin.read()))'),
 "uploader":$(printf '%s' "$UPLOADER" | python3 -c 'import json,sys;print(json.dumps(sys.stdin.read()))'),
 "duration":"$DURATION","upload_date":"$UPDATE","url":"$URLFULL",
 "subtitle_source":"$(basename "$vtt")","words":$words}
EOF

echo "$TITLE — $UPLOADER · $DURATION · $words words"
echo "$base.txt"
