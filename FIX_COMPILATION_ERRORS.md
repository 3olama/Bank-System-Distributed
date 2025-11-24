# 🔧 Fix Compilation Errors

## ✅ Fixed: Conn.java MySQL Import Error

**Problem:** `error: package com.mysql does not exist`

**Solution:** ✅ **FIXED** - Removed incorrect import from `Conn.java`

The JDBC driver doesn't need an explicit MySQL import. The DriverManager automatically finds it when the JDBC driver JAR is in the classpath.

---

## ⚠️ Action Required: Download JCalendar Library

**Problem:** `error: package com.toedter.calendar does not exist`

**Solution:** Download and add JCalendar library to `lib` folder

### Step 1: Download JCalendar Library

**Option A: Direct Download (Recommended)**
1. Go to: **https://mvnrepository.com/artifact/com.toedter/jcalendar/1.4**
2. Click on version **1.4** (or latest)
3. Scroll down to "Files"
4. Download: **`jcalendar-1.4.jar`**
5. OR download from: **https://jar-download.com/artifacts/com.toedter/jcalendar**

**Option B: Alternative Download Sites**
- **https://jar-download.com/** - Search for "jcalendar"
- **https://repo1.maven.org/maven2/com/toedter/jcalendar/** - Direct Maven repository

**Option C: If you need the exact version (jcalendar-tz-1.3.3-4.jar)**
- Search for: "jcalendar-tz-1.3.3-4.jar download"
- Or use: **https://jar-download.com/artifacts/com.toedter/jcalendar**

### Step 2: Add JAR to lib Folder

1. Copy the downloaded JAR file (e.g., `jcalendar-1.4.jar`)
2. Place it in: `lib/jcalendar-1.4.jar`

**Your lib folder should now have:**
```
lib/
├── mysql-connector-java-8.0.28.jar
└── jcalendar-1.4.jar  ← Add this
```

### Step 3: Update compile_and_run.bat

The batch script has been updated to automatically include JCalendar if it exists.

---

## 🚀 Quick Fix Steps

1. ✅ **Conn.java fixed** - MySQL import removed
2. ⚠️ **Download JCalendar** - Get `jcalendar-1.4.jar` (or `jcalendar-tz-1.3.3-4.jar`)
3. ⚠️ **Place in lib folder** - `lib/jcalendar-1.4.jar`
4. ✅ **Run again** - `.\compile_and_run.bat`

---

## 📝 Manual Compilation (If Needed)

If you want to compile manually:

```powershell
cd src
javac -cp ".;../lib/mysql-connector-java-8.0.28.jar;../lib/jcalendar-1.4.jar" atm/simulator/system/*.java
cd ..
java -cp "src;lib/mysql-connector-java-8.0.28.jar;lib/jcalendar-1.4.jar;icons" atm.simulator.system.Login
```

**Note:** Replace `jcalendar-1.4.jar` with the actual filename you downloaded.

---

## ✅ Verification

After downloading JCalendar:

1. **Check lib folder:**
   ```powershell
   dir lib\*.jar
   ```
   Should show both MySQL connector and JCalendar JARs

2. **Try compiling again:**
   ```powershell
   .\compile_and_run.bat
   ```

3. **Expected:** Compilation successful with no errors!

---

## 🔍 Still Having Issues?

**If JCalendar download link doesn't work:**
1. Search Google: "jcalendar jar download"
2. Look for Maven Central or jar-download.com
3. Download any version 1.3+ (compatible with the code)

**If you can't find JCalendar:**
- You can modify `SignupOne.java` to use a simple text field for date input instead
- But downloading JCalendar is the recommended solution

---

## 📋 Summary

**Fixed:**
- ✅ Removed incorrect `import com.mysql.*;` from Conn.java

**You Need To:**
- ⚠️ Download JCalendar library (jcalendar-1.4.jar or similar)
- ⚠️ Place it in `lib/` folder

**Then:**
- ✅ Run `.\compile_and_run.bat` again

