# 🚀 QUICK START GUIDE - Run Your Project NOW!

## ⚡ Quick Status Check

I've already organized your files:
- ✅ Created `lib` folder
- ✅ Moved JDBC driver to `lib/mysql-connector-java-8.0.28.jar`

## 📋 Before You Run - 3 Critical Steps

### 1. Install Java (if not installed)
**Check:** Open PowerShell and type: `java -version`

**If error appears:**
- Download: https://www.oracle.com/java/technologies/downloads/
- Install Java JDK
- Add to PATH (see VERIFICATION_AND_STEPS.md for details)

### 2. Set Up MySQL Database
**Required actions:**
- Start MySQL server
- Open MySQL Workbench
- Run the SQL script: `sql/ATM_Simulator.sql`
- Verify database `bank_management_system` exists

**Quick SQL command:**
```sql
-- In MySQL Workbench, run:
source C:/Users/mohap/Music/7_PRO/bankManagementSystem-main/sql/ATM_Simulator.sql;
```

### 3. Configure Database Password
**Current issue:** `Conn.java` has empty password (line 13)

**Fix it:**
- Open: `src/atm/simulator/system/Conn.java`
- Line 13 currently shows: `String password = "";`
- Change to your MySQL root password:
  ```java
  String password = "your_mysql_password";  // Replace with your actual password
  ```
- If MySQL root has no password, keep it as `""`
- If your MySQL username is different, also update line 12

---

## 🎯 Run Commands (Copy & Paste)

### Option 1: Compile and Run (Step by Step)

**Step 1 - Compile:**
```powershell
cd src
javac -cp ".;../lib/mysql-connector-java-8.0.28.jar" atm/simulator/system/*.java
```

**Step 2 - Run:**
```powershell
cd ..
java -cp "src;lib/mysql-connector-java-8.0.28.jar;icons" atm.simulator.system.Login
```

### Option 2: Use Batch Script

1. Open `compile_and_run.bat` in Notepad
2. Check line with `JDBC_DRIVER` variable (should be `mysql-connector-java-8.0.28.jar`)
3. Save and double-click the file

### Option 3: One-Line Run (If Already Compiled)

```powershell
java -cp "src;lib/mysql-connector-java-8.0.28.jar;icons" atm.simulator.system.Login
```

---

## ✅ Expected Result

When successful:
- ✅ Login window appears with "Welcome to E-Bank ATM"
- ✅ No errors in terminal
- ✅ Can click "Sign Up" to create account
- ✅ Can login with credentials

---

## 🚨 Common Issues & Quick Fixes

| Error | Quick Fix |
|-------|-----------|
| `java is not recognized` | Install Java JDK and add to PATH |
| `ClassNotFoundException` | Verify JDBC JAR is in `lib` folder |
| `Access denied` | Update password in `Conn.java` |
| `Unknown database` | Run `sql/ATM_Simulator.sql` in MySQL |
| `Connection refused` | Start MySQL server |

---

## 📝 File Checklist

Verify these files exist:
- ✅ `lib/mysql-connector-java-8.0.28.jar` ← JDBC driver
- ✅ `src/atm/simulator/system/Login.java` ← Main file
- ✅ `src/atm/simulator/system/Conn.java` ← Database config
- ✅ `sql/ATM_Simulator.sql` ← Database script
- ✅ `icons/logo.jpg` ← App icon

---

## 🎓 First Time Using the App?

1. **Click "Sign Up"** - Create a new bank account
2. **Fill registration form** - Complete all 3 signup steps
3. **Note your Card Number and PIN** - You'll need these to login
4. **Login** - Use your Card Number and PIN
5. **Explore features:**
   - Deposit money
   - Withdraw money
   - Fast Cash
   - Check Balance
   - Change PIN
   - View Mini Statement

---

## 📚 More Details

For detailed troubleshooting and step-by-step instructions, see:
- `VERIFICATION_AND_STEPS.md` - Complete guide
- `JDBC_SETUP_GUIDE.md` - JDBC specific help

---

## 💡 Pro Tip

**Test database connection first:**
```powershell
# Quick test - compile Conn.java only
cd src
javac -cp ".;../lib/mysql-connector-java-8.0.28.jar" atm/simulator/system/Conn.java
cd ..
java -cp "src;lib/mysql-connector-java-8.0.28.jar" atm.simulator.system.Conn
```

If no errors, database connection works!

