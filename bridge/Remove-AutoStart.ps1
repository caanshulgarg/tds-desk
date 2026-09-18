<#
  Stops the hidden TDS Desk Tally Bridge from starting at sign-in, and stops it now.
  Run:  powershell -ExecutionPolicy Bypass -File Remove-AutoStart.ps1
#>
$launcher = Join-Path ([Environment]::GetFolderPath('Startup')) 'TDS Desk Tally Bridge.vbs'
if (Test-Path $launcher) { Remove-Item $launcher; Write-Host 'Auto-start removed.' -ForegroundColor Green } else { Write-Host 'Auto-start was not installed.' }
$procs = Get-CimInstance Win32_Process -Filter "Name = 'powershell.exe'" | Where-Object { $_.CommandLine -like '*TDSBridge.ps1*' -and $_.ProcessId -ne $PID }
foreach ($p in $procs) { Stop-Process -Id $p.ProcessId -Force; Write-Host ('Stopped the running bridge (process ' + $p.ProcessId + ').') }
