# Getting Started (no terminal)

This is the path for someone who has never opened a terminal and doesn't want to.
Everything here is download-and-click. About 20 minutes, most of it one-time.

Prefer the terminal? The [README](README.md) has the `git clone` path.

## What you're about to set up

Four layers, bottom to top:

1. **Claude Code** — the AI that does the work. Installed as a **Desktop app**.
2. **The Foundation kit** — gives the AI a memory and, crucially for growth, learns
   **how you write and what you find tasteful**. This kit *requires* it, because the
   design and copy gates check the AI's output against your taste and voice.
3. **The design + copy skills** — two free plugins that generate on-brand design and
   draft copy in your voice.
4. **This kit** — the *judgment layer*. It stops the growth work at the points where
   a human has to decide (who's this for, what's the one claim, is this design ours,
   is this copy true, where does it go) and walks you through each. Added as a
   **plugin**.

Because layer 2 is required here, **start with the Foundation kit** — it's the
gentler on-ramp and it installs Claude Code for you — then come back for this one.

## What you need

- A **Mac or Windows** computer.
- A **paid Claude plan** — Pro or Max. **The free Claude plan does not include
  Claude Code.**

## Step 1 — set up the Foundation kit first

Go to [loop-and-gate-foundation](https://github.com/slogsdon/loop-and-gate-foundation) and
follow its no-terminal getting-started. It walks you through installing the Claude
desktop app, and — most important for growth — has you run its
**profile-interview**, a conversation that teaches the AI your voice and taste. Do
that before coming back. The design and copy gates here depend on it.

## Step 2 — add this kit (inside the app)

In the Code chat box, type:

```
/plugin marketplace add slogsdon/loop-and-gate-grow-kit
```

A menu appears. Click **Install** on the *loop-and-gate-grow-kit* plugin.

## Step 3 — add the design and copy skills

Same place, paste these one at a time:

```
/plugin marketplace add slogsdon/claude-code-config
/plugin install skills-design@slogsdon-claude-code-config
/plugin install skills-writing@slogsdon-claude-code-config
```

`skills-design` generates on-brand design, `skills-writing` drafts and cleans up
copy in your voice. Both read the profiles you built in the Foundation kit.

## Step 4 — set your strategy once

Type `/grow-and-gate` and tell it you're setting up a campaign. It walks you through
the audience and what "it worked" means — the strategy that everything you make
points back to. You do this once per campaign, not per post.

## Step 5 — make your first piece

Type `/grow-and-gate` and tell it what you're making (a post, a landing page). It
will:

- **Size the piece first** — a quick post gets a light touch, a launch page gets the
  full treatment.
- **Walk the gates that piece earns** — the one claim, the design, the copy, the
  channel — handing each decision to you.
- **Check the design against your taste and the copy against your voice**, using the
  profiles from the Foundation kit, so what ships sounds and looks like you.

Scheduling (where and when to post) is the last gate. Connect a free posting account
later, or just post by hand — the gate is the decision, not the tool.

## Step 6 — read what happened, and feed it back

After things are live, run `/grow-and-gate` and tell it you're reading results. It
checks the real outcome against what you defined as "it worked," and writes what you
learned back into the Foundation memory — where the **Build Kit** picks it up to
decide what to build next. That's the loop.

## The other half

The **Build Kit** —
[loop-and-gate-build-kit](https://github.com/slogsdon/loop-and-gate-build-kit) — is
the build side, for building the product itself. Same method, both halves.

## Working across devices

Run this from your phone or tablet as well as your desk. Because the Grow Kit rides
on the Foundation, the Foundation's [Working across devices](https://github.com/slogsdon/loop-and-gate-foundation#working-across-devices)
guide — Remote Control, Dispatch, and keeping your vault in sync — covers this kit
too.

## Prefer the terminal?

`git clone` the repo and use the `grow-and-gate` skill directly — see the
[README](README.md).
