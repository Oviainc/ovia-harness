# OVIA Harness — OpenClaw on your own PC

An installable local-agent package for Windows, built on OpenClaw.

## Straight answer first

The goal: an AI agent that lives **on your own computer**, with direct
access to your files, programs and terminal there — no remote hop, no
rented machine in the middle.

- A hosted cloud assistant cannot be copied or self-hosted; there is
  no download of it.
- **OpenClaw CAN do the job.** OpenClaw is an open-source local agent
  framework (MIT). It uses the agent file shape — AGENTS.md / SOUL.md /
  MEMORY.md / USER.md / skills — runs on your PC, and works with a
  free local model (Ollama) or a hosted model if you choose one.
- Once it is running on your PC, **you do not need remote-access
  software for the agent's own work** — it already lives on the
  machine. You message it from its local dashboard (or a chat channel
  you choose to connect).

This package is **prepared work, not a claim it is installed.** Nothing on
your PC has been touched by building this folder. Installation happens
only when you run the installer on the PC (see below), or in a remote
session you accept.

## What is in this package

```
START-HERE.bat                  Double-click launcher on Windows
1-install-openclaw.ps1          Official OpenClaw install + onboarding
2-set-local-model.ps1           Point OpenClaw at your Ollama (free, local)
3-check.ps1                     Health check: gateway, model, dashboard
workspace/
  AGENTS.md                     How the local agent works at OVIA
  SOUL.md                       Its tone / persona
  IDENTITY.md                   Name: OVIA Local
  USER.md                       Who you are (public OVIA facts only)
  MEMORY.md                     Starting memory (public facts only, no secrets)
  TOOLS.md                      This PC's facts: GPU, Ollama, paths
  skills/
    ovia-phone-agent/         Start / check / stop the cascade phone agent
    ovia-pc-basics/           Safe PC house rules
ANYDESK-AND-ALTERNATIVES.md     Why AnyDesk failed + what to use instead
SECURITY.md                     Read this — OpenClaw has full PC access
```

**No passwords, API keys, Twilio tokens, or private memory are in this
package.** You enter any key on the PC itself, never in chat.

## Install — 3 steps on your PC (about 20–30 min)

You need to be at the PC for step 1 only.

1. Copy this whole `ovia-openclaw-local` folder to the PC Desktop.
   Double-click **START-HERE.bat** — it runs the official installer:
   `iwr -useb https://openclaw.ai/install.ps1 | iex`
   then `openclaw onboard --install-daemon`
   - Windows note: OpenClaw's docs say **WSL2 is the more stable path**,
     native Windows works for the Gateway (it installs as a Scheduled
     Task). The installer will tell you if it wants WSL2 — follow it.
   - In onboarding: choose **QuickStart**, local gateway, port **18789**,
     token auth (auto-generated). Skip chat channels for now — dashboard
     first, add WhatsApp/Telegram later once it works locally.
   - When onboarding offers to create its own workspace files, let it,
     then copy the `workspace\` files from this package over them
     (same names), or point onboarding at this package's workspace.

2. Local brain (free, private — uses the Ollama you already have):
   Right-click **2-set-local-model.ps1** → Run with PowerShell.
   **v2 (Nov 15, after the owner's "thats weak"):** it now pulls `qwen3:8b`
   (5.2 GB, Tools + Thinking — the strongest agent model that fits
   your RX 5700 XT 8 GB; `qwen2.5:7b`, already on your PC, becomes the
   fallback, and `qwen2.5:3b` stays untouched for the phone agent):
   `openclaw config set agents.defaults.model.primary ollama/qwen3:8b`
   Read **STRONG-OPTIONS.md** — the local ceiling is hardware, and
   option B there (hosted frontier brain, local hands, via
   `4-hosted-brain.ps1`) is the only route to the cloud assistant-level strength.
   Important: Ollama base URL must be `http://127.0.0.1:11434` with
   **no `/v1` on the end** — the `/v1` path silently drops tool calls.

   Smarter brain (optional, paid by usage, key entered on the PC only):
   OpenClaw can also use a hosted model, or the cloud assistant Spark Open via
   OpenRouter (`open-model routes`). That is **not** the cloud assistant and
   not me — it is a model endpoint. Only add it if the local 7B feels
   too weak after a real test, and enter the key in OpenClaw's own
   setup on the PC, never in chat.

3. Check it: run **3-check.ps1**. You want:
   - `openclaw gateway status` → listening on 18789
   - `openclaw dashboard` → opens the local UI
   - First message test: "What PC are you running on, what GPU, and
     what is in Desktop\OVIA?" — it should answer from TOOLS.md and
     actually look, not guess.

## What it can do on day one

- Work directly in `Desktop\OVIA\ai-receptionist` and a new
  `Desktop\ovia-cascade` folder — no AnyDesk copy step.
- Start/check the OVIA phone-agent cascade locally (skill included,
  same rules as PC-SETUP.md: always via its start script, verify
  health + a live test call before saying the line works).
- Read/write files, run PowerShell, check Ollama, help with
  QuickBooks exports you place in its workspace.

## What it is not

- It is not me, and it does not have my memory of our chats except the
  public starting facts in `workspace\MEMORY.md`. Teach it as you go —
  its memory lives in files on your PC, under your control.
- The local 7B model is weaker than a frontier cloud model. Expect it
  to be good at local file/terminal jobs and slower/rougher at long
  reasoning. That trade-off is the price of free + private + local.
