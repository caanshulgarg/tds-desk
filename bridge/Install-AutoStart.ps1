<#
  Starts the TDS Desk Tally Bridge automatically, hidden, each time this Windows user signs in.
  No administrator rights needed: a small launcher is placed in this user's Startup folder.
  Run:  powershell -ExecutionPolicy Bypass -File Install-AutoStart.ps1
#>
$ErrorActionPreference = 'Stop'
$script = Join-Path $PSScriptRoot 'TDSBridge.ps1'
if (-not (Test-Path $script)) { Write-Host 'TDSBridge.ps1 was not found next to this file.' -ForegroundColor Red; exit 1 }
$startup = [Environment]::GetFolderPath('Startup')
$launcher = Join-Path $startup 'TDS Desk Tally Bridge.vbs'
$cmd = 'powershell.exe -NoLogo -NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File ""' + $script + '""'
$vbs = 'Set sh = CreateObject("WScript.Shell")' + "`r`n" + 'sh.Run "' + $cmd + '", 0, False' + "`r`n"
Set-Content -Path $launcher -Value $vbs -Encoding ASCII
Write-Host ('Installed: ' + $launcher) -ForegroundColor Green
Write-Host 'The bridge will start hidden each time you sign in. Starting it now...'
Start-Process -FilePath 'wscript.exe' -ArgumentList ('"' + $launcher + '"')
Start-Sleep -Seconds 4
if (Test-Path (Join-Path $PSScriptRoot 'tds-bridge.config.json')) {
  $c = Get-Content -Raw (Join-Path $PSScriptRoot 'tds-bridge.config.json') | ConvertFrom-Json
  Write-Host ('Bridge address: http://127.0.0.1:' + $c.Port)
  Write-Host ('Bridge key    : ' + $c.Key) -ForegroundColor Yellow
}
Write-Host 'Log file: tds-bridge.log in this folder.'
