@echo off
title OVIA Harness - OpenClaw Install
echo.
echo  OVIA Harness (OpenClaw) - Step 1 of 3
echo  ===========================================
echo  This installs OpenClaw from the OFFICIAL site (openclaw.ai)
echo  on THIS computer, then runs onboarding.
echo.
echo  - Nothing is sent anywhere by this file itself.
echo  - Do NOT paste any password or API key into chat.
echo  - If Windows asks about running scripts, allow for this session only.
echo.
pause
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp01-install-openclaw.ps1"
echo.
echo  Step 1 done. Next: right-click 2-set-local-model.ps1 and Run with PowerShell.
pause
