@echo off
echo ========================================
echo   NexTalk - Clean Restart Expo
echo ========================================
echo.
echo Stopping any running Expo processes...
taskkill /F /IM node.exe 2>nul
timeout /t 2 >nul

echo Clearing Expo cache...
cd /d "c:\wamp\www\message\mobile"
if exist ".expo" rd /s /q ".expo"
if exist "node_modules\.cache" rd /s /q "node_modules\.cache"

echo Starting Expo with clean cache...
npx expo start --clear

pause
