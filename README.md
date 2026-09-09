# 💬 Real-Time Chat Messaging App

A complete cross-platform mobile messaging application with real-time chat, file sharing, and user authentication. Built with React Native (Expo) for mobile and Node.js for the backend.

## ✨ Features

- 🔐 User Authentication (Register/Login)
- 💬 Real-time One-to-One Messaging
- 📸 Image Sharing
- 📎 File Sharing
- ✅ Message Read Receipts
- ⌨️ Typing Indicators
- 👥 User Search
- 🟢 Online/Offline Status
- 📱 Cross-platform (iOS & Android)

## 🛠️ Tech Stack

### Backend
- **Node.js** - JavaScript runtime
- **Express.js** - Web framework
- **Socket.IO** - Real-time communication
- **MySQL** - Database
- **JWT** - Authentication
- **Multer** - File uploads

### Mobile App
- **React Native** - Mobile framework
- **Expo** - React Native toolchain
- **React Navigation** - Navigation
- **Socket.IO Client** - Real-time messaging
- **Axios** - HTTP client

## 📋 Prerequisites

Before you begin, make sure you have installed:

1. **Node.js** (v16 or higher) - [Download](https://nodejs.org/)
2. **WAMP/XAMPP** (for MySQL) - Already installed ✅
3. **Expo CLI** - Will install in setup steps
4. **Expo Go App** - On your phone (for testing)
   - [iOS App Store](https://apps.apple.com/app/expo-go/id982107779)
   - [Google Play Store](https://play.google.com/store/apps/details?id=host.exp.exponent)

## 🚀 Installation & Setup

### Step 1: Database Setup

1. **Start WAMP Server**
   - Make sure MySQL is running

2. **Open phpMyAdmin**
   - Go to: `http://localhost/phpmyadmin`

3. **The database `messanger` and user `message` should already be created** ✅
   - If not, create them using the SQL tab

4. **Import Database Schema**
   - Select the `messanger` database
   - Go to SQL tab
   - Copy and paste the contents of `backend/database/schema.sql`
   - Click "Go" to execute

### Step 2: Backend Setup

1. **Open Command Prompt** and navigate to the backend folder:
   ```bash
   cd c:\wamp\www\message\backend
   ```

2. **Install Dependencies**:
   ```bash
   npm install
   ```

3. **Initialize Database Tables**:
   ```bash
   node init-database.js
   ```
   
   You should see:
   ```
   ✅ Database 'messanger' is ready
   ✅ Database tables created successfully
   ```

4. **Start the Backend Server**:
   ```bash
   npm start
   ```
   
   You should see:
   ```
   🚀 Server running on port 3000
   📡 Socket.IO listening for connections
   ✅ Database connected successfully
   ```

   **Keep this terminal window open!** The server must be running.

### Step 3: Mobile App Setup

1. **Open a NEW Command Prompt** (don't close the backend terminal) and navigate to mobile folder:
   ```bash
   cd c:\wamp\www\message\mobile
   ```

2. **Install Dependencies**:
   ```bash
   npm install
   ```

3. **Install Expo CLI globally** (if not already installed):
   ```bash
   npm install -g expo-cli
   ```

4. **Start the Expo Development Server**:
   ```bash
   npm start
   ```
   
   This will open Expo DevTools in your browser showing a QR code.

### Step 4: Run on Your Phone

#### Option A: Using Expo Go App (Recommended for Beginners)

1. **Install Expo Go** on your phone:
   - iOS: Download from App Store
   - Android: Download from Play Store

2. **Connect to Same WiFi**:
   - Make sure your phone and computer are on the same WiFi network

3. **Scan QR Code**:
   - **iOS**: Open Camera app and scan the QR code from Expo DevTools
   - **Android**: Open Expo Go app and scan the QR code

4. **Wait for App to Load**:
   - The app will download and open on your phone

#### Option B: Using Android Emulator

1. Install Android Studio
2. Set up Android Virtual Device (AVD)
3. In Expo DevTools, click "Run on Android device/emulator"

#### Option C: Using iOS Simulator (Mac only)

1. Install Xcode
2. In Expo DevTools, click "Run on iOS simulator"

### Step 5: Testing on Physical Device with Your Computer's IP

If the app doesn't connect to the backend, update the IP address:

1. **Find Your Computer's IP Address**:
   - Open Command Prompt
   - Type: `ipconfig`
   - Look for "IPv4 Address" (e.g., 192.168.1.100)

2. **Update Mobile Config**:
   - Open `mobile/src/config/config.js`
   - Replace `localhost` with your IP:
   ```javascript
   export const API_URL = 'http://192.168.1.100:3000/api';
   export const SOCKET_URL = 'http://192.168.1.100:3000';
   ```

3. **Restart Expo**:
   - Press Ctrl+C in the mobile terminal
   - Run `npm start` again

## 🎯 How to Use the App

### First Time Setup

1. **Register an Account**:
   - Open the app
   - Click "Register"
   - Enter username, email, and password
   - Click "Register"

2. **Login** (for second user testing):
   - You can register another account on a different phone
   - Or use the web browser to register another user via the API

3. **Start Chatting**:
   - Click the "+" button on the chat list screen
   - Select a user from the list
   - Start sending messages!

### Features to Try

- ✅ Send text messages
- ✅ Send images (click 📎 button)
- ✅ Send files (click 📎 button)
- ✅ See typing indicators
- ✅ See online/offline status
- ✅ Search for users

## 📁 Project Structure

```
message/
├── backend/                  # Node.js Backend
│   ├── config/              # Database configuration
│   ├── database/            # SQL schema
│   ├── middleware/          # Authentication middleware
│   ├── routes/              # API routes
│   ├── socket/              # Socket.IO handlers
│   ├── uploads/             # Uploaded files storage
│   ├── .env                 # Environment variables (your credentials)
│   ├── server.js            # Main server file
│   └── package.json         # Backend dependencies
│
└── mobile/                   # React Native Mobile App
    ├── src/
    │   ├── config/          # API configuration
    │   ├── context/         # React Context (Auth, Socket)
    │   └── screens/         # App screens
    ├── App.js               # Main app component
    ├── app.json             # Expo configuration
    └── package.json         # Mobile dependencies
```

## 🔧 Configuration Files

### Backend (.env)
```
PORT=3000
DB_HOST=localhost
DB_USER=message
DB_PASSWORD=Emmanuel?s3
DB_NAME=messanger
JWT_SECRET=my_super_secret_jwt_key_12345_change_in_production
```

### Mobile (src/config/config.js)
```javascript
export const API_URL = 'http://localhost:3000/api';
export const SOCKET_URL = 'http://localhost:3000';
```

## 🐛 Troubleshooting

### Backend Issues

**Problem**: Database connection failed
- ✅ Make sure WAMP is running
- ✅ Check database credentials in `.env`
- ✅ Verify database exists in phpMyAdmin

**Problem**: Port 3000 already in use
- Change `PORT=3001` in `.env` file
- Update mobile config to use new port

### Mobile App Issues

**Problem**: Network request failed
- ✅ Check if backend server is running
- ✅ Update IP address in `mobile/src/config/config.js`
- ✅ Make sure phone and computer are on same WiFi

**Problem**: Expo won't start
- Run: `npm install -g expo-cli` again
- Clear cache: `expo start -c`

**Problem**: Can't scan QR code
- Try the tunnel option: `expo start --tunnel`
- Or manually enter the URL in Expo Go app

### Common Beginner Mistakes

1. ❌ Forgetting to start backend server
   - ✅ Always run `npm start` in backend folder first

2. ❌ Different WiFi networks
   - ✅ Phone and computer must be on same network

3. ❌ Using localhost on physical device
   - ✅ Use your computer's IP address instead

4. ❌ MySQL not running
   - ✅ Start WAMP server before running backend

## 📱 Testing the App

### Test Scenario 1: Single Device
1. Register user 1 on your phone
2. Register user 2 via API or browser
3. Login as user 1
4. Send messages to user 2

### Test Scenario 2: Two Devices
1. Install app on two phones
2. Register different users on each
3. Start chatting in real-time!

### Using API Directly (Postman/Browser)

Register a second user via API:
```bash
POST http://localhost:3000/api/auth/register
Content-Type: application/json

{
  "username": "testuser2",
  "email": "test2@example.com",
  "password": "password123"
}
```

## 🔐 Security Notes

⚠️ **For Learning/Development Only**

This app is designed for learning. Before using in production:

- Change JWT_SECRET to a strong random string
- Use HTTPS instead of HTTP
- Add password strength requirements
- Implement rate limiting
- Add input sanitization
- Use environment variables for sensitive data
- Add file type/size validation
- Implement proper error handling
- Add data encryption

## 📚 API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user

### Users
- `GET /api/users` - Get all users
- `GET /api/users/:id` - Get user by ID
- `GET /api/users/search/:query` - Search users
- `PUT /api/users/status` - Update user status

### Messages
- `GET /api/messages/conversations` - Get all conversations
- `GET /api/messages/conversation/:userId` - Get messages with user
- `POST /api/messages/send` - Send text message
- `POST /api/messages/send-file` - Send file/image
- `PUT /api/messages/read/:messageId` - Mark message as read
- `DELETE /api/messages/:messageId` - Delete message

### Socket.IO Events

**Client → Server**:
- `authenticate` - Authenticate socket connection
- `send_message` - Send real-time message
- `typing` - User is typing
- `stop_typing` - User stopped typing
- `mark_as_read` - Mark message as read

**Server → Client**:
- `authenticated` - Authentication successful
- `new_message` - New message received
- `message_sent` - Message sent confirmation
- `user_typing` - User is typing
- `user_stop_typing` - User stopped typing
- `user_status_changed` - User online/offline status changed
- `message_read` - Message was read

## 🎓 Learning Resources

- [Node.js Documentation](https://nodejs.org/docs/)
- [Express.js Guide](https://expressjs.com/guide/)
- [React Native Documentation](https://reactnative.dev/docs/getting-started)
- [Expo Documentation](https://docs.expo.dev/)
- [Socket.IO Documentation](https://socket.io/docs/)
- [MySQL Tutorial](https://www.mysqltutorial.org/)

## 🤝 Need Help?

If you encounter any issues:

1. Check the troubleshooting section above
2. Read error messages carefully
3. Verify all prerequisites are installed
4. Make sure both backend and mobile servers are running
5. Check that your database is set up correctly

## 📝 Next Steps / Enhancements

Want to add more features? Try:

- [ ] Group chat functionality
- [ ] Voice messages
- [ ] Video calls
- [ ] Message encryption
- [ ] Push notifications
- [ ] Profile pictures upload
- [ ] Message reactions (emoji)
- [ ] Message forwarding
- [ ] Block/unblock users
- [ ] Dark mode
- [ ] Message search
- [ ] Media gallery
- [ ] Last seen timestamp

## 📄 License

This project is created for educational purposes. Feel free to use and modify as needed.

---

**Happy Coding! 🚀**

Made with ❤️ for beginners learning mobile app development
