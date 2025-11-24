# ATM Simulator - Project Structure Documentation

This document provides a detailed explanation of each file and directory in the ATM Simulator (Bank Management System) project.

## 📁 Directory Structure

```
bankManagementSystem-main/
├── src/                    # Source code directory
├── bin/                    # Compiled class files (generated)
├── lib/                    # External libraries (JAR files)
├── sql/                    # Database SQL scripts
├── icons/                  # Image resources
├── executable/             # Pre-built JAR executable
└── Documentation files     # README, guides, etc.
```

---

## 📂 Source Code Files (`src/atm/simulator/system/`)

### 🔐 **Login.java**
**Purpose:** Main entry point of the application - handles user authentication.

**Key Features:**
- Displays the login screen with bank logo (`bank.png`)
- Provides login form with Card Number and PIN fields
- Validates user credentials against the database
- Redirects authenticated users to the Transactions screen
- Contains "Clear" button to reset form fields

**Database Interaction:**
- Queries the `Login` table to verify card number and PIN
- Retrieves SSN (Social Security Number) upon successful login

**UI Components:**
- Card Number input field
- PIN password field
- Login button
- Clear button
- Welcome message: "Welcome to Apex Trust Bank ATM"

---

### 💳 **Transactions.java**
**Purpose:** Main menu screen displayed after successful login - provides access to all banking operations.

**Key Features:**
- Displays welcome message with user's name
- Provides buttons for all available banking services:
  - **DEPOSIT** - Add money to account
  - **WITHDRAW** - Remove money from account
  - **FAST CASH** - Quick withdrawal with preset amounts
  - **PIN CHANGE** - Update account PIN
  - **MINI STATEMENT** - View transaction history
  - **CHECK BALANCE** - View current account balance
  - **EXIT** - Close the application

**Database Interaction:**
- Retrieves customer name from `Customer` table using SSN

**UI Components:**
- ATM background image
- Welcome label with user name
- Seven action buttons for different services

---

### 💰 **Deposit.java**
**Purpose:** Handles money deposit operations into user's account.

**Key Features:**
- Allows users to enter deposit amount
- Requires PIN confirmation for security
- Updates account balance in database
- Records transaction in transaction history
- Shows success/error messages

**Database Interaction:**
- Updates `Accounts` table to increase balance
- Inserts new record in `Transactions` table with deposit details
- Validates PIN before processing

**UI Components:**
- Amount input field
- PIN confirmation field
- Deposit button
- Back button to return to Transactions menu

---

### 💸 **Withdraw.java**
**Purpose:** Handles money withdrawal operations from user's account.

**Key Features:**
- Allows users to enter withdrawal amount
- Validates sufficient balance before withdrawal
- Requires PIN confirmation
- Updates account balance after successful withdrawal
- Records transaction in history

**Database Interaction:**
- Checks current balance from `Accounts` table
- Validates sufficient funds
- Updates balance after withdrawal
- Inserts transaction record

**UI Components:**
- Amount input field
- PIN confirmation field
- Withdraw button
- Back button

---

### ⚡ **FastCash.java**
**Purpose:** Provides quick withdrawal with preset amount options.

**Key Features:**
- Offers preset withdrawal amounts: $20, $50, $100, $150, $200, $500, $1000
- One-click withdrawal without entering amount manually
- Validates balance before processing
- Records transaction automatically

**Database Interaction:**
- Checks balance availability
- Updates account balance
- Records transaction

**UI Components:**
- Eight preset amount buttons
- Back button

---

### 🔢 **CheckBalance.java**
**Purpose:** Displays the current account balance to the user.

**Key Features:**
- Shows current account balance
- Displays user information
- Simple read-only view

**Database Interaction:**
- Retrieves balance from `Accounts` table using SSN

**UI Components:**
- Balance display label
- User information
- Back button

---

### 📝 **MiniStatement.java**
**Purpose:** Displays a summary of recent transactions.

**Key Features:**
- Shows last 10 transactions
- Displays masked card number
- Shows account balance
- Lists transaction type (Deposit/Withdraw) and amount
- Shows transaction dates

**Database Interaction:**
- Retrieves transaction history from `Transactions` table
- Orders transactions by date (most recent first)
- Limits to last 10 transactions

