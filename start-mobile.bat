@echo off
echo ========================================
echo   Starting Chat App Mobile (Expo)
echo ========================================
echo.
echo Make sure backend server is running first!
echo.

cd mobile
echo Starting Expo development server...
echo.
echo A browser window will open with a QR code.
echo Scan it with Expo Go app on your phone.
echo.
echo Keep this window open while using the app!
echo Press Ctrl+C to stop Expo
echo.
call npm start
