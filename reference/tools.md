# The Tools — a dated snapshot

**This is the disposable layer. Read the warning before the table.**

The gates are the asset. The tools that fill the space between them churn. What
follows is one working composition, verified **2026-07-12** — a snapshot, not the
method. When these names change, the gates in `grow-gates.md` don't. Never anchor on
this table.

Two honest things up front, both different from the build side:

1. **Most grow gates have no tool at all.** Audience, the one claim, ready-to-show,
   and how-much-process are pure judgment. Only design and copy have a skill behind
   them, scheduling has an optional free account, and metrics use whatever's already
   free. That's not a gap — it's the proof the grow gates are where *you* work.
2. **This kit needs the Foundation kit.** The design and copy skills are only as good
   as the taste and voice profiles that drive them, and those live in the Foundation
   kit. Grow requires it, it doesn't just recommend it.

## The map (verified 2026-07-12)

| Gate | Cadence | Tool | Public / free? |
|------|---------|------|----------------|
| ∞ How much process | every time | — none. Judgment. | n/a |
| G1 Audience | strategy | — none. Positioning + switching forces (agent helps map). | n/a |
| G6-define What's a win | strategy | — none. Judgment. | n/a |
| G0 Ready to show | per-piece | — none. Walk your own funnel. | n/a |
| G2 One claim | per-piece | — none. Judgment (agent helps rank). | n/a |
| G3 Design | per-piece | `skills-design`, driven by the taste profile | **Public** |
| G4 Copy | per-piece | `skills-writing` (humanize, style-pass), driven by the voice profile | **Public** |
| G5 Channel / time | per-piece | a free-tier posting account (e.g. Buffer). Optional. | **Free tier** |
| G6-measure Did it work | feedback | the platform's own free analytics | **Free** |

The whole tool footprint is two public plugins, one optional free account, and
free platform analytics. You can work every gate with zero paid tools, and every
gate with zero external accounts if you post by hand.

## Install the public layer

The design and copy skills are public, installable through the public
`slogsdon/claude-code-config` marketplace:

```bash
/plugin marketplace add slogsdon/claude-code-config
/plugin install skills-design@slogsdon-claude-code-config
/plugin install skills-writing@slogsdon-claude-code-config
```

You also need the **Foundation kit** for the taste and voice profiles these skills
read. If you haven't set it up, do that first:
https://github.com/YOUR_USERNAME/second-brain-agent

Scheduling (Gate 5) is optional. Connect a free-tier posting account only if you
want the agent to place posts for you — otherwise post by hand. The gate is the
decision (channel, format, time), not the tool.

## Compose your own

Grow stacks vary far more than build stacks, so this matters more here than on the
build side. The gates are what's fixed; the tools are interchangeable. Map each gate
to whatever you already use:

- **Design (G3)** — any generator you trust, judged against your taste profile. Swap
  `skills-design` for your own design skill or tool.
- **Copy (G4)** — any drafting tool, rewritten in your voice and fact-checked. Swap
  `skills-writing` for your own.
- **Scheduling (G5)** — Buffer, or any scheduler, or your own hands.
- **Metrics (G6)** — whatever your channels report for free.

The judgment gates (∞, G1, G6-define, G0, G2) need no tool on any stack. They're
yours everywhere.
