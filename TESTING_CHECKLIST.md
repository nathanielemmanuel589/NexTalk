# 🧪 NEXTALK TESTING CHECKLIST

## 🎯 SETUP STEPS (DO THESE FIRST!)

### ✅ STEP 1: Run Database Updates
1. Open phpMyAdmin: http://localhost/phpmyadmin
2. Select database: **messanger**
3. Click **SQL** tab
4. Copy all code from: `backend/database/update-schema.sql`
5. Paste and click **Go**
6. ✅ Verify you see success messages

### ✅ STEP 2: Restart Backend Server
```bash
# In backend terminal:
Ctrl + C
npm start
```
✅ Should see: "Server running on port 3000"

### ✅ STEP 3: Reload Mobile App
- Shake phone OR press **r** in Expo
- Wait for reload to complete

---

## 📋 FEATURE TESTING

### 1️⃣ EDIT MESSAGES ✏️

**Test Case 1: Edit within 10 minutes**
- [ ] Send text message: "Hello"
- [ ] Long press message
- [ ] See "Edit Message" option
- [ ] Click "Edit Message"
- [ ] Change to "Hello World!"
- [ ] Click Save
- [ ] ✅ Message updates
- [ ] ✅ See "Edited" tag below message
- [ ] ✅ Other user sees updated message + "Edited" tag

**Test Case 2: Try edit after 10 minutes**
- [ ] Wait 11 minutes after sending a message
- [ ] Long press message
- [ ] ❌ Should NOT see "Edit Message" option
- [ ] ✅ Only see Copy, Delete for Me, Add Reaction

**Test Case 3: Try edit image message**
- [ ] Send an image
- [ ] Long press image
- [ ] ❌ Should NOT see "Edit Message" option
- [ ] ✅ Can only edit text messages

**Test Case 4: Edit empty message**
- [ ] Send message "Test"
- [ ] Long press → Edit Message
- [ ] Delete all text (empty)
- [ ] Click Save
- [ ] ❌ Should show error: "Message cannot be empty"

---

### 2️⃣ DELETE FOR EVERYONE 🗑️

**Test Case 1: Delete for everyone within 10 minutes**
- [ ] Send message: "Delete this"
- [ ] Long press message
- [ ] See "Delete for Everyone" option
- [ ] Click "Delete for Everyone"
- [ ] Confirm deletion
- [ ] ✅ Your chat shows: "🚫 This message was deleted"
- [ ] ✅ Other user's chat shows: "🚫 This message was deleted"

**Test Case 2: Delete for everyone after 10 minutes**
- [ ] Wait 11 minutes after sending
- [ ] Long press message
- [ ] ❌ Should NOT see "Delete for Everyone"
- [ ] ✅ Only see "Delete for Me"

**Test Case 3: Delete for me (no time limit)**
- [ ] Send message "Old message"
- [ ] Wait 15 minutes
- [ ] Long press → "Delete for Me"
- [ ] ✅ Message removed from YOUR chat only
- [ ] ✅ Other user still sees it

**Test Case 4: Delete image/file for everyone**
- [ ] Send an image
- [ ] Long press → Delete for Everyone
- [ ] ✅ Image disappears from both chats
- [ ] ✅ Shows "🚫 This message was deleted"

**Test Case 5: Other user can't delete your messages**
- [ ] User A sends message
- [ ] User B long presses it
- [ ] ❌ Should NOT see "Delete for Everyone" or "Delete for Me"
- [ ] ✅ Only see Copy and Add Reaction

---

### 3️⃣ MESSAGE REACTIONS 😍

**Test Case 1: Add single reaction**
- [ ] Long press any message
- [ ] Click "❤️ Add Reaction"
- [ ] Choose ❤️
- [ ] ✅ See ❤️ bubble appear below message
- [ ] ✅ Other user sees ❤️ instantly

**Test Case 2: Add multiple different reactions**
- [ ] User A adds ❤️ to message
- [ ] User B adds 👍 to same message
- [ ] ✅ Both reactions visible: ❤️ 👍
- [ ] ✅ Each reaction shows separately

**Test Case 3: Multiple users same reaction (counter)**
- [ ] User A adds ❤️
- [ ] User B also adds ❤️ to same message
- [ ] ✅ Shows: ❤️ 2
- [ ] ✅ Counter increments

**Test Case 4: Remove your reaction**
- [ ] Add ❤️ to message
- [ ] Tap the ❤️ bubble
- [ ] ✅ Your reaction removed
- [ ] ✅ Bubble disappears (or counter decreases)
- [ ] ✅ Other user sees update

