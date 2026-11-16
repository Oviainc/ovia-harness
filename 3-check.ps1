# OVIA Harness - Step 3: Health check
$ErrorActionPreference = "Continue"
Write-Host "== Versions ==" -ForegroundColor Cyan
node --version
openclaw --version
ollama --version

Write-Host "`n== Gateway (want: listening on 18789) ==" -ForegroundColor Cyan
openclaw gateway status

Write-Host "`n== Config check ==" -ForegroundColor Cyan
openclaw config validate
openclaw doctor

Write-Host "`n== Ollama local API ==" -ForegroundColor Cyan
try {
  $r = Invoke-RestMethod -Uri "http://127.0.0.1:11434/api/tags" -TimeoutSec 5
  $r.models | ForEach-Object { Write-Host (" - " + $_.name) }
} catch { Write-Host "Ollama API not answering on 127.0.0.1:11434" -ForegroundColor Yellow }

Write-Host "`nOpen the dashboard with:  openclaw dashboard" -ForegroundColor Green
