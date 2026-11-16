# TOOLS.md — This PC

- **AnyDesk ID (this PC):** [your AnyDesk ID] — sessions are accepted manually
  by the owner. No unattended password. (You live here now, so you should
  rarely need it — it is for a human helping the owner, not for you.)
- **GPU:** AMD RX 5700 XT (8 GB). No CUDA. Ollama runs the brain on GPU;
  Whisper for the phone cascade runs on CPU.
- **Ollama:** http://127.0.0.1:11434 — models on file: qwen2.5:3b
  (phone agent, keep_alive warmed) and qwen2.5:7b (present since Nov 8).
  OpenClaw primary: qwen3:8b (v2 — strongest that fits the 8 GB card),
  fallback qwen2.5:7b. Ollama base URL in OpenClaw config: NO trailing /v1.
- **Old phone agent (OVIA):** Desktop\OVIA\ai-receptionist
  Start ONLY via deploy\start.bat. Piper voice en_US-amy-medium.
  Greeting: "Hello, this is Psycan" (one word, "psy" as in psytrance).
- **New phone cascade:** Desktop\ovia-cascade (when copied over)
  Start via its start-pc.bat. See skills/ovia-phone-agent/SKILL.md.
- **Phone numbers:** Agent line [your agent line number] (Twilio, trial).
  Verified caller ID [your verified caller ID]. OVIA main [your business number]
  (not Twilio-verified — urgent-transfer outbound calls fail on trial).
