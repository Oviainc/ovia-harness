# OVIA Harness - Step 2 (v2): Strongest LOCAL brain this PC can hold
# PC: AMD RX 5700 XT, 8 GB VRAM. Ceiling for a fully-on-GPU agent model
# is the 8B class. qwen3:8b (5.2 GB, Tools + Thinking badges on Ollama)
# is the strongest in that class and the current default pick for
# 8-12 GB cards. qwen2.5:7b (already on this PC) stays as fallback.
# qwen2.5:3b stays untouched for the phone agent.
# Ollama base URL must NOT end in /v1 (that path drops tool calls).

$ErrorActionPreference = "Stop"

Write-Host "== Checking Ollama ==" -ForegroundColor Cyan
try { ollama --version } catch {
  Write-Host "Ollama not found. Install it from https://ollama.com/download then re-run." -ForegroundColor Yellow
  exit 1
}

Write-Host "== Pulling qwen3:8b (5.2 GB, one time) ==" -ForegroundColor Cyan
ollama pull qwen3:8b

Write-Host "== Models now on this PC ==" -ForegroundColor Cyan
ollama list

Write-Host "== Pointing OpenClaw at qwen3:8b, fallback qwen2.5:7b ==" -ForegroundColor Cyan
openclaw config set agents.defaults.model.primary ollama/qwen3:8b
openclaw config set agents.defaults.model.fallbacks '["ollama/qwen2.5:7b"]'
openclaw config validate

Write-Host ""
Write-Host "Done. Run 3-check.ps1, then: openclaw dashboard"
Write-Host "Honest expectation: good at 1-2 step local jobs. Multi-step work is"
Write-Host "where 8B models break - for the cloud assistant-level strength run 4-hosted-brain.ps1"
