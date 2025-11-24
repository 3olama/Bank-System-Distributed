# Quick Java Installation Helper Script
# Run this script to check Java installation and guide you

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Java Installation Checker & Helper" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Java is in PATH
Write-Host "Checking Java installation..." -ForegroundColor Yellow

try {
    $javaVersion = java -version 2>&1 | Select-Object -First 1
    Write-Host "✓ Java found in PATH!" -ForegroundColor Green
    Write-Host "  $javaVersion" -ForegroundColor Gray
} catch {
    Write-Host "✗ Java not found in PATH" -ForegroundColor Red
}

try {
    $javacVersion = javac -version 2>&1
    Write-Host "✓ javac found in PATH!" -ForegroundColor Green
    Write-Host "  $javacVersion" -ForegroundColor Gray
    Write-Host ""
    Write-Host "✅ Java JDK is properly installed!" -ForegroundColor Green
    Write-Host "You can now run: .\compile_and_run.bat" -ForegroundColor Cyan
    exit 0
} catch {
    Write-Host "✗ javac not found in PATH" -ForegroundColor Red
}

Write-Host ""
Write-Host "Checking common Java installation locations..." -ForegroundColor Yellow

# Check common JDK locations
$commonPaths = @(
    "C:\Program Files\Java\jdk-21\bin\javac.exe",
    "C:\Program Files\Java\jdk-17\bin\javac.exe",
    "C:\Program Files\Java\jdk-11\bin\javac.exe",
    "C:\Program Files\Eclipse Adoptium\jdk-21*\bin\javac.exe",
    "C:\Program Files\Eclipse Adoptium\jdk-17*\bin\javac.exe"
)

$foundJava = $null
foreach ($path in $commonPaths) {
    $resolved = Resolve-Path $path -ErrorAction SilentlyContinue
    if ($resolved) {
        $foundJava = $resolved[0].Path
        Write-Host "✓ Found Java at: $foundJava" -ForegroundColor Green
        break
    }
}

if ($foundJava) {
    Write-Host ""
    Write-Host "Java is installed but NOT in PATH!" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "To fix this:" -ForegroundColor Cyan
    Write-Host "1. Copy this path: $($foundJava | Split-Path -Parent | Split-Path -Parent)" -ForegroundColor White
    Write-Host "2. Add to System PATH (see INSTALL_JAVA.md for details)" -ForegroundColor White
    Write-Host ""
    
    $binPath = $foundJava | Split-Path -Parent
    Write-Host "Or run this command as Administrator:" -ForegroundColor Cyan
    Write-Host '  [Environment]::SetEnvironmentVariable("Path", $env:Path + ";' + $binPath + '", "Machine")' -ForegroundColor White
} else {
    Write-Host "Java JDK not found in common locations" -ForegroundColor Red
    Write-Host ""
    Write-Host "You need to install Java JDK:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Option 1: Oracle JDK" -ForegroundColor Cyan
    Write-Host "  Download: https://www.oracle.com/java/technologies/downloads/" -ForegroundColor White
    Write-Host ""
    Write-Host "Option 2: Eclipse Adoptium (Easier, No Account)" -ForegroundColor Cyan
    Write-Host "  Download: https://adoptium.net/" -ForegroundColor White
    Write-Host ""
    Write-Host "After installation:" -ForegroundColor Yellow
    Write-Host "  1. Make sure 'Add to PATH' is checked during installation" -ForegroundColor White
    Write-Host "  2. Restart this PowerShell window" -ForegroundColor White
    Write-Host "  3. Run this script again to verify" -ForegroundColor White
}

Write-Host ""
Write-Host "For detailed instructions, see: INSTALL_JAVA.md" -ForegroundColor Cyan
Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

