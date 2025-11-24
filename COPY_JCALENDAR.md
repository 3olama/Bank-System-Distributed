# Copy Your Existing JCalendar to lib Folder

## Why JCalendar is Needed

The project code **already uses JCalendar** - it's not something added, it's in the original code:
- `SignupOne.java` line 9: `import com.toedter.calendar.JDateChooser;`
- `SignupOne.java` line 17: `JDateChooser dobDC;`
- `SignupOne.java` line 64: `dobDC = new JDateChooser();`

This is the date picker component used in the signup form.

## If You Have JCalendar Already

If you have `jcalendar*.jar` somewhere on your computer:

1. **Find it** - Check:
   - Eclipse workspace folders
   - Other project folders
   - Downloads folder

2. **Copy it to lib folder:**
   ```powershell
   # Example: If you have it at C:\path\to\jcalendar-1.3.3-4.jar
   Copy-Item "C:\path\to\jcalendar*.jar" -Destination "lib\"
   ```

3. **Or manually:**
   - Find the JAR file
   - Copy it
   - Paste into: `lib\` folder
   - Name it: `jcalendar-1.3.3-4.jar` or `jcalendar-1.4.jar` (any name starting with jcalendar works)

## If You Don't Have It

Download from:
- **https://repo1.maven.org/maven2/com/toedter/jcalendar/1.4/jcalendar-1.4.jar**
- Or search: "jcalendar jar download"

## Verify

After copying/downloading:

```powershell
dir lib\jcalendar*.jar
```

Should show the JAR file. Then run:

```powershell
.\compile_and_run.bat
```

