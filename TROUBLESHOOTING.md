# 🔧 Troubleshooting Guide

Common issues and how to fix them.

## 🚨 Backend Issues

### Issue: "Database connection failed"

**Symptoms:**
```
❌ Database connection failed: Access denied for user
```

**Solutions:**

1. **Check WAMP is Running**
   - Look for green WAMP icon in taskbar
   - If red or orange, click and select "Start All Services"

2. **Verify Database Credentials**
   - Open `backend/.env`
   - Make sure:
     ```
     DB_USER=message
     DB_PASSWORD=Emmanuel?s3
     DB_NAME=messanger
     ```
   - Check these match your MySQL user in phpMyAdmin

3. **Test Database Connection**
   - Open phpMyAdmin: `http://localhost/phpmyadmin`
   - Try logging in with username: `message`, password: `Emmanuel?s3`
   - If can't login, create user again in phpMyAdmin

4. **Recreate Database**
   ```bash
   cd backend
   node init-database.js
   ```

### Issue: "Port 3000 is already in use"

**Symptoms:**
```
Error: listen EADDRINUSE: address already in use :::3000
```

**Solutions:**

**Option 1: Kill the Process**
```bash
# Find what's using port 3000
netstat -ano | findstr :3000

# Kill the process (replace PID with number from above)
taskkill /PID [PID_NUMBER] /F
```

**Option 2: Use Different Port**
- Open `backend/.env`
- Change `PORT=3000` to `PORT=3001`
- Update mobile config to use port 3001

### Issue: "Cannot find module 'express'"

**Symptoms:**
```
Error: Cannot find module 'express'
```

**Solution:**
```bash
cd backend
npm install
```

### Issue: "JWT_SECRET is not defined"

**Symptoms:**
```
Error: JWT_SECRET is not defined
```

**Solution:**
- Make sure `backend/.env` file exists
- If missing, copy from `backend/.env.example`
- Add: `JWT_SECRET=your_secret_key_here`

---

## 📱 Mobile App Issues

### Issue: "Network request failed"

**Symptoms:**
- Can't login
- Can't register
- Error: "Network request failed"

**Solutions:**

1. **Check Backend is Running**
   - Look for terminal showing "Server running on port 3000"
   - If not, start backend: `cd backend && npm start`

2. **Same WiFi Network**
   - Phone and computer MUST be on same WiFi
   - Not phone data, not different WiFi

3. **Update IP Address** (for physical device)
   - Find your IP:
     ```bash
     ipconfig
     ```
     Look for IPv4 Address (e.g., 192.168.1.100)
   
   - Update `mobile/src/config/config.js`:
     ```javascript
     export const API_URL = 'http://192.168.1.100:3000/api';
     export const SOCKET_URL = 'http://192.168.1.100:3000';
     ```
   
   - Restart Expo (Ctrl+C, then `npm start`)

4. **Firewall Blocking**
   - Windows Firewall might block Node.js
   - Allow Node.js when prompted
   - Or temporarily disable firewall for testing

### Issue: "Expo won't start"

**Symptoms:**
```
'expo' is not recognized as an internal or external command
```

**Solution:**
```bash
# Install Expo CLI globally
npm install -g expo-cli

# If still doesn't work, try with admin rights
# Right-click Command Prompt → Run as Administrator
npm install -g expo-cli
```

### Issue: "Can't scan QR code"

**Solutions:**

1. **Use Tunnel Mode**
   ```bash
   expo start --tunnel
   ```

2. **Manual Connection**
   - In Expo Go app, switch to "Enter URL manually"
   - Type the URL shown in terminal

3. **Use LAN Mode**
   ```bash
   expo start --lan
   ```

### Issue: "Metro bundler failed"

**Symptoms:**
```
Error: Metro bundler has encountered an error
```

**Solutions:**

1. **Clear Cache**
   ```bash
   cd mobile
   expo start -c
   ```

2. **Reinstall Dependencies**
   ```bash
   cd mobile
   rm -rf node_modules
   npm install
   ```

3. **Check for Syntax Errors**
   - Look at error message
   - Find the file mentioned
   - Fix any typos or syntax errors

### Issue: "Socket not connecting"

**Symptoms:**
- Messages don't arrive in real-time
- Showing "🔴 Disconnected"

**Solutions:**

1. **Check Backend Socket.IO**
   - Backend terminal should show: "📡 Socket.IO listening"
   
2. **Update Socket URL**
   - Same as API_URL issue above
   - Use your computer's IP, not localhost

