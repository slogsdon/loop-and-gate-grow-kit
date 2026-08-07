---
name: video-transcript
description: Pull a clean text transcript from a video URL using yt-dlp's subtitle track — YouTube, Loom, Vimeo, or anything else yt-dlp supports. Use when the user says "transcript for this video", "what does this video say", "pull the transcript", "/video-transcript <url>", or drops a video URL as research input for a post, page, or launch. Transcript only — no audio download, no Whisper, no vision pass.
---

# Video Transcript

One job: turn a video URL into `transcript.txt` you can read. It downloads the
subtitle track only — no media file — so a 44-minute video takes about two seconds.

## Run it

```bash
skills/video-transcript/transcript.sh <url> [outdir] [lang]
```

- `url` — full URL or bare YouTube ID. Extra query params (`?app=desktop`, `&ra=m`) are fine.
- `outdir` — defaults to the current directory.
- `lang` — subtitle language prefix, defaults to `en` (matches `en`, `en-orig`, `en-US`).

Writes, all named from a slug of the video title:

| File | What |
|---|---|
| `<slug>.txt` | the transcript, one caption line per line |
| `<slug>.json` | title, uploader, duration, upload date, URL, word count |
| `<slug>.*.vtt` | raw subtitle tracks, kept so you can recover timestamps |

It prints `title — uploader · duration · word count` and the path to the `.txt`.

## Then read it

The transcript is plain text with no timestamps. Read it with the Read tool.
Long videos run 8–10k words, so for a targeted question grep the `.txt` first
rather than reading the whole thing into context.

For timestamps, go back to the `.vtt` — every cue carries its `00:00:00.000 -->`
line. The transcript drops them because most downstream uses (quotes, summaries,
research for a post) don't need them.

## What it does under the hood

1. `yt-dlp --print` for metadata. This is a separate call because `--print`
   implies `--simulate`, so it can never write files in the same invocation.
2. `yt-dlp --write-sub --write-auto-sub --sub-lang "<lang>.*" --sub-format vtt
   --skip-download` for the subtitle tracks. Manual subs are preferred when the
   uploader provided them; auto-generated captions are the fallback.
3. An `awk` pass turns VTT into text: drops the header, cue numbers, and timing
   lines; strips inline `<c>` karaoke tags; decodes HTML entities (`&gt;&gt;` is
   YouTube's speaker-change marker); and keeps only the last line of each cue,
   because auto-captions roll the previous line forward into the next cue.

## When it fails

| Failure | What to do |
|---|---|
| `yt-dlp missing` | `brew install yt-dlp` |
| `No en subtitles available` | The video has no caption track in that language. Pass a different `lang`, or use `makerskills:watch-video` — it falls back to local Whisper transcription. |
| Private / region-locked / members-only | yt-dlp errors out. Report and stop; nothing here can fix it. |
| Transcript looks duplicated or shredded | The VTT used an unusual cue layout. Fall back to reading the `.vtt` directly. |

## Scope

Transcript only. If the request needs on-screen content — a slide deck, a UI
demo, a design critique — this skill is the wrong tool; use
`makerskills:watch-video` in `visual` or `multimodal` mode.
