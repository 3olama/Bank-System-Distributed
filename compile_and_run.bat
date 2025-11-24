@echo off
setlocal enabledelayedexpansion

echo ========================================
echo ATM Simulator - Compile and Run Script
echo ========================================
echo.

set JDBC_DRIVER=mysql-connector-java-8.0.28.jar
set JCALENDAR_JAR=jcalendar-1.4.jar

if not exist "lib" (
    echo ERROR: lib folder not found!
    pause
    exit /b 1
)

if not exist "lib\%JDBC_DRIVER%" (
    echo ERROR: JDBC driver not found at lib\%JDBC_DRIVER%
    pause
    exit /b 1
)

set JCALENDAR_PATH=
if exist "lib\%JCALENDAR_JAR%" (
    set JCALENDAR_PATH=../lib/%JCALENDAR_JAR%
)

if "!JCALENDAR_PATH!"=="" (
    for %%f in (lib\jcalendar*.jar) do (
        if "!JCALENDAR_PATH!"=="" set "JCALENDAR_PATH=../lib/%%~nxf"
    )
)

if "!JCALENDAR_PATH!"=="" (
    echo WARNING: JCalendar library not found!
    echo Download jcalendar-1.4.jar and place in lib folder.
    echo.
)

echo [1/3] Compiling Java source files...
cd src

set CLASSPATH=.;../lib/%JDBC_DRIVER%
if not "!JCALENDAR_PATH!"=="" (
    set "CLASSPATH=!CLASSPATH!;!JCALENDAR_PATH!"
)

javac -cp "%CLASSPATH%" atm/simulator/system/*.java

if errorlevel 1 (
    echo.
    echo ERROR: Compilation failed!
    cd ..
    pause
    exit /b 1
)

echo Compilation successful!
echo.
cd ..

echo [2/3] Checking files...
if not exist "src\atm\simulator\system\Conn.java" (
    echo ERROR: Conn.java not found!
    pause
    exit /b 1
)

echo [3/3] Starting ATM Simulator...
echo.

set RUNTIME_CP=src;lib/%JDBC_DRIVER%;icons
REM Add JCalendar to runtime classpath if it exists
if exist "lib\%JCALENDAR_JAR%" (
    set "RUNTIME_CP=!RUNTIME_CP!;lib/%JCALENDAR_JAR%"
) else (
    for %%f in (lib\jcalendar*.jar) do (
        set "RUNTIME_CP=!RUNTIME_CP!;lib/%%~nxf"
    )
)

java -cp "%RUNTIME_CP%" atm.simulator.system.Login

if errorlevel 1 (
    echo.
    echo ERROR: Failed to start application!
    echo Check MySQL server and database setup.
    echo.
    pause
    exit /b 1
)

pause
