# Skill: OVIA Phone Agent (local, on this PC)

Use when the owner asks about the phone line, the agent at [your agent line number],
starting/stopping it, or test calls.

## Two builds — do not mix them

1. **OVIA (old):** `Desktop\OVIA\ai-receptionist`, Piper voice, Ollama
   qwen2.5:3b, local server 127.0.0.1:8000.
   Start ONLY with `deploy\start.bat`. Never raw uvicorn.
2. **Cascade (new):** `Desktop\ovia-cascade` (Pipecat + Whisper +
   Ollama + Kokoro). Start with its `start-pc.bat`, which starts the
   agent, Ollama check, and the cloudflared tunnel, in that order.

## Start / verify procedure (cascade)

1. PC awake, sleep disabled while the line is live.
2. Run `start-pc.bat`.
3. Check `http://localhost:8000/healthz` → ok:true.
4. Run the local test script in the cascade folder → want 10/10.
5. The cloudflared tunnel host changes on every restart. Put the new
   host in the cascade `.env` as PUBLIC_HOST, restart the agent, then
   confirm the Twilio webhook for [your agent line number] points at
   `https://<new-host>/voice` — re-read it back, do not assume.
6. Only then ask the owner to test-call: trial message → press 1 → ask an
   invoice question first, then a tech-support question.

## Failure reading

- Twilio "application error" / error 11200 "unknown host" = the tunnel
  or host is dead, NOT the agent code. Check the tunnel first.
- "Phone agent is not configured" = the process started without its
  .env loaded. Restart via the start script.
- Never report "line works" from a health check alone. A live call
  the owner made and heard is the only proof.
