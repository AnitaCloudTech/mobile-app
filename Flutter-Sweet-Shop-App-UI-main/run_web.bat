@echo off
cd /d "%~dp0"
taskkill /F /IM dart.exe >nul 2>&1
start "Sweet Shop Server" cmd /k D:\Documents\flutter\bin\flutter.bat run -d web-server --web-hostname 127.0.0.1 --web-port 5177
timeout /t 8 /nobreak >nul
start "" http://127.0.0.1:5177
