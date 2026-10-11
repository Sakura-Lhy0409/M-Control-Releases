@echo off
setlocal
echo M-Control lighting USB diagnostics (read only)
echo No device changes or uploads. A new ZIP is saved on your desktop.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Collect-MControlLightingUsbDiagnostics.ps1"
if errorlevel 1 echo Collection did not complete. Keep this window's error for the original report.
pause
endlocal
