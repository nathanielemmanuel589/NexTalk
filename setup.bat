@echo off
echo ========================================
echo   Chat App - Easy Setup Script
echo ========================================
echo.

:: Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed!
    echo Please install Node.js from: https://nodejs.org/
    pause
    exit /b 1
)

echo [OK] Node.js is installed
echo.

:: Backend Setup
echo ========================================
echo   Setting up Backend...
echo ========================================
cd backend

echo Installing backend dependencies...
call npm install
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install backend dependencies
    pause
    exit /b 1
)
echo [OK] Backend dependencies installed
echo.

echo Initializing database...
call node init-database.js
if %errorlevel% neq 0 (
    echo [WARNING] Database initialization had issues
    echo Please check if WAMP is running and database credentials are correct
) else (
    echo [OK] Database initialized
)
echo.

cd ..

:: Mobile Setup
echo ========================================
echo   Setting up Mobile App...
echo ========================================
cd mobile

echo Installing mobile dependencies...
call npm install
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install mobile dependencies
    pause
    exit /b 1
)
echo [OK] Mobile dependencies installed
echo.

cd ..

:: Install Expo CLI globally
echo Installing Expo CLI globally...
call npm install -g expo-cli
echo [OK] Expo CLI installed
echo.

echo ========================================
echo   Setup Complete! 
echo ========================================
echo.
echo Next steps:
echo 1. Make sure WAMP server is running
echo 2. Open 2 Command Prompts:
echo.
echo    Terminal 1 - Start Backend:
echo    cd c:\wamp\www\message\backend
echo    npm start
echo.
echo    Terminal 2 - Start Mobile App:
echo    cd c:\wamp\www\message\mobile
echo    npm start
echo.
echo 3. Scan QR code with Expo Go app on your phone
echo.
echo See README.md for detailed instructions!
echo ========================================
pause
