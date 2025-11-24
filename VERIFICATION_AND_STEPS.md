# Project Verification & Step-by-Step Run Guide

## 🔍 Current Project Status Check

### ✅ What's Good:
- ✓ All Java source files are present (12 files)
- ✓ SQL script is available
- ✓ Icons/resources are present
- ✓ JDBC driver downloaded: `mysql-connector-java-8.0.28.jar`
- ✓ Executable JAR exists

### ⚠️ Issues Found:
1. **Java not in PATH** - Java command not recognized in terminal
2. **JDBC driver location** - Should be in `lib` folder for better organization
3. **Database password** - Currently empty in `Conn.java` (line 13)
4. **Database setup** - Need to verify MySQL database is created

---

## 📋 Pre-Run Checklist

Before running the project, ensure:

- [ ] Java JDK is installed
- [ ] MySQL Server is installed and running
- [ ] MySQL database `bank_management_system` is created
- [ ] JDBC driver is properly placed
- [ ] Database credentials are configured in `Conn.java`

---

## 🚀 Step-by-Step Run Instructions

### STEP 1: Verify Java Installation

**Check if Java is installed:**

1. Open Command Prompt or PowerShell
2. Run: `java -version`
3. Run: `javac -version`

**If Java is NOT found:**
- Download Java JDK from: https://www.oracle.com/java/technologies/downloads/
- Install it
- **Add Java to PATH** (important!):
  - Find Java installation folder (usually `C:\Program Files\Java\jdk-XX`)
  - Add to System Environment Variables:
    - `JAVA_HOME` = `C:\Program Files\Java\jdk-XX`
    - Add to PATH: `%JAVA_HOME%\bin`
  - Restart terminal/PowerShell

**Verify again:**
```powershell
java -version
javac -version
```

---

### STEP 2: Set Up MySQL Database

**2.1. Start MySQL Server:**
- Open MySQL Workbench or Command Line
- Ensure MySQL service is running

**2.2. Create Database:**
- Open MySQL Workbench
- Connect to your MySQL server
- Open the file: `sql/ATM_Simulator.sql`
- Execute the entire script (or copy-paste and run)
- Verify database `bank_management_system` is created

**Alternative (Command Line):**
```bash
mysql -u root -p < sql/ATM_Simulator.sql
```

**2.3. Verify Tables Created:**
Run this query in MySQL:
```sql
USE bank_management_system;
SHOW TABLES;
```
Should show: `Customer`, `Login`, `Transactions`, `Accounts`

---

### STEP 3: Configure Database Connection

**3.1. Update Conn.java:**
- Open: `src/atm/simulator/system/Conn.java`
- **Current settings (line 12-13):**
  ```java
  String username = "root";
  String password = "";  // ← Currently empty!
  ```

**3.2. Update with YOUR MySQL credentials:**
- If your MySQL username is `root` and password is `root`, change to:
  ```java
  String username = "root";
  String password = "root";
  ```
- If different, use your actual MySQL username and password

**⚠️ Important:** Save the file after editing!

---

### STEP 4: Organize JDBC Driver