3. **Test Socket Connection**
   - Try sending a message
   - Check backend terminal for socket logs

---

## 🗄️ Database Issues

### Issue: "Table doesn't exist"

**Symptoms:**
```
Error: Table 'messanger.users' doesn't exist
```

**Solution:**
```bash
cd backend
node init-database.js
```

### Issue: "Can't connect to local MySQL server"

**Solutions:**

1. **Start MySQL in WAMP**
   - Click WAMP icon
   - MySQL → Service → Start/Resume Service

2. **Check MySQL Port**
   - Default is 3306
   - If changed, update `backend/.env`:
     ```
     DB_PORT=3307
     ```

### Issue: "Access denied for user 'message'@'localhost'"

**Solution:**

1. **Recreate MySQL User**
   - Open phpMyAdmin
   - Go to "User accounts"
   - Delete user "message" if exists
   - Add new user:
     - Username: `message`
     - Host: `localhost`
     - Password: `Emmanuel?s3`
   - Grant all privileges on database `messanger`

2. **Update .env if password changed**

---

## 🔄 General Issues

### Issue: "Everything works but messages are slow"

**Possible Causes:**

1. **Not using Socket.IO**
   - Check mobile app shows "🟢 Connected"
   - If "🔴 Disconnected", fix socket connection

2. **WiFi is slow**
   - Try different network
   - Move closer to router

3. **Too many apps open**
   - Close unused apps on phone
   - Close unused programs on computer

### Issue: "Images/files not uploading"

**Solutions:**

1. **Check Uploads Folder**
   - Make sure `backend/uploads` folder exists
   - Should be created automatically

2. **File Size Too Large**
   - Default limit: 10MB
   - Change in `backend/.env`:
     ```
     MAX_FILE_SIZE=20971520
     ```
     (20MB = 20 * 1024 * 1024)

3. **Check Permissions** (if on Mac/Linux)
   ```bash
   chmod 777 backend/uploads
   ```

4. **Mobile Permissions**
   - App needs camera/storage permissions
   - Check phone settings → App permissions

---

## 🆘 Still Not Working?

### Basic Diagnostic Checklist

Run through this checklist:

- [ ] WAMP icon is green
- [ ] Backend terminal shows "Server running on port 3000"
- [ ] Backend terminal shows "Database connected successfully"
- [ ] Expo terminal is open and showing QR code
- [ ] Phone and computer on same WiFi
- [ ] Tried restarting everything
- [ ] Checked error messages in both terminals

### Fresh Start (Nuclear Option)

If nothing works, start fresh:

1. **Stop Everything**
   - Close all Command Prompts
   - Stop WAMP

2. **Delete node_modules**
   ```bash
   cd backend
   rmdir /s node_modules
   cd ../mobile
   rmdir /s node_modules
   ```

3. **Run Setup Again**
   ```bash
   cd c:\wamp\www\message
   setup.bat
   ```

4. **Restart Backend**
   ```bash
   cd backend
   npm start
   ```

5. **Restart Mobile**
   ```bash
   cd mobile
   npm start
   ```

### Getting Help

If you're still stuck:

1. **Copy the Error Message**
   - Full error from terminal
   - Screenshot if needed

2. **Check What's Different**
   - Did you change anything?
   - New computer?
   - Different network?

3. **Ask for Help With Details**
   - What you're trying to do
   - What error you're getting
   - What you've already tried

---

## 💡 Prevention Tips

**To avoid issues:**

1. ✅ Always start WAMP first
2. ✅ Always start backend before mobile
3. ✅ Keep terminals open while testing
4. ✅ Use same WiFi network
5. ✅ Don't modify .env file while servers running
6. ✅ Check for typos in config files
7. ✅ Update IP address when changing networks

---

## 🎯 Common Beginner Mistakes

### Mistake 1: Using localhost on physical device
❌ Wrong: `http://localhost:3000`
✅ Right: `http://192.168.1.100:3000`

### Mistake 2: Forgetting to start backend
- Mobile app can't work without backend
- Always check backend is running first

### Mistake 3: Different WiFi networks
- Computer on WiFi, phone on mobile data ❌
- Both must be on same network ✅

### Mistake 4: Closing terminals
- Terminals must stay open
- Closing them stops the servers

### Mistake 5: Not checking WAMP
- WAMP must be running (green)
- Red or orange means not working

---

**Remember: Most issues are simple fixes! Don't give up! 💪**
