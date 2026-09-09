# 🚀 Quick Start Guide - For Absolute Beginners

If this is your first time working with a chat app, follow these simple steps!

## ⚡ 5-Minute Setup

### Step 1: Start WAMP (Database) ✅

1. Click on WAMP icon in your taskbar (should be green)
2. If it's not green, click "Start All Services"
3. You already have the database set up! 👍

### Step 2: Setup Database Tables

1. **Open Command Prompt**:
   - Press `Windows Key + R`
   - Type `cmd` and press Enter

2. **Navigate to backend folder**:
   ```bash
   cd c:\wamp\www\message\backend
   ```

3. **Install backend packages** (first time only):
   ```bash
   npm install
   ```
   Wait for it to finish (may take 2-3 minutes)

4. **Create database tables**:
   ```bash
   node init-database.js
   ```
   You should see: ✅ Database tables created successfully

### Step 3: Start Backend Server

Still in the same Command Prompt:
```bash
npm start
```

You should see:
```
🚀 Server running on port 3000
✅ Database connected successfully
```

**✋ IMPORTANT: Keep this window open!**

### Step 4: Setup Mobile App

1. **Open a NEW Command Prompt** (don't close the first one)
   - Press `Windows Key + R`
   - Type `cmd` and press Enter

2. **Navigate to mobile folder**:
   ```bash
   cd c:\wamp\www\message\mobile
   ```

3. **Install mobile packages** (first time only):
   ```bash
   npm install
   ```
   Wait for it to finish (may take 3-5 minutes)

4. **Install Expo CLI** (first time only):
   ```bash
   npm install -g expo-cli
   ```

5. **Start the app**:
   ```bash
   npm start
   ```

A browser window will open showing a QR code!

### Step 5: Run on Your Phone

1. **Install Expo Go** on your phone:
   - iPhone: Search "Expo Go" in App Store
   - Android: Search "Expo Go" in Play Store

2. **Make sure your phone and computer are on the SAME WiFi**

3. **Scan the QR code**:
   - iPhone: Open Camera app → Point at QR code
   - Android: Open Expo Go app → Press "Scan QR Code"

4. **Wait** for the app to load on your phone (first time takes 1-2 minutes)

### Step 6: Test the App! 🎉

1. Click "Register" in the app
2. Create an account:
   - Username: `testuser1`
   - Email: `test1@test.com`
   - Password: `password123`
3. Click Register button
4. You're in! 🎊

### Testing Messages

To test messaging, you need 2 users:

**Option A: Two Phones** (Best way)
- Install app on friend's phone
- They register with different username
- Start chatting!

**Option B: One Phone** (Quick test)
- Register first user on phone
- Register second user via browser:
  1. Open browser
  2. Go to: `http://localhost:3000/api/auth/register`
  3. Won't work in browser directly, but you can use Postman or test with the first user

**Option C: Easiest - Register on phone, logout, register another user**
- Register first user
- Click logout
- Register second user
- Login as first user
- Click + button
- Select second user
- Start chatting!

## 🎯 What You Need Running

To use the app, you always need:

1. ✅ WAMP Server (green icon in taskbar)
2. ✅ Backend Server (Command Prompt showing "Server running on port 3000")
3. ✅ Expo Server (Command Prompt showing QR code)

## 📱 If Something Goes Wrong

### Backend won't start?
```bash
# Make sure you're in the right folder
cd c:\wamp\www\message\backend

# Try installing again
npm install

# Try starting again
npm start
```

### Mobile app won't connect?

1. **Find your computer's IP address**:
   - Open Command Prompt
   - Type: `ipconfig`
   - Look for "IPv4 Address" (like 192.168.1.100)

2. **Update the mobile config**:
   - Open file: `c:\wamp\www\message\mobile\src\config\config.js`
   - Change these lines:
   ```javascript
   export const API_URL = 'http://YOUR_IP_HERE:3000/api';
   export const SOCKET_URL = 'http://YOUR_IP_HERE:3000';
   ```
   Replace `YOUR_IP_HERE` with your IP address from step 1

3. **Restart Expo**:
   - In the Expo Command Prompt, press `Ctrl + C`
   - Type: `npm start`
   - Scan QR code again

### Expo won't start?
```bash
# Make sure you're in the right folder
cd c:\wamp\www\message\mobile

# Try installing Expo again
npm install -g expo-cli

# Try starting again
npm start
```

### Can't scan QR code?

In the Expo DevTools (browser window):
- Click "Send link with email/SMS"
- Or click "Tunnel" and try again

## 🎓 Understanding What You Built

### Backend (Server)
- Runs on your computer at `http://localhost:3000`
- Stores messages in MySQL database
- Handles user login/registration
- Sends messages in real-time using Socket.IO

### Mobile App
- Runs on your phone via Expo Go
- Connects to your computer's backend
- Shows messages in real-time
- Can send text, images, and files

### Database
- Stores users, messages, and conversations
- Runs in WAMP MySQL
- You can see the data in phpMyAdmin

## 🔄 Daily Usage

Every time you want to test the app:

1. Start WAMP
2. Open Command Prompt → `cd c:\wamp\www\message\backend` → `npm start`
3. Open another Command Prompt → `cd c:\wamp\www\message\mobile` → `npm start`
4. Scan QR code on phone

## ✨ Tips for Beginners

- **Always check WAMP is running** (green icon)
- **Keep both Command Prompts open** while testing
- **Phone and computer must be on same WiFi**
- **First time setup takes longer** - be patient!
- **Errors are normal** - read them carefully and try again
- **Close and restart** if something seems stuck

## 📞 Still Need Help?

Check the main README.md file for:
- Detailed troubleshooting
- API documentation
- Advanced features
- How to add new features

---

**You're ready to go! Have fun building! 🚀**
