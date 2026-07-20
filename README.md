# Loop & Gate — Grow Kit

A judgment layer for taking software to market with an agentic loop. Anyone can
install the tools that generate design and draft copy. Almost nobody knows **where
to intervene** — where a human has to decide whether the design is actually yours,
whether the copy is true, which audience is really yours, and whether this is worth
shipping now. This kit is the map of those points, the grow gates, and how to work
each one even when its skill isn't yours yet.

## The idea in one paragraph

A growth loop can generate designs, draft posts, spin variants, and schedule them on
its own. It should. But it can't tell tasteful from on-trend slop, it can't feel when
a claim is technically true but sounds like a lie, it can't read which audience is
actually yours, and left alone it will confidently blast a good message into the
wrong channel at the wrong time. So the loop has to stop at a fixed set of points and
wait for a human. Those points are the gates. **The gates are the asset. The tools
are a disposable appendix.**

## What this is / what it's not

**It is** the human-decision gates for an agentic growth loop — a runnable
grow-gates reference (`reference/grow-gates.md`) plus the `grow-and-gate` skill
that runs a piece through only the gates it earns.

**It is not** the design or copy tooling itself (it sits *on top of*
`skills-design` + `skills-writing` — the disposable appendix), and it is not an
autopilot: every gate stops for your decision. It also **needs the Foundation
kit** — the design and copy gates check output against the taste and voice
profiles that live there.

## The grow gates run in three rhythms

Unlike the build side, these don't run in one straight pass. Growth is three
cadences, and Gate ∞ (how much does this piece deserve?) runs every time:

- **Strategy** (set once, reused) — who's the audience, what's a win.
- **Per-piece** (every artifact) — the one claim, the design, the copy, the channel.
- **Feedback** (continuous) — what happened, and what it tells the build side to make
  next.

## What's in here

| Path | What it is |
|------|-----------|
| `GETTING-STARTED.md` | Zero-assumptions walkthrough — start here if you're new. |
| `reference/grow-gates.md` | The grow gates in runnable checklist form, grouped by cadence — the core asset. |
| `skills/grow-and-gate/` | The operating skill: run a piece through the gates it earns. |
| `reference/tools.md` | A dated snapshot of the tools that fill the space between the gates, with install commands. Disposable on purpose. |
| `templates/audience-brief.md` | The strategy-cadence form (audience, switching forces, defined win). |
| `.claude-plugin/` | Marketplace + plugin manifest — lets you install this kit via `/plugin marketplace add`. |
| `scripts/setup.sh` | Optional convenience for the terminal/clone path. Not needed for plugin install. |

## Install

**New to this?** Read **[GETTING-STARTED.md](GETTING-STARTED.md)** — it assumes no
marketing background and no terminal experience, and uses the Claude desktop
app.

**Have Claude Code? Install it as a plugin — no clone, no setup.** In the Code chat,
type:

```
/plugin marketplace add slogsdon/loop-and-gate-grow-kit
```

then click **Install**. Run `/grow-and-gate` to set strategy, make a piece, or read
results.

This kit **needs the Foundation kit** (voice + taste profiles drive the design and
copy gates) plus the free `skills-design` + `skills-writing` plugins — GETTING-STARTED
lists the exact steps.

**Prefer the terminal?** `git clone` this repo and use the `grow-and-gate` skill
directly. `scripts/setup.sh` is an optional convenience for that path.

## This kit needs the Foundation kit

Not optional. The design gate checks output against your **taste profile** and the
copy gate against your **voice profile**, and both live in the Foundation kit
([loop-and-gate-foundation](https://github.com/slogsdon/loop-and-gate-foundation)). Set it
up and run its `profile-interview` first, or Gates 3 and 4 are just guessing.

## What it looks like

You're about to post a launch page. You run `/grow-and-gate`:

- **Gate ∞.** High reach, permanent, hard to walk back → it earns the full per-piece
  set.
- **Gate 2.** The agent lists five things you could say, and you cut to the one claim that
  speaks to your audience's real hesitation.
- **Gate 3.** The design looks clean but generic. Checked against your taste profile,
  it's "could be anyone" — send it back until it's yours.
- **Gate 4.** The copy is persuasive and contains a stat you never gave it. Cut the
  invented number, rewrite in your voice.
- **Gate 5.** One channel where your audience actually is, at a time you can be around
  to reply.

A quick reply, run through the same skill, earns a glance at voice and a send. That
difference is Gate ∞ doing its job.

## The other half of the loop

This is the grow side. The **Build Kit**
([loop-and-gate-build-kit](https://github.com/slogsdon/loop-and-gate-build-kit))
is the build side — taking an idea to shipped software. They close a loop: this kit's
last gate reads what the market did and writes the signal to the Foundation vault,
where the Build Kit's first gate picks it up to decide what to build next. Same
method, both halves, one customer at the center.

## The whole stack

[Loop & Gate](https://shane.logsdon.io/loop-and-gate/) is the overview page — the
mental model, all four pieces, and how to install them together.

The gate method and the thinking behind it (Karpathy's system-prompt learning,
Addy Osmani's self-improving agents, and more) are documented in the Foundation —
see its [README](https://github.com/slogsdon/loop-and-gate-foundation) and
[ARCHITECTURE.md](https://github.com/slogsdon/loop-and-gate-foundation/blob/main/ARCHITECTURE.md).

Running this from more than one device? The Foundation's [Working across
devices](https://github.com/slogsdon/loop-and-gate-foundation#working-across-devices)
guide applies here too — market signals and gate output land in the same vault,
so the same Remote Control, sync, and worktree discipline runs this kit from
your phone, tablet, or desk, with nothing kit-specific to set up.

## The one rule

The kit doesn't decide for you. It surfaces the call, applies the heuristics, puts
the agent to work making the decision defensible — then stops. Use it to *work* each
gate and you level up on the lens you're missing. Use it to *skip* the gate and you
just ship polished noise faster.

## Contributing

Issues and pull requests are welcome — see [CONTRIBUTING.md](CONTRIBUTING.md)
for how to report bugs, propose gate or skill changes, and the PR conventions.
One thing up front: the gates are the asset, so PRs that remove a gate or
auto-approve one will be declined. See also the
[Code of Conduct](CODE_OF_CONDUCT.md) and the
[security policy](.github/SECURITY.md).

## Status

The asset (grow gates + operating skill), the audience-brief template, the tools
snapshot, and the on-ramp are here. Grounded in a real build-in-public run — see the
grow field guide for the worked examples.
