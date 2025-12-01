Bank System Distributed (ATM + RMI)

About

This project implements a distributed ATM banking system using Java RMI for client-server communication and MySQL for data storage.
It simulates common ATM operations such as deposits, withdrawals, fast cash, balance check, mini statements, and PIN changes.

Project Structure

bankSystemRMI/            
 ├── src/
 │   ├── client/      # Contains the GUI classes for the ATM client and the code to invoke RMI methods.
 │   ├── rmi/         # Contains RMI interfaces that define the remote methods for the banking operations.
 │   ├── server/      # Contains the server-side implementation of RMI interfaces.
 │   ├── util/        # Utility classes, including database connection and SQL scripts to create tables likeCustomer, Accounts, Card, Login, Transactions, etc.
 └── …                # Contains images, icons ....



Main Features

- Authentication via card number + PIN through RMI  
- ATM operations:  
  - Deposit  
  - Withdraw  
  - Fast Cash (predefined quick withdrawals)  
  - PIN change  
  - Balance check  
  - Mini statement (last transactions)  


Prerequisites

- Java (JDK 8 or higher)  
- MySQL (server + JDBC access)  
- Database created with necessary tables (Customer, accounts, card, login, transactions, etc.)  


Installation / Getting Started

1. Clone the repository:  
   git clone https://github.com/3olama/Bank-System-Distributed.git

2. Create the database and import the SQL script . 

3. Configure database connection in util/Conn.java (URL, user, password).  

4. Use the GUI to perform ATM operations.  

Usage Example

- Login with an existing card number + valid PIN → access ATM operations  
- Deposit: add money, balance updates  
- Withdraw / Fast Cash: withdraw money if sufficient balance  
- Mini statement: show last 10 operations + current balance  
- PIN change: update PIN securely  

Database Tables (simplified)

- Customer: personal info (ssn, name, dob, etc.)  
- accounts: bank accounts, linked to ssn, with balance and accountNumber  
- card: cards linked to accountNumber, card number + PIN, status  
- login: authentication table, linking ssn, cardNumber, and PIN  
- transactions: operation history, including accountNumber, type, amount, date, details  

Best Practices

- Always start the RMI server before the client   
- Transactions and DB access are handled server-side to centralize business logic and ensure consistency  
- Use PreparedStatement to prevent SQL injection  
- For production: consider PIN encryption, input validation, and logging  



Last updated: 2025-12-01
