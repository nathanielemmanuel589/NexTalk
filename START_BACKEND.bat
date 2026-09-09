@echo off
echo ========================================
echo   NexTalk Backend Server Starter
echo ========================================
echo.
echo Starting backend server...
echo Backend will run on: http://172.20.10.2:3000
echo.

cd /d "c:\wamp\www\message\backend"
node server.js

pause
