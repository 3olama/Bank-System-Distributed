<!-- Bank Management System -->
# ATM Simulator (Bank Management System)

<!-- ABOUT THE PROJECT -->
## About ATM Simulator

The "ATM Simulator" project is a model for Bank System Management. It enables the bank's customers to perform various banking tasks and transactions like creating an account with the bank, requesting and accessing various services and facilities offered by the bank, deposit/withdraw cash from their accounts, etc. The customers can access this banks application also for viewing their account balance, getting mini statements and performing transactions as per their requirement. Simply put, this project converts the brick-and-mortar structure of traditional banking system into a click and portal model, there by giving the concept of virtual banking a real shape in true sense.

The inspiration for this ATM Simulator project stems from the basic need of having an e-financial application in todays fast paced online world, for customers in banking environment. This project is meant to nurture the needs of an end banking user by providing them various ways to perform all banking tasks at the disposal of a few button clicks. Also, to easily enable functionalities which are otherwise not provided under a conventional banking project. This project has been developed to make banking processes easy and quick, which is a shortcoming of the traditional system.

<!-- How to run ATM Simulator -->
## How to install and run ATM Simulator

### Prerequisites
- **Java JDK 8 or higher** - [Download Java](https://www.oracle.com/java/technologies/downloads/)
- **MySQL Server** - [Download MySQL](https://dev.mysql.com/downloads/mysql/)
- **MySQL JDBC Driver** - `mysql-connector-java-8.0.28.jar` (included in `lib/` folder)
- **JCalendar Library** - `jcalendar-1.4.jar` (included in `lib/` folder)

### Quick Start (Using Makefile)

**For Linux/Mac/Git Bash (Windows):**
```bash
# 1. Setup database
mysql -u root -p < sql/ATM_Simulator.sql

# 2. Configure database connection
# Edit src/atm/simulator/system/Conn.java and update username/password

# 3. Run the application
make run
```

**For Windows (Using Batch Script):**
```bash
# 1. Setup database in MySQL Workbench
# Run sql/ATM_Simulator.sql

# 2. Configure database connection
# Edit src\atm\simulator\system\Conn.java

# 3. Run the application
compile_and_run.bat
```

### Detailed Setup Steps

1. **Clone or Download the Project**
   ```bash
   git clone <repository-url>
   cd bankManagementSystem-main
   ```

2. **Setup MySQL Database**
   - Open MySQL Workbench or MySQL command line
   - Run the SQL script: `sql/ATM_Simulator.sql`
   - This creates the database `bank_management_system` and all required tables

3. **Configure Database Connection**
   - Open `src/atm/simulator/system/Conn.java`
   - Update MySQL credentials:
     ```java
     String username = "root";  // Your MySQL username
     String password = "your_password";  // Your MySQL password
     ```

4. **Verify Dependencies**
   - Check that `lib/mysql-connector-java-8.0.28.jar` exists
   - Check that `lib/jcalendar-1.4.jar` exists
   - If missing, download and place them in the `lib/` folder

5. **Compile and Run**
   
   **Option A: Using Makefile (Recommended)**
   ```bash
   make run          # Compile and run
   make compile      # Just compile
   make clean        # Clean compiled files
   make help         # Show all commands
   ```
   
   **Option B: Using Batch Script (Windows)**
   - Double-click `compile_and_run.bat`
   
   **Option C: Manual Compilation**
   ```bash
   # Compile
   javac -cp "src:lib/mysql-connector-java-8.0.28.jar:lib/jcalendar-1.4.jar" -d src src/atm/simulator/system/*.java
   
   # Run
   java -cp "src:lib/mysql-connector-java-8.0.28.jar:lib/jcalendar-1.4.jar:src/icons" atm.simulator.system.Login
   ```

### Project Documentation
- **📖 [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md)** - Detailed explanation of each file in the project
- **📖 [QUICK_START.md](QUICK_START.md)** - Quick setup guide
- **📖 [JDBC_SETUP_GUIDE.md](JDBC_SETUP_GUIDE.md)** - Database setup guide

<!-- How to use ATM Simulator -->
## How to use ATM Simulator

Follow these steps to use ATM Simulator.

1. When accessing first time, click sign up, fill up the form to create an account.
2. Now Login with your cardnumber and pin to access the ATM Simulator GUI.
3. You have the option of depositing money, withdrawing money or withdrawing using fast cash option.
4. You also have the option of changing your PIN and checking your account balance.
5. You can also request a mini statement for your account.
6. The mini statement shows your name, your masked card number, you account balance and your last 10 transactions.

<!-- Screenshots of ATM Simulator -->
### Screenshots of ATM Simulator
<img src="/screenshots/1.jpg"
     style="display: inline-block; margin: 0 auto; width:600px; height:400px;">
<img src="/screenshots/2.jpg"
     style="display: inline-block; margin: 0 auto; width:800px; height:600px;">
<img src="/screenshots/4.jpg"
     style="display: inline-block; margin: 0 auto; width:800px; height:600px;">     
<img src="/screenshots/5.jpg"
     style="display: inline-block; margin: 0 auto; width:800px; height:600px;">
<img src="/screenshots/6.jpg"
     style="display: inline-block; margin: 0 auto; width:800px; height:450px;">
<img src="/screenshots/3.jpg"
     style="display: inline-block; margin: 0 auto; width:800px; height:700px;">
<!-- GITHUB SETUP -->
## Pushing to GitHub

### Initial Setup
```bash
# Initialize git repository (if not already initialized)
git init

# Add all files
git add .

# Commit changes
git commit -m "Initial commit: ATM Simulator Bank Management System"

# Add your GitHub repository as remote
git remote add origin https://github.com/your-username/your-repo-name.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Important Notes
- The `.gitignore` file is configured to exclude compiled `.class` files
- Only source code and resources will be pushed to GitHub
- Make sure to update `Conn.java` with your database credentials before committing (or use environment variables)
- Do NOT commit sensitive information like database passwords

<!-- CONTRIBUTING -->
## Contributing

If you have to add a feature, please fork the repo and create a pull request.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/Feature`)
3. Commit your Changes (`git commit -m 'Adding Feature'`)
4. Push to the Branch (`git push origin feature/Feature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>
