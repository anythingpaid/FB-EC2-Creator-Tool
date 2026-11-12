@echo off
REM FB-EC2-Creator-Tool — launcher.
REM Downloads FB-EC2-Creator.exe from the GitHub Release on first run,
REM then runs it. After the first run the .exe is already here, so it
REM just runs it.
setlocal
cd /d "%~dp0"

if not exist "FB-EC2-Creator.exe" (
  echo [launcher] Downloading FB-EC2-Creator.exe ...
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://github.com/anythingpaid/FB-EC2-Creator-Tool/releases/download/v2.2/FB-EC2-Creator.exe' -OutFile 'FB-EC2-Creator.exe'"
  if errorlevel 1 (
    echo [launcher] ERROR: Download failed. Check your internet connection and try again.
    exit /b 1
  )
)

FB-EC2-Creator.exe
endlocal
