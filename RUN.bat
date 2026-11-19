@echo off
REM FB-EC2-Creator-Tool — launcher.
REM Downloads FB-EC2-Creator.exe from the GitHub Release on every run,
REM then runs it. The .exe is re-downloaded fresh every time, so the
REM user always gets the latest version.
setlocal
cd /d "%~dp0"

echo [launcher] Downloading FB-EC2-Creator.exe ...
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://github.com/anythingpaid/FB-EC2-Creator-Tool/releases/download/v3.0.5/FB-EC2-Creator.exe' -OutFile 'FB-EC2-Creator.exe'"
if errorlevel 1 (
  echo [launcher] ERROR: Download failed. Check your internet connection and try again.
  exit /b 1
)

FB-EC2-Creator.exe
endlocal
