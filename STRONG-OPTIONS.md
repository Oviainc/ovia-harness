# Why the local agent feels weak — and the 3 real fixes

> **DECISION — Nov 15, 2026, 23:11 EST: NO SPENDING for the moment.**
> the owner chose the $0 route. Option B (hosted/paid) is PARKED — do not
> pitch it, do not run 4-hosted-brain.ps1, until the owner reopens it.
> The plan is A (free local qwen3:8b) + C (cloud assistant as brain,
> free Tailscale + SSH for PC access, already being set up).

the owner's verdict (Nov 15, 22:08 EST): "thats weak". Correct. Here's why,
and what actually changes it — checked Nov 15, 2026.

## The cause is hardware, not the package

An agent's strength is its model. A model has to fit in the graphics
card's memory to run fast:

| Brain | Size | Fits RX 5700 XT (8 GB)? | Agent strength |
|---|---|---|---|
| qwen2.5:3b (phone agent) | 2.2 GB | Yes, 100% GPU | Takes messages, simple Q&A |
| qwen2.5:7b (was v1 default) | 4.7 GB | Yes | Basic local jobs |
| **qwen3:8b (v2 default)** | **5.2 GB** | **Yes** | **Best possible fully-local on this card — fine at 1–2 tool steps, shaky on long multi-step jobs** |
| qwen3:14b | 9.3 GB | No — spills to CPU/RAM | Steadier, but slow on this PC |
| 30B-class (where agents get dependable) | ~17–19 GB | No | Needs a 24 GB card this PC doesn't have |
| Frontier hosted (Claude / GPT / the cloud assistant Spark Open) | runs in cloud | n/a | the cloud assistant-level — the strength you're comparing against |

OpenClaw's own guidance lines up: it wants a 64K+ context, tool-capable
model for stable multi-step work. No 8 GB local model gives you that
plus frontier reasoning. Anyone who tells you otherwise is selling.

## The 3 real fixes — pick one

**A. Strongest free/local (v2 default, already in the package)**
`qwen3:8b` via Ollama. $0, private, offline. Ceiling: simple local
jobs done well; long chains will break sometimes. Good for: starting/
checking the phone agent, file jobs, drafts, lookups on the PC.

**B. Strong brain, local hands — RECOMMENDED for real work**
OpenClaw stays on your PC (it holds the files, runs the commands,
controls the phone agent), a hosted frontier model does the thinking.
Run `4-hosted-brain.ps1`, pick a provider in OpenClaw's own wizard,
enter the key on the PC only. Pay-per-token API billing — light
personal use is typically dollars, not hundreds, but it is metered,
so keep the local model as fallback for cheap jobs.
Note: a Claude subscription does NOT make this free — since
Apr 4, 2026, Anthropic bills OpenClaw-driven Claude use as
pay-as-you-go Extra Usage. API key is the clean route.

**C. Keep me as the brain, local agent as hands only**
No new cost, strongest thinking you already have. I prepare exact
scripts/packages (like the cascade bundle and this package), the
local agent / you run them on the PC, results come back to me.
Downside: nothing autonomous happens between our chats.

## My recommendation (updated with the no-spend decision)

Install with **A**, use **C** for hard jobs — I do the thinking in
chat, the local side does the doing, and the Tailscale + SSH setup
already underway in the phone-agent chat is what lets me work on
the PC directly, all $0. **B stays parked** until the owner says spend.
