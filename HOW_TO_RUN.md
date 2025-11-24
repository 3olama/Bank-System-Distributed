# How to Run ATM Simulator Project

## Prerequisites

Before running this project, ensure you have the following installed:

1. **Java JDK** (version 8 or higher)
   - Download from: https://www.oracle.com/java/technologies/downloads/
   - Verify installation: Open Command Prompt/PowerShell and run:
     ```
     java -version
     javac -version
     ```

2. **MySQL Server** (version 5.7 or higher)
   - Download from: https://dev.mysql.com/downloads/mysql/
   - Install MySQL Server and MySQL Workbench (optional but recommended)

3. **MySQL JDBC Driver** (mysql-connector-java)
   - Download from: https://dev.mysql.com/downloads/connector/j/
   - You'll need the JAR file (e.g., `mysql-connector-java-8.0.33.jar`)

---

## Step-by-Step Setup Instructions

### Step 1: Set Up MySQL Database

1. **Start MySQL Server**
   - Open MySQL Workbench or MySQL Command Line Client
   - Login with your MySQL root credentials

2. **Create the Database**
   - Open MySQL Workbench
   - Navigate to the `sql` folder in this project
   - Open `ATM_Simulator.sql` file
   - Execute the SQL script to create the database and tables
   - OR run via command line:
     ```
     mysql -u root -p < sql/ATM_Simulator.sql
     ```

3. **Verify Database Creation**
   - The database `bank_management_system` should be created
   - Tables created: `Customer`, `Login`, `Transactions`, `Accounts`

### Step 2: Configure Database Connection

1. **Open the Connection File**
   - Navigate to: `src/atm/simulator/system/Conn.java`

2. **Update Database Credentials**
   - Currently configured as:
     - Username: `root`
     - Password: `root`
   - Update these values to match your MySQL credentials

3. **Verify Connection URL** (if needed)
   - Default: `jdbc:mysql:///bank_management_system`
   - If MySQL is on a different host/port, update accordingly

### Step 3: Set Up MySQL JDBC Driver

**Option A: Using JAR file directly (For running from source)**

1. Download `mysql-connector-java-X.X.XX.jar`
2. Place it in a `lib` folder (create it in project root)
3. When compiling, include it in classpath:
   ```
   javac -cp "lib/mysql-connector-java-X.X.XX.jar;." src/atm/simulator/system/*.java
   ```

**Option B: Using executable JAR (Easiest method)**
- The executable JAR at `executable/ATM_Simulator.jar` may already include the driver
- If not, you'll need to add it to the classpath

### Step 4: Run the Application

**Method 1: Run from Source Code (Recommended for development)**

1. **Compile the Java files:**
   ```powershell
   cd src
   javac -cp ".;../lib/mysql-connector-java-X.X.XX.jar" atm/simulator/system/*.java
   ```

2. **Run the Login class:**
   ```powershell
   java -cp ".;../lib/mysql-connector-java-X.X.XX.jar;../icons" atm.simulator.system.Login
   ```

**Method 2: Run the Executable JAR (Easiest)**

1. **Double-click method:**
   - Navigate to `executable/ATM_Simulator.jar`
   - Double-click to run (if Java is properly configured)

2. **Command line method:**
   ```powershell
   cd executable
   java -jar ATM_Simulator.jar
   ```

   **Note:** If you get "ClassNotFoundException" for MySQL connector, run:
   ```powershell
   java -cp "ATM_Simulator.jar;../lib/mysql-connector-java-X.X.XX.jar" atm.simulator.system.Login
   ```

---

## Troubleshooting

### Common Issues:

1. **"ClassNotFoundException: com.mysql.cj.jdbc.Driver"**
   - **Solution:** Add MySQL JDBC driver to classpath
   - Download connector and include it when running

2. **"Access denied for user 'root'@'localhost'"**
   - **Solution:** Update credentials in `Conn.java` to match your MySQL setup
   - Or create a MySQL user with username: `root` and password: `root`

3. **"Unknown database 'bank_management_system'"**
   - **Solution:** Run the SQL script from `sql/ATM_Simulator.sql` to create the database

4. **"Connection refused" or "Communications link failure"**
   - **Solution:** Ensure MySQL server is running
   - Check if MySQL is listening on the correct port (default: 3306)

5. **Icons/images not loading**
   - **Solution:** Ensure the `icons` folder is in the classpath when running
   - The icons should be accessible at runtime

---

## Quick Start (If MySQL has root/root credentials)

If you want the quickest setup:

1. Create MySQL user:
   ```sql
   CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';
   GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';
   FLUSH PRIVILEGES;
   ```

2. Run the SQL script:
   ```sql
   source sql/ATM_Simulator.sql;
   ```

3. Run the executable:
   ```powershell
   cd executable
   java -jar ATM_Simulator.jar
   ```

---

## Using the Application

1. **First Time:**
   - Click "Sign Up" to create a new account
   - Fill in the registration form
   - You'll receive a card number and PIN

2. **Login:**
   - Enter your Card Number and PIN
   - Click "Login"

3. **Available Features:**
   - Deposit money
   - Withdraw money
   - Fast Cash withdrawal
   - Check balance
   - Change PIN
   - View mini statement (last 10 transactions)

---

## Project Structure

```
bankManagementSystem-main/
├── src/                    # Source code
│   └── atm/simulator/system/
│       ├── Login.java      # Main entry point
│       ├── Conn.java       # Database connection
│       └── ...             # Other classes
├── bin/                    # Compiled classes
├── executable/             # JAR file
│   └── ATM_Simulator.jar
├── sql/                    # Database scripts
│   └── ATM_Simulator.sql
├── icons/                  # Image resources
└── screenshots/            # Project screenshots
```

---

## Need Help?

If you encounter issues:
1. Check that Java and MySQL are properly installed
2. Verify database credentials in `Conn.java`
3. Ensure the database and tables are created
4. Check that MySQL server is running
5. Verify the MySQL JDBC driver is accessible

