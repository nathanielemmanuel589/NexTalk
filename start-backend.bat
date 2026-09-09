@echo off
echo ========================================
echo   Starting Chat App Backend Server
echo ========================================
echo.
echo Make sure WAMP server is running!
echo.

cd backend
echo Starting server on http://localhost:3000
echo.
echo Keep this window open while using the app!
echo Press Ctrl+C to stop the server
echo.
call npm start
