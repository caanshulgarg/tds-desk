@echo off
title TDS Desk - Tally Bridge
cd /d "%~dp0"
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0TDSBridge.ps1"
echo.
echo The bridge has stopped. Press any key to close this window.
pause >nul
