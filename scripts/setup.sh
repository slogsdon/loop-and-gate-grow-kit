#!/usr/bin/env bash
# One-time setup for the Loop & Gate Grow Kit.
# Installs the grow-and-gate skill, then tells you the plugin commands and the
# Foundation kit this kit needs. Safe to re-run.
set -euo pipefail

cd "$(dirname "$0")/.."
repo="$(pwd)"

echo "== Loop & Gate Grow Kit — setup =="
echo ""

# 1. Claude Code present?
if ! command -v claude >/dev/null 2>&1; then
  echo "MISSING: Claude Code isn't installed yet."
  echo "  It's the tool this kit plugs into. Install it first:"
  echo "    npm install -g @anthropic-ai/claude-code"
  echo "  (Need npm? Install Node.js from https://nodejs.org, then run the line above.)"
  echo "  Then run this script again: ./scripts/setup.sh"
  exit 1
fi
echo "ok: Claude Code found ($(claude --version 2>/dev/null | head -1))"

# 2. Install the skill as a personal skill (available in every project).
skills_dir="$HOME/.claude/skills"
mkdir -p "$skills_dir"
dst="$skills_dir/grow-and-gate"
if [ -L "$dst" ] || [ -e "$dst" ]; then
  rm -rf "$dst"
fi
ln -s "$repo/skills/grow-and-gate" "$dst"
echo "ok: installed the grow-and-gate skill -> $dst"

# 3. Hand off the plugin commands + the Foundation requirement.
cat <<'EOF'

Almost there. A few more steps, all inside Claude Code.

STEP A — the Foundation kit is REQUIRED for this one.
The grow gates for design and copy read your taste and voice profiles, which live
in the Foundation kit. If you haven't set it up, do that first:
  https://github.com/YOUR_USERNAME/second-brain-agent
Then run its profile-interview so the profiles exist.

STEP B — install the design and copy skills. Open Claude Code (type `claude`),
then paste these one at a time:

  /plugin marketplace add slogsdon/claude-code-config
  /plugin install skills-design@slogsdon-claude-code-config
  /plugin install skills-writing@slogsdon-claude-code-config

STEP C — start. Fill templates/audience-brief.md for your campaign, then in Claude
Code type:

  /grow-and-gate

Tell it what you're making or measuring. It sizes the piece, then walks the gates
for the cadence you're in — and never decides for you.

Full walkthrough with nothing assumed: see GETTING-STARTED.md
Optional (Gate 5): connect a free-tier posting account only if you want the agent
to schedule posts. Otherwise post by hand — the gate is the decision, not the tool.

This kit pairs with the Loop & Gate Build Kit (the other half of the loop):
  https://github.com/YOUR_USERNAME/loop-and-gate-build-kit
EOF
