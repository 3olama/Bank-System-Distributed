# Download JCalendar Library

## Quick Download

The project needs JCalendar library for the date picker. Here are download options:

### Option 1: Maven Central (Recommended)
1. Go to: **https://repo1.maven.org/maven2/com/toedter/jcalendar/1.4/**
2. Download: **`jcalendar-1.4.jar`**
3. Place it in: `lib/jcalendar-1.4.jar`

### Option 2: Direct Link
- **https://repo1.maven.org/maven2/com/toedter/jcalendar/1.4/jcalendar-1.4.jar**
- Right-click → Save As
- Save to: `lib/jcalendar-1.4.jar`

### Option 3: Alternative Versions
If version 1.4 doesn't work, try:
- **1.3.3**: https://repo1.maven.org/maven2/com/toedter/jcalendar/1.3.3/jcalendar-1.3.3.jar
- **1.2.1**: https://repo1.maven.org/maven2/com/toedter/jcalendar/1.2.1/jcalendar-1.2.1.jar

### Option 4: Search for JCalendar
If links don't work:
1. Google: "jcalendar jar download"
2. Visit: https://jar-download.com/
3. Search for "jcalendar"
4. Download any version 1.2+

## After Download

1. **Copy the JAR file** to: `lib/jcalendar-1.4.jar`
2. **Verify it's there:**
   ```powershell
   dir lib\*.jar
   ```
   Should show both:
   - `mysql-connector-java-8.0.28.jar`
   - `jcalendar-1.4.jar`

3. **Run again:**
   ```powershell
   .\compile_and_run.bat
   ```

## Quick PowerShell Download (If you have internet)

Run this in PowerShell:

```powershell
$url = "https://repo1.maven.org/maven2/com/toedter/jcalendar/1.4/jcalendar-1.4.jar"
$output = "lib\jcalendar-1.4.jar"
Invoke-WebRequest -Uri $url -OutFile $output
```

This will automatically download and place the JAR in the lib folder.