**4.1. Create lib folder:**
- In project root, create a folder named `lib` (if it doesn't exist)

**4.2. Move JDBC driver:**
- Move `mysql-connector-java-8.0.28.jar` from project root to `lib` folder
- Final location: `lib/mysql-connector-java-8.0.28.jar`

**Current structure:**
```
bankManagementSystem-main/
├── lib/                              ← Create this
│   └── mysql-connector-java-8.0.28.jar  ← Move JAR here
├── src/
├── executable/
└── ...
```

---

### STEP 5: Compile the Project

**5.1. Open PowerShell in project root:**
- Navigate to: `C:\Users\mohap\Music\7_PRO\bankManagementSystem-main`

**5.2. Compile Java files:**
```powershell
cd src
javac -cp ".;../lib/mysql-connector-java-8.0.28.jar" atm/simulator/system/*.java
```

**Expected output:**
- No errors = compilation successful
- If errors appear, check JDBC driver path and Java installation

**5.3. Go back to project root:**
```powershell
cd ..
```

---

### STEP 6: Run the Application

**Option A: Run from compiled classes (Recommended):**
```powershell
java -cp "src;lib/mysql-connector-java-8.0.28.jar;icons" atm.simulator.system.Login
```

**Option B: Use the batch script:**
1. Open `compile_and_run.bat` in a text editor
2. Update line with JDBC driver name (if different)
3. Double-click `compile_and_run.bat` or run from PowerShell:
   ```powershell
   .\compile_and_run.bat
   ```

**Option C: Run executable JAR (if JDBC is included):**
```powershell
cd executable
java -jar ATM_Simulator.jar
```

---

## 🎯 Quick Start (If Everything is Ready)

If you've completed all steps above, use this single command:

```powershell
# From project root
cd src
javac -cp ".;../lib/mysql-connector-java-8.0.28.jar" atm/simulator/system/*.java
cd ..
java -cp "src;lib/mysql-connector-java-8.0.28.jar;icons" atm.simulator.system.Login
```

---

## 🔧 Troubleshooting

### Error: "java is not recognized"
**Solution:** Java not in PATH
- Install Java JDK
- Add Java to system PATH
- Restart terminal

### Error: "ClassNotFoundException: com.mysql.cj.jdbc.Driver"
**Solution:** JDBC driver not found
- Verify JAR file is in `lib` folder
- Check filename matches in command
- Use correct path separator (`;` for Windows)

### Error: "Access denied for user 'root'@'localhost'"
**Solution:** Wrong MySQL credentials
- Check `Conn.java` has correct username/password
- Verify MySQL server is running
- Test connection in MySQL Workbench

### Error: "Unknown database 'bank_management_system'"
**Solution:** Database not created
- Run `sql/ATM_Simulator.sql` script in MySQL
- Verify database exists: `SHOW DATABASES;`

### Error: "Connection refused"
**Solution:** MySQL server not running
- Start MySQL service
- Check MySQL is listening on port 3306

### Application starts but shows errors when logging in
**Solution:** Database tables might be missing
- Run SQL script again
- Check all 4 tables exist: Customer, Login, Transactions, Accounts

---

## ✅ Final Verification

Before running, verify:
1. ✅ Java installed and in PATH (`java -version` works)
2. ✅ MySQL server running
3. ✅ Database `bank_management_system` exists
4. ✅ All 4 tables created
5. ✅ JDBC driver in `lib` folder
6. ✅ `Conn.java` has correct MySQL credentials
7. ✅ All source files compiled successfully

---

## 📝 Summary Commands

**Complete setup and run:**
```powershell
# 1. Create lib folder (if not exists)
if (-not (Test-Path "lib")) { New-Item -ItemType Directory -Path "lib" }

# 2. Move JDBC driver to lib (if still in root)
Move-Item -Path "mysql-connector-java-8.0.28.jar" -Destination "lib\" -ErrorAction SilentlyContinue

# 3. Compile
cd src
javac -cp ".;../lib/mysql-connector-java-8.0.28.jar" atm/simulator/system/*.java
cd ..

# 4. Run
java -cp "src;lib/mysql-connector-java-8.0.28.jar;icons" atm.simulator.system.Login
```

---

## 🎉 Success Indicators

When everything works:
- ✅ Login window appears
- ✅ No errors in console/terminal
- ✅ Can click "Sign Up" button
- ✅ Can login with created account
- ✅ All features work (deposit, withdraw, etc.)

---

## 📞 Need Help?

If you encounter issues:
1. Check Java version: `java -version`
2. Check MySQL is running
3. Verify database exists
4. Check JDBC driver location
5. Verify credentials in `Conn.java`
6. Review error messages for specific issues