**Test Case 5: Toggle reaction (add/remove)**
- [ ] Tap ❤️ bubble (you haven't reacted)
- [ ] ✅ Adds your ❤️
- [ ] Tap ❤️ bubble again
- [ ] ✅ Removes your ❤️

**Test Case 6: Change your reaction**
- [ ] Add ❤️ to message
- [ ] Long press → Add Reaction → Choose 👍
- [ ] ✅ Should replace ❤️ with 👍
- [ ] ✅ Each user can only have 1 reaction per message

**Test Case 7: React to deleted message**
- [ ] Delete message for everyone
- [ ] Long press deleted message placeholder
- [ ] ❌ Should not open menu (can't interact with deleted messages)

**Test Case 8: All reaction types**
- [ ] Test each emoji: ❤️ 👍 😂 😮 😢 🙏
- [ ] ✅ All should work
- [ ] ✅ All should display correctly

**Test Case 9: Reactions + Edited message**
- [ ] Send message
- [ ] User A adds ❤️
- [ ] User B edits the message
- [ ] ✅ Reaction should stay
- [ ] ✅ "Edited" tag should show

---

## 🔄 EXISTING FEATURES (SHOULD STILL WORK!)

### ✅ Messaging
- [ ] Send text message
- [ ] Send image
- [ ] Send file (PDF, DOC, etc.)
- [ ] All messages deliver correctly

### ✅ Read Receipts
- [ ] Send message
- [ ] ✅ Shows ✓ (sent)
- [ ] Other user opens chat
- [ ] ✅ Shows ✓✓ (read)

### ✅ Copy Messages
- [ ] Long press text message
- [ ] Click "Copy Message"
- [ ] ✅ Copied to clipboard
- [ ] Paste somewhere to verify

### ✅ Avatars
- [ ] Open chat list
- [ ] ✅ All avatars show colorful circles with initials
- [ ] Open chat screen
- [ ] ✅ No avatars missing

### ✅ Profile
- [ ] Open profile
- [ ] ✅ Full name shows
- [ ] ✅ Bio shows
- [ ] ✅ Profile picture (if uploaded)
- [ ] Edit profile
- [ ] ✅ Changes save correctly

### ✅ Settings
- [ ] Click ⚙️ settings button
- [ ] ✅ Settings page opens
- [ ] ✅ Profile section works
- [ ] ✅ Change password works
- [ ] ✅ Logout works

### ✅ Online Status
- [ ] User A online → shows "Connected" in chat list
- [ ] User A closes app → shows "offline" or last seen

### ✅ Typing Indicator
- [ ] User A types
- [ ] User B sees "username is typing..."
- [ ] User A stops typing
- [ ] ✅ Indicator disappears

### ✅ Unread Count
- [ ] User A sends 3 messages to User B
- [ ] User B chat list shows (3) badge
- [ ] User B opens chat
- [ ] ✅ Badge disappears

---

## 🚨 ERROR SCENARIOS (SHOULD HANDLE GRACEFULLY)

### Network Errors
- [ ] Turn off WiFi
- [ ] Try sending message
- [ ] ❌ Should show error alert
- [ ] ✅ App doesn't crash

### Socket Disconnection
- [ ] Close backend server
- [ ] Try sending message
- [ ] ✅ Should try HTTP fallback OR show error
- [ ] ✅ App doesn't crash

### Invalid Actions
- [ ] Try editing someone else's message (shouldn't be possible)
- [ ] Try deleting someone else's message (shouldn't be possible)
- [ ] ✅ No crashes, proper restrictions

---

## 📊 PERFORMANCE CHECK

- [ ] App loads smoothly
- [ ] Messages scroll smoothly
- [ ] No lag when adding reactions
- [ ] No lag when editing messages
- [ ] No memory leaks (app doesn't slow down over time)

---

## ✅ FINAL VERIFICATION

### Both Users Online
- [ ] User A and User B both logged in
- [ ] User A sends message → User B receives instantly
- [ ] User A edits message → User B sees edit instantly
- [ ] User A deletes for everyone → User B sees deletion instantly
- [ ] User A adds reaction → User B sees reaction instantly

### Backend Logs
```bash
# Check backend terminal for:
✅ ✏️ Message edited: <id> by <username>
✅ 🗑️ Message deleted for everyone: <id> by <username>
✅ ❤️ Reaction added: ❤️ to message <id> by <username>
✅ 💔 Reaction removed: ❤️ from message <id> by <username>
```

### Database Verification
```sql
-- Check if columns exist
DESCRIBE messages;
-- Should see: edited_at, is_deleted

-- Check reactions table
SELECT * FROM message_reactions;
-- Should show reactions
```

---

## 🎉 SUCCESS CRITERIA

✅ All 3 new features work perfectly  
✅ No existing features broken  
✅ Real-time updates work via Socket.IO  
✅ Time limits enforced (10 minutes)  
✅ Proper error messages shown  
✅ App doesn't crash under any scenario  
✅ Both users see changes instantly  
✅ Database stores everything correctly  

---

## 🐛 IF SOMETHING DOESN'T WORK

### Backend Issues
1. Check backend terminal for errors
2. Make sure port 3000 is not blocked
3. Verify database columns added correctly:
   ```sql
   SHOW COLUMNS FROM messages LIKE 'edited_at';
   SHOW COLUMNS FROM messages LIKE 'is_deleted';
   SHOW TABLES LIKE 'message_reactions';
   ```

### Mobile Issues
1. Shake phone → Reload
2. Check Expo terminal for errors
3. Make sure IP address matches (172.20.10.1)
4. Check if socket connected (look for "authenticated" log)

### Socket Not Working
1. Check backend: "Socket.IO listening"
2. Check mobile: Socket connected?
3. Verify SOCKET_URL in config: `172.20.10.1:3000`

---

**Testing Date:** _________________  
**Tester:** _________________  
**Result:** ⬜ PASS  ⬜ FAIL  
**Notes:** _____________________________________

