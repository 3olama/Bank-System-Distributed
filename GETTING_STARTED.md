# Getting Started - Quick Reference Guide

## 🚀 Quick Setup (5 Minutes)

### Step 1: Prerequisites Check
```bash
# Check Java version (need JDK 8+)
java -version
javac -version

# Check MySQL
mysql --version
```

### Step 2: Database Setup
```bash
# Option A: Using MySQL command line
mysql -u root -p < sql/ATM_Simulator.sql

# Option B: Using MySQL Workbench
# 1. Open MySQL Workbench
# 2. File → Open SQL Script → Select sql/ATM_Simulator.sql
# 3. Click Execute (⚡ icon)
```

### Step 3: Configure Database Connection
Edit `src/atm/simulator/system/Conn.java`:
```java
String username = "root";        // Your MySQL username
String password = "yourpass";     // Your MySQL password
```

### Step 4: Run the Application
```bash
# Using Makefile (Linux/Mac/Git Bash)
make run

# Using Batch Script (Windows)
compile_and_run.bat
```

## 📋 First Time Usage

1. **Launch Application** - Run `make run` or `compile_and_run.bat`
2. **Create Account** - Click "Sign Up" button
3. **Fill Registration Form** - Complete all 3 pages of signup
4. **Note Your Card Number** - Save it for login
5. **Login** - Use card number and PIN you created

## 🛠️ Available Commands (Makefile)

```bash
make help          # Show all available commands
make check-deps    # Verify all dependencies exist
make compile       # Compile Java source files only
make run           # Compile and run application
make clean         # Remove all compiled .class files
make setup         # Show detailed setup instructions
```

## 📁 Key Files to Know

| File | Purpose |
|------|---------|
| `Login.java` | Main entry point - login screen |
| `Transactions.java` | Main menu after login |
| `Conn.java` | Database connection (configure here!) |
| `Makefile` | Build automation script |
| `PROJECT_STRUCTURE.md` | Detailed file explanations |

## 🐛 Common Issues

### Issue: "Class not found" or compilation errors
**Solution:** 
- Check that JAR files exist in `lib/` folder
- Run `make check-deps` to verify

### Issue: "Cannot connect to database"
**Solution:**
- Verify MySQL server is running
- Check username/password in `Conn.java`
- Ensure database exists (run SQL script)

### Issue: "Icons not found"
**Solution:**
- Ensure `src/icons/` directory exists
- Check that `bank.png` and `atm.jpg` are present

## 📚 Documentation

- **Full Project Structure:** See [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md)
- **Database Setup:** See [JDBC_SETUP_GUIDE.md](JDBC_SETUP_GUIDE.md)
- **Java Installation:** See [INSTALL_JAVA.md](INSTALL_JAVA.md)

## 💡 Tips for Team Members

1. **Always pull latest changes** before starting work
2. **Never commit** `Conn.java` with real passwords (use placeholders)
3. **Run `make clean`** if you encounter weird compilation issues
4. **Check `PROJECT_STRUCTURE.md`** to understand any file before modifying
5. **Test database connection** before running full application

## 🔄 Git Workflow

```bash
# Before starting work
git pull origin main

# After making changes
git add .
git commit -m "Description of changes"
git push origin main
```

## 📞 Need Help?

1. Check [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md) for file explanations
2. Review [README.md](README.md) for detailed setup
3. Run `make setup` for setup instructions
4. Check error messages - they usually point to the issue

---

**Happy Coding! 🎉**

