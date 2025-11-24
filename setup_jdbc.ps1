# PowerShell script to help set up MySQL JDBC Driver
# Run this script to check your JDBC setup

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "MySQL JDBC Driver Setup Checker" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if lib folder exists
if (-not (Test-Path "lib")) {
    Write-Host "Creating lib folder..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path "lib" | Out-Null
    Write-Host "✓ lib folder created" -ForegroundColor Green
} else {
    Write-Host "✓ lib folder exists" -ForegroundColor Green
}

# Check for JDBC driver JAR files
Write-Host ""
Write-Host "Checking for MySQL JDBC driver..." -ForegroundColor Yellow
$jarFiles = Get-ChildItem -Path "lib" -Filter "*.jar" -ErrorAction SilentlyContinue

if ($jarFiles.Count -eq 0) {
    Write-Host "✗ No JDBC driver found in lib folder!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "1. Download MySQL Connector/J from:" -ForegroundColor White
    Write-Host "   https://dev.mysql.com/downloads/connector/j/" -ForegroundColor Cyan
    Write-Host "2. Extract the ZIP file" -ForegroundColor White
    Write-Host "3. Copy the JAR file (e.g., mysql-connector-j-8.0.33.jar) to the lib folder" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host "✓ Found JDBC driver(s):" -ForegroundColor Green
    foreach ($jar in $jarFiles) {
        Write-Host "  - $($jar.Name)" -ForegroundColor White
    }
    Write-Host ""
    
    # Check if Java is installed
    Write-Host "Checking Java installation..." -ForegroundColor Yellow
    try {
        $javaVersion = java -version 2>&1 | Select-Object -First 1
        Write-Host "✓ Java is installed" -ForegroundColor Green
        Write-Host "  $javaVersion" -ForegroundColor Gray
    } catch {
        Write-Host "✗ Java not found!" -ForegroundColor Red
        Write-Host "  Please install Java JDK 8 or higher" -ForegroundColor Yellow
    }
    
    Write-Host ""
    Write-Host "JDBC Setup Summary:" -ForegroundColor Cyan
    Write-Host "===================" -ForegroundColor Cyan
    Write-Host "✓ lib folder: OK" -ForegroundColor Green
    Write-Host "✓ JDBC driver: Found" -ForegroundColor Green
    Write-Host ""
    Write-Host "To compile and run:" -ForegroundColor Yellow
    Write-Host "  cd src" -ForegroundColor White
    Write-Host "  javac -cp `".;../lib/$($jarFiles[0].Name)`" atm/simulator/system/*.java" -ForegroundColor Cyan
    Write-Host "  cd .." -ForegroundColor White
    Write-Host "  java -cp `"src;lib/$($jarFiles[0].Name);icons`" atm.simulator.system.Login" -ForegroundColor Cyan
    Write-Host ""
}

Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

