@echo off
cd /d "%~dp0"
if not exist "%~dp0tds-bridge.config.json" (
  echo The bridge has not been started yet. Run Start-TDS-Bridge.bat once first.
) else (
  powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "$c = Get-Content -Raw '%~dp0tds-bridge.config.json' | ConvertFrom-Json; Write-Host ''; Write-Host '  Bridge address : http://127.0.0.1:' $c.Port; Write-Host '  Bridge key     : ' $c.Key -ForegroundColor Yellow; Write-Host ''; Write-Host '  Paste both into TDS Desk > Settings > Tally Bridge.'"
)
echo.
pause
