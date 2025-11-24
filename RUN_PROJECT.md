# 🚀 How to Run ATM Simulator Project

## ⚡ FASTEST WAY (3 Steps)

### Step 1: Install Java (Required)

**Download Java JDK:**
- Go to: https://www.oracle.com/java/technologies/downloads/
- Download "Windows x64 Installer" (JDK 21 or JDK 17)
- Install it (accept defaults)

**Add Java to PATH:**
1. Find Java installation folder: `C:\Program Files\Java\jdk-XX`
2. Copy this path
3. Press `Windows + R`, type `sysdm.cpl`, press Enter
4. Go to "Advanced" tab → "Environment Variables"
5. Under "System Variables", find "Path" → Click "Edit"
6. Click "New" → Paste: `C:\Program Files\Java\jdk-XX\bin` (replace XX with your version)
7. Click OK on all windows
8. **Restart PowerShell/Command Prompt**

**Verify:**
```powershell
java -version
```
Should show Java version (not an error)

---

### Step 2: Set Up MySQL Database

**Option A: Using MySQL Workbench (Easiest)**
1. Open MySQL Workbench
2. Connect to your MySQL server (usually "root" user)
3. Click "File" → "Open SQL Script"
4. Select: `sql/ATM_Simulator.sql`
5. Click the "Execute" button (⚡ lightning bolt icon)
6. Verify success message

**Option B: Using Command Line**
```powershell
mysql -u root -p < sql/ATM_Simulator.sql
```
(Enter your MySQL password when prompted)

---

### Step 3: Update Database Password

**Edit:** `src/atm/simulator/system/Conn.java`

**Current (line 13):**
```java
String password = "";  // Empty password
```

**Change to your MySQL password:**
```java
String password = "your_mysql_password";  // Replace with your actual password
```

**Examples:**
- If MySQL password is "root": `String password = "root";`
- If MySQL has no password: Keep as `String password = "";`
- If different username: Also update line 12

**Save the file!**

---

### Step 4: Run the Application

**Option A: Use Batch Script (Easiest)**
```powershell
.\compile_and_run.bat
```

**Option B: Manual Commands**
```powershell
# Compile
cd src
javac -cp ".;../lib/mysql-connector-java-8.0.28.jar" atm/simulator/system/*.java
cd ..

# Run
java -cp "src;lib/mysql-connector-java-8.0.28.jar;icons" atm.simulator.system.Login
```

---

## ✅ Success!

If everything works:
- ✅ Login window appears: "Welcome to E-Bank ATM"
- ✅ No errors in terminal
- ✅ Can click "Sign Up" button

---

## 🎯 First Time Using?

1. **Click "Sign Up"** → Create new account
2. **Complete registration** → Fill all 3 steps
3. **Note your Card Number and PIN**
4. **Login** → Use Card Number and PIN
5. **Use features:**
   - Deposit money
   - Withdraw money
   - Check balance
   - View mini statement

---

## 🚨 Troubleshooting

| Problem | Solution |
|---------|----------|
| `java is not recognized` | Install Java JDK and add to PATH (see Step 1) |
| `ClassNotFoundException` | JDBC driver is already in `lib/` folder ✓ |
| `Access denied for user` | Update password in `Conn.java` (Step 3) |
| `Unknown database` | Run SQL script in MySQL (Step 2) |
| `Connection refused` | Start MySQL server |

---

## 📋 Quick Checklist

Before running:
- [ ] Java installed and in PATH (`java -version` works)
- [ ] MySQL server running
- [ ] Database created (ran `ATM_Simulator.sql`)
- [ ] Password updated in `Conn.java`
- [ ] JDBC driver in `lib/` folder ✓ (Already done!)

---

## 💡 Current Status

✅ **Already Done:**
- JDBC driver organized in `lib/` folder
- All files verified
- Batch script ready

⚠️ **You Need To:**
1. Install Java and add to PATH
2. Set up MySQL database
3. Update password in `Conn.java`

---

## 🎬 Ready to Run?

Once Java is installed and database is set up:

```powershell
.\compile_and_run.bat
```

That's it! 🎉

