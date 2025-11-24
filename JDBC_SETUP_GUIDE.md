# MySQL JDBC Driver Setup Guide

This guide will walk you through setting up the MySQL JDBC driver for the ATM Simulator project.

## What is JDBC Driver?

JDBC (Java Database Connectivity) Driver is a JAR file that allows Java applications to connect to MySQL databases. Without it, your Java program cannot communicate with MySQL.

---

## Step 1: Download MySQL JDBC Driver

### Option A: Direct Download (Recommended)

1. **Visit the official MySQL Connector/J download page:**
   - URL: https://dev.mysql.com/downloads/connector/j/
   - Or search for "MySQL Connector/J download" in your browser

2. **Choose the appropriate version:**
   - Select your operating system (Windows)
   - Choose "Platform Independent" (ZIP Archive) - this is recommended
   - Click "Download"

3. **Select a mirror:**
   - Click "No thanks, just start my download" (or use a mirror)

4. **Extract the downloaded file:**
   - The file will be named something like: `mysql-connector-j-8.0.33.zip` (or similar)
   - Extract the ZIP file
   - Look for the JAR file inside: `mysql-connector-j-8.0.33.jar` (exact name may vary)

### Option B: Using Maven (If you have Maven installed)

If you're using Maven, add this to your `pom.xml`:
```xml
<dependency>
    <groupId>com.mysql</groupId>
    <artifactId>mysql-connector-j</artifactId>
    <version>8.0.33</version>
</dependency>
```

---

## Step 2: Create lib Folder and Add JDBC Driver

1. **Create a `lib` folder in your project root:**
   ```
   bankManagementSystem-main/
   ├── lib/                    ← Create this folder
   │   └── mysql-connector-j-8.0.33.jar  ← Place JAR here
   ├── src/
   ├── executable/
   └── ...
   ```

2. **Copy the JAR file:**
   - Copy the downloaded `mysql-connector-j-8.0.33.jar` file
   - Paste it into the `lib` folder you just created
   - The exact filename might be different (e.g., `mysql-connector-java-8.0.28.jar`), that's okay

---

## Step 3: Verify JDBC Driver Location

Your project structure should look like this:
```
bankManagementSystem-main/
├── lib/
│   └── mysql-connector-j-8.0.33.jar  ← JDBC Driver here
├── src/
│   └── atm/simulator/system/
│       └── Conn.java
├── executable/
│   └── ATM_Simulator.jar
└── ...
```

**Note:** Replace `mysql-connector-j-8.0.33.jar` with the actual name of your downloaded JAR file.

---

## Step 4: Compile with JDBC Driver

Open PowerShell or Command Prompt in the project root and run:

### For Windows PowerShell:
```powershell
# Navigate to src directory
cd src

# Compile all Java files (replace with your actual JAR filename)
javac -cp ".;../lib/mysql-connector-j-8.0.33.jar" atm/simulator/system/*.java

# Go back to project root
cd ..
```

### For Windows Command Prompt (CMD):
```cmd
cd src
javac -cp ".;..\lib\mysql-connector-j-8.0.33.jar" atm\simulator\system\*.java
cd ..
```

**Important:** Replace `mysql-connector-j-8.0.33.jar` with the actual filename of your JDBC driver JAR file.

---

## Step 5: Run the Application with JDBC Driver

### Method 1: Run from Compiled Classes

```powershell
# From project root
java -cp "src;lib/mysql-connector-j-8.0.33.jar;icons" atm.simulator.system.Login
```

### Method 2: Run Executable JAR (if JDBC is not included)

If the executable JAR doesn't include the JDBC driver:

```powershell
cd executable
java -cp "ATM_Simulator.jar;../lib/mysql-connector-j-8.0.33.jar" atm.simulator.system.Login
```

---

## Step 6: Verify JDBC Driver is Working

1. **Check if MySQL server is running**
   - Open MySQL Workbench or Command Line
   - Try to connect to your MySQL server

2. **Run the application**
   - If you see the login window, JDBC setup is successful!
   - If you get "ClassNotFoundException", go to Troubleshooting section

---

## Troubleshooting JDBC Issues

### Error 1: "ClassNotFoundException: com.mysql.cj.jdbc.Driver"

**Cause:** JDBC driver not found in classpath

**Solution:**
1. Verify the JAR file is in the `lib` folder
2. Check the filename matches what you're using in the command
3. Use the correct path separator:
   - Windows: Use semicolon `;` in classpath
   - Make sure the path is correct (relative or absolute)

**Example fix:**
```powershell
# List files in lib to verify filename
dir lib

# Then use the exact filename in your command
java -cp "src;lib/mysql-connector-j-8.0.33.jar;icons" atm.simulator.system.Login
```

### Error 2: "No suitable driver found for jdbc:mysql://..."

**Cause:** JDBC driver not loaded or incorrect connection string

**Solution:**
1. Ensure JDBC driver is in classpath (see above)
2. Check connection string in `Conn.java`
3. For older MySQL versions, you might need:
   ```java
   // In Conn.java, add before getConnection:
   Class.forName("com.mysql.cj.jdbc.Driver");
   ```

### Error 3: "Access denied" or "Connection refused"

**Cause:** Database connection issue (not JDBC driver issue)

**Solution:**
1. Check MySQL server is running
2. Verify credentials in `Conn.java`
3. Ensure database `bank_management_system` exists

---

## Quick Reference: Common JDBC Driver Filenames

Different versions of MySQL Connector/J have different names:
- `mysql-connector-j-8.0.33.jar` (newer versions)
- `mysql-connector-java-8.0.28.jar` (older naming)
- `mysql-connector-java-5.1.49.jar` (much older)

**Important:** Use the exact filename you downloaded!

---

## Alternative: Using Environment Variable (Advanced)

You can set CLASSPATH environment variable (Windows):

```powershell
# Set for current session
$env:CLASSPATH = "C:\path\to\your\project\lib\mysql-connector-j-8.0.33.jar"

# Then compile and run without -cp flag
javac src/atm/simulator/system/*.java
java atm.simulator.system.Login
```

**Note:** This is less portable and not recommended for beginners.

---

## Summary Checklist

- [ ] Downloaded MySQL JDBC driver JAR file
- [ ] Created `lib` folder in project root
- [ ] Copied JAR file to `lib` folder
- [ ] Compiled Java files with JDBC in classpath
- [ ] Ran application with JDBC in classpath
- [ ] Application starts without ClassNotFoundException

---

## Need More Help?

1. **Check Java version:** `java -version` (should be 8+)
2. **Verify JAR file:** Try opening the JAR with a ZIP tool to verify it's not corrupted
3. **Check MySQL:** Ensure MySQL server is installed and running
4. **Test connection:** Try connecting to MySQL from command line or Workbench

---

## Quick Commands Reference

```powershell
# 1. Compile (from project root)
cd src
javac -cp ".;../lib/mysql-connector-j-8.0.33.jar" atm/simulator/system/*.java

# 2. Run (from project root)
cd ..
java -cp "src;lib/mysql-connector-j-8.0.33.jar;icons" atm.simulator.system.Login

# 3. Check if JAR exists
dir lib\*.jar

# 4. Verify Java can see the driver
java -cp "lib/mysql-connector-j-8.0.33.jar" -version
```