**UI Components:**
- Transaction list display
- User information header
- Back button

---

### 📄 **MiniStatementResult.java**
**Purpose:** Helper class for formatting and displaying mini statement results.

**Key Features:**
- Formats transaction data for display
- Handles transaction result presentation

---

### 🔑 **PinChange.java**
**Purpose:** Allows users to change their account PIN.

**Key Features:**
- Requires current PIN for verification
- Allows setting new PIN
- Confirms new PIN (enter twice)
- Updates PIN in database after successful change
- Security validation

**Database Interaction:**
- Updates PIN in `Login` table
- Validates old PIN before allowing change

**UI Components:**
- Current PIN field
- New PIN field
- Confirm PIN field
- Change PIN button
- Back button

---

### 📋 **SignupOne.java**
**Purpose:** First page of the account registration form - collects personal information.

**Key Features:**
- Generates unique application form number
- Collects personal details:
  - Name
  - SSN (Social Security Number)
  - Date of Birth (using JCalendar date picker)
  - Gender (Male/Female/Other)
  - Email
  - Marital Status
  - Address, City, State, Zipcode
- Validates all required fields
- Saves data to database

**Database Interaction:**
- Inserts customer information into `Customer` table
- Passes form number and SSN to next signup page

**UI Components:**
- Multiple text input fields
- Radio buttons for gender and marital status
- Date picker for date of birth
- Next button to proceed to SignupTwo

---

### 📋 **SignupTwo.java**
**Purpose:** Second page of registration - collects additional account details.

**Key Features:**
- Collects additional information:
  - Passport Number
  - Father's Name
  - Race
  - Category
  - Income
  - Education
  - Occupation
  - Senior Citizen status
  - Existing account information
- Continues registration process

**Database Interaction:**
- Updates `Customer` table with additional information
- Passes data to final signup page

---

### 📋 **SignupThree.java**
**Purpose:** Final page of registration - sets up account credentials and services.

**Key Features:**
- Sets up account type
- Generates card number
- Allows user to set PIN
- Configures banking services:
  - ATM Card
  - Cheque Book
  - Internet Banking
  - Mobile Banking
  - E-Statement
  - Email/SMS alerts
- Creates login credentials
- Initializes account with zero balance

**Database Interaction:**
- Creates entry in `Login` table with card number and PIN
- Creates entry in `Accounts` table with initial balance
- Completes customer registration

---

### 🔌 **Conn.java**
**Purpose:** Database connection class - manages MySQL database connectivity.

**Key Features:**
- Establishes connection to MySQL database
- Creates statement object for executing SQL queries
- Handles connection errors

**Configuration:**
- Database name: `bank_management_system`
- Default username: `root`
- Default password: `` (empty - needs to be configured)
- Connection URL: `jdbc:mysql:///bank_management_system`

**Usage:**
- All other classes use this class to connect to database
- Example: `Conn conn = new Conn();`
- Then use `conn.s.executeQuery()` or `conn.s.executeUpdate()`

**⚠️ Important:** Update username and password in this file before running the application!

---

## 📂 Resource Files

### 🖼️ **Icons Directory (`src/icons/`)**
- **bank.png** - Bank logo displayed on login screen
- **atm.jpg** - ATM background image used in transaction screens
- **logo.jpg** - (Legacy - replaced by bank.png)

---

## 📂 Database Files (`sql/`)

### 🗄️ **ATM_Simulator.sql**
**Purpose:** SQL script to create database schema and tables.

**Creates:**
1. **Database:** `bank_management_system`
2. **Tables:**
   - `Customer` - Stores all customer information
   - `Login` - Stores login credentials (SSN, card number, PIN)
   - `Transactions` - Stores transaction history
   - `Accounts` - Stores account balances

**Usage:**
- Run this script in MySQL Workbench or command line before first use
- Creates all required database structure

---

## 📂 Library Files (`lib/`)

### 📚 **mysql-connector-java-8.0.28.jar**
**Purpose:** MySQL JDBC driver for Java database connectivity.

**Required for:**
- Connecting Java application to MySQL database
- Executing SQL queries
- Database operations

---

### 📚 **jcalendar-1.4.jar**
**Purpose:** JCalendar library for date picker component.

