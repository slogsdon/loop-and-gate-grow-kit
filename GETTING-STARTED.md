# Getting Started (from zero)

This guide assumes **nothing**. No marketing background, never opened a terminal, not
sure what a plugin is. If that's you, you're exactly who this is for. About 20
minutes, most of it one-time setup.

If you already run Claude Code, skip to
[the short version](#short-version-if-youre-already-set-up).

## What you're about to set up

Four layers, bottom to top:

1. **Claude Code** — the AI that reads and writes files and does the work. The engine.
2. **The Foundation kit** — gives the AI a memory and, crucially for growth, learns
   **how you write and what you find tasteful**. This kit *requires* it, because the
   design and copy gates check the AI's output against your taste and voice. Without
   it, those gates are guessing.
3. **The design + copy skills** — two free add-ons that generate on-brand design and
   draft copy in your voice.
4. **This kit** — the *judgment layer*. It stops the growth loop at the points where a
   human has to decide (who's this for, what's the one claim, is this design ours, is
   this copy true, where does it go) and walks you through each.

Because layer 2 is required here, the easiest path is to **set up the Foundation kit
first** — it walks you through installing Claude Code — then come back for this one.

## Step 0 — what you need

- A Mac or Linux computer. (On Windows, install "WSL" first — search "install WSL" —
  and follow along inside it.)
- A Claude subscription or API key.

## Step 1 — set up the Foundation kit first

Go to the Foundation kit and follow its getting-started guide:
https://github.com/slogsdon/second-brain-agent

It installs Claude Code for you and, most important for growth, has you run its
**profile-interview** — a conversation that teaches the AI your voice and your taste.
Do that before coming back. The design and copy gates here depend on it.

## Step 2 — get this kit

Open a terminal (Mac: `Cmd+Space`, type "Terminal", Enter). Paste:

```bash
git clone https://github.com/slogsdon/loop-and-gate-grow-kit.git
cd loop-and-gate-grow-kit
```

## Step 3 — run setup

```bash
./scripts/setup.sh
```

It installs this kit's skill and prints the remaining steps. Follow what it prints.

## Step 4 — install the design and copy skills

The script tells you to open Claude Code (`claude`) and paste these:

```
/plugin marketplace add slogsdon/claude-code-config
/plugin install skills-design@slogsdon-claude-code-config
/plugin install skills-writing@slogsdon-claude-code-config
```

`skills-design` generates on-brand design, `skills-writing` drafts and cleans up copy
in your voice. Both read the profiles you built in the Foundation kit.

## Step 5 — set your strategy once

Before making anything, fill in `templates/audience-brief.md`. It's a short form: who
you're talking to, what actually moves them, and what would count as "it worked."
You do this once per campaign, and everything you make points back to it.

## Step 6 — make your first piece

In Claude Code, type:

```
/grow-and-gate
```

Tell it what you're making (a post, a landing page) in plain words. It will:

- **Size the piece first** — a quick post gets a light touch, a launch page gets the
  full treatment.
- **Walk the gates that piece earns** — the one claim, the design, the copy, the
  channel — and hand each decision to you.
- **Check the design against your taste and the copy against your voice**, using the
  profiles from the Foundation kit, so what ships sounds and looks like you.

Scheduling (where and when to post) is Gate 5. You can connect a free posting account
later, or just post by hand — the gate is the decision, not the tool.

## Step 7 — read what happened, and feed it back

After things are live, run `/grow-and-gate` again and tell it you're reading results.
It checks the real outcome against what you defined as "it worked," and writes what
you learned back into the Foundation memory — where the **Build Kit** picks it up to
decide what to build next. That's the loop: what the market tells you shapes what you
build, which you bring back to market.

## Where to go when you're stuck

- `reference/grow-gates.md` — the full list of decision points, in plain language,
  each with a "what to do if this isn't your strength."
- `reference/tools.md` — the exact tools this uses today, and how to swap in your own.
- The **Build Kit** — https://github.com/slogsdon/loop-and-gate-build-kit — is
  the other half of the loop, for building the product itself.

---

## Short version (if you're already set up)

You have Claude Code and the Foundation kit (with profiles built). Then:

```bash
git clone https://github.com/slogsdon/loop-and-gate-grow-kit.git
cd loop-and-gate-grow-kit && ./scripts/setup.sh
```

Install `skills-design` + `skills-writing` as the script prints, fill
`templates/audience-brief.md`, and run `/grow-and-gate`.
