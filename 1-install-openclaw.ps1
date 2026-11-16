# OVIA Harness - Step 1: Install OpenClaw (official installer)
# Source: https://docs.openclaw.ai/install  (Windows PowerShell installer)
# Run on the user's PC only. No credentials are collected by this script.

$ErrorActionPreference = "Stop"
Write-Host "== OpenClaw official installer ==" -ForegroundColor Cyan
Write-Host "Downloading installer from https://openclaw.ai/install.ps1 ..."
# Official one-liner, exactly as documented:
iwr -useb https://openclaw.ai/install.ps1 | iex

Write-Host ""
Write-Host "== Checking install ==" -ForegroundColor Cyan
openclaw --version

Write-Host ""
Write-Host "== Onboarding (QuickStart, local gateway, port 18789) ==" -ForegroundColor Cyan
Write-Host "Choose: QuickStart / Local gateway / Token auth. Skip chat channels for now."
Write-Host "When asked for a workspace, you can accept the default, then copy the"
Write-Host "workspace files from this package over it afterwards."
openclaw onboard --install-daemon

Write-Host ""
Write-Host "== Gateway status ==" -ForegroundColor Cyan
openclaw gateway status
Write-Host ""
Write-Host "Next: run 2-set-local-model.ps1"