**Required for:**
- Date of Birth selection in SignupOne form
- Provides calendar UI component

---

## 📂 Build and Run Scripts

### 🛠️ **Makefile**
**Purpose:** Cross-platform build automation script.

**Available Commands:**
- `make help` - Show available commands
- `make check-deps` - Verify required dependencies
- `make compile` - Compile Java source files
- `make run` - Compile and run application
- `make clean` - Remove compiled files
- `make setup` - Show setup instructions

**Usage:**
```bash
make run          # Compile and run
make compile      # Just compile
make clean        # Clean compiled files
```

---

### 🛠️ **compile_and_run.bat**
**Purpose:** Windows batch script for compiling and running the application.

**Features:**
- Checks for required JAR files
- Compiles Java source files
- Runs the application
- Error handling and user-friendly messages

**Usage:**
- Double-click the file in Windows
- Or run from command prompt: `compile_and_run.bat`

---

## 📂 Documentation Files

### 📖 **README.md**
**Purpose:** Main project documentation with overview, installation, and usage instructions.

### 📖 **PROJECT_STRUCTURE.md** (This file)
**Purpose:** Detailed explanation of project structure and each file.

### 📖 **QUICK_START.md**
**Purpose:** Quick setup guide for getting started quickly.

### 📖 **JDBC_SETUP_GUIDE.md**
**Purpose:** Detailed guide for setting up JDBC and database connection.

### 📖 **INSTALL_JAVA.md**
**Purpose:** Instructions for installing Java development environment.

---

## 🔄 Application Flow

```
1. Login.java (Entry Point)
   ↓
2. User Authentication
   ↓
3. Transactions.java (Main Menu)
   ↓
4. User selects service:
   ├── Deposit.java
   ├── Withdraw.java
   ├── FastCash.java
   ├── CheckBalance.java
   ├── MiniStatement.java
   └── PinChange.java
```

**Registration Flow:**
```
1. Login.java → Sign Up
   ↓
2. SignupOne.java (Personal Details)
   ↓
3. SignupTwo.java (Additional Details)
   ↓
4. SignupThree.java (Account Setup)
   ↓
5. Back to Login.java
```

---

## 🗄️ Database Schema

### **Customer Table**
Stores comprehensive customer information including personal details, address, and account preferences.

### **Login Table**
Stores authentication credentials:
- SSN (primary identifier)
- Card Number
- PIN

### **Accounts Table**
Stores account balances:
- SSN (links to customer)
- Balance (current account balance)

### **Transactions Table**
Stores transaction history:
- SSN (customer identifier)
- Amount
- Type (Deposit/Withdraw)
- Date

---

## ⚙️ Configuration

### **Database Connection**
Edit `src/atm/simulator/system/Conn.java`:
```java
String username = "root";        // Change to your MySQL username
String password = "";            // Change to your MySQL password
```

### **Database Name**
Default: `bank_management_system`
Can be changed in `Conn.java` connection URL.

---

## 🚀 Quick Start

1. **Setup Database:**
   ```bash
   mysql -u root -p < sql/ATM_Simulator.sql
   ```

2. **Configure Connection:**
   - Edit `src/atm/simulator/system/Conn.java`
   - Update username and password

3. **Compile and Run:**
   ```bash
   make run
   # Or on Windows:
   compile_and_run.bat
   ```

4. **First Use:**
   - Click "Sign Up" to create account
   - Fill registration form
   - Login with card number and PIN

---

## 📝 Notes

- All Java files are in package `atm.simulator.system`
- Icons must be in `src/icons/` directory
- Database must be set up before first run
- MySQL server must be running when application starts
- Class files are generated in `src/atm/simulator/system/` after compilation

---

## 🔧 Troubleshooting

**Compilation Errors:**
- Ensure JDBC and JCalendar JARs are in `lib/` directory
- Check Java version (JDK 8+ required)

**Database Connection Errors:**
- Verify MySQL server is running
- Check username/password in `Conn.java`
- Ensure database exists (run SQL script)

**Runtime Errors:**
- Check classpath includes all JAR files
- Verify icons directory is accessible
- Ensure database tables exist

---

**Last Updated:** 2024
**Project:** ATM Simulator - Bank Management System
**Version:** 1.0

