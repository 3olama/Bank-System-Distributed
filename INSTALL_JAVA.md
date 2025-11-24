# 🔧 Fix: 'javac' is not recognized - Install Java JDK

## ❌ Problem
You're getting this error:
```
'javac' is not recognized as an internal or external command,
operable program or batch file.
```

This means **Java JDK is not installed** or **not in your system PATH**.

---

## ✅ Solution: Install Java JDK

### Option 1: Download from Oracle (Recommended)

**Step 1: Download Java JDK**
1. Go to: **https://www.oracle.com/java/technologies/downloads/**
2. Click on **"Java 21"** or **"Java 17"** (LTS versions)
3. Under "Windows", select **"x64 Installer"**
4. Click download (you may need to create free Oracle account)
5. Run the downloaded `.exe` file

**Step 2: Install Java**
- Click "Next" through the installation
- **Note the installation path** (usually: `C:\Program Files\Java\jdk-21` or `jdk-17`)
- Complete the installation

**Step 3: Add Java to PATH**

**Method A: Automatic (Recommended)**
- During installation, make sure **"Add to PATH"** option is checked
- If you missed it, reinstall and check this option

**Method B: Manual (If automatic didn't work)**

1. **Find Java Installation Path:**
   - Usually: `C:\Program Files\Java\jdk-21` (or `jdk-17`)
   - Or check: `C:\Program Files\Java\`

2. **Add to System PATH:**
   - Press `Windows + R`
   - Type: `sysdm.cpl` → Press Enter
   - Go to **"Advanced"** tab
   - Click **"Environment Variables"**
   - Under **"System variables"**, find and select **"Path"**
   - Click **"Edit"**
   - Click **"New"**
   - Add: `C:\Program Files\Java\jdk-21\bin` (replace with your actual JDK version)
   - Click **"OK"** on all windows

3. **Set JAVA_HOME (Optional but recommended):**
   - In "Environment Variables" window
   - Under "System variables", click **"New"**
   - Variable name: `JAVA_HOME`
   - Variable value: `C:\Program Files\Java\jdk-21` (no \bin at the end)
   - Click **"OK"**

**Step 4: Restart Terminal**
- **Close all PowerShell/Command Prompt windows**
- **Open a NEW PowerShell window**
- This is important! PATH changes only apply to new terminal sessions

**Step 5: Verify Installation**
```powershell
java -version
javac -version
```

**Expected output:**
```
java version "21.0.x" (or similar)
javac 21.0.x (or similar)
```

If you see version numbers → ✅ **Success!**

---

### Option 2: Download from Adoptium (Easier, No Account Needed)

**Step 1: Download**
1. Go to: **https://adoptium.net/**
2. Click **"Latest LTS Release"** (Java 21 or 17)
3. Select:
   - **Version:** 21 or 17
   - **Operating System:** Windows
   - **Architecture:** x64
4. Click **"Download JDK"**
5. Run the downloaded `.msi` installer

**Step 2: Install**
- Click "Next" through installation
- **Check "Add to PATH"** option
- Complete installation

**Step 3: Restart Terminal**
- Close all PowerShell/Command Prompt windows
- Open NEW PowerShell window

**Step 4: Verify**
```powershell
java -version
javac -version
```

---

## 🔍 Check Current Java Installation

**Check if Java is installed (but not in PATH):**
```powershell
# Check common installation locations
Test-Path "C:\Program Files\Java\jdk-21\bin\javac.exe"
Test-Path "C:\Program Files\Java\jdk-17\bin\javac.exe"
Test-Path "C:\Program Files\Java\jdk-11\bin\javac.exe"
```

If any return `True`, Java is installed but not in PATH. Add it manually (see Step 3 above).

---

## 🚀 After Installing Java

Once Java is installed and verified:

1. **Navigate to project folder:**
   ```powershell
   cd C:\Users\mohap\Music\7_PRO\bankManagementSystem-main
   ```

2. **Run the project:**
   ```powershell
   .\compile_and_run.bat
   ```

---

## 📝 Quick Installation Checklist

- [ ] Downloaded Java JDK (not JRE!)
- [ ] Installed JDK
- [ ] Added JDK\bin to System PATH
- [ ] Restarted terminal/PowerShell
- [ ] Verified: `java -version` works
- [ ] Verified: `javac -version` works

---

## ⚠️ Common Mistakes

1. **Installed JRE instead of JDK**
   - JRE = Java Runtime (can run Java, but can't compile)
   - JDK = Java Development Kit (can compile AND run)
   - **You need JDK!**

2. **Didn't restart terminal**
   - PATH changes only apply to NEW terminal sessions
   - Always close and reopen PowerShell/CMD

3. **Wrong PATH**
   - Must add: `C:\Program Files\Java\jdk-XX\bin`
   - NOT: `C:\Program Files\Java\jdk-XX` (missing \bin)

4. **Typo in PATH**
   - Double-check the path is correct
   - Check for spaces and backslashes

---

## 🎯 Quick Fix Script

If Java is installed but not in PATH, run this in PowerShell **as Administrator**:

```powershell
# Replace with your actual JDK path
$javaPath = "C:\Program Files\Java\jdk-21\bin"
$currentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")
if ($currentPath -notlike "*$javaPath*") {
    [Environment]::SetEnvironmentVariable("Path", "$currentPath;$javaPath", "Machine")
    Write-Host "Java added to PATH. Please restart your terminal."
} else {
    Write-Host "Java is already in PATH."
}
```

**Then restart PowerShell!**

---

## ✅ Success Test

After installation, run these commands:

```powershell
java -version
javac -version
```

Both should show version numbers. If they do → **You're ready to run the project!**

---

## 📞 Still Having Issues?

1. **Check Java installation:**
   - Look in: `C:\Program Files\Java\`
   - You should see a folder like `jdk-21` or `jdk-17`

2. **Check PATH:**
   ```powershell
   $env:Path -split ';' | Select-String "java"
   ```
   Should show Java paths

3. **Try full path:**
   ```powershell
   "C:\Program Files\Java\jdk-21\bin\javac.exe" -version
   ```
   If this works, Java is installed but not in PATH

4. **Reinstall:**
   - Uninstall Java
   - Download fresh JDK
   - Install with "Add to PATH" checked
   - Restart terminal

---

**After Java is installed, you can run:**
```powershell
.\compile_and_run.bat
```

