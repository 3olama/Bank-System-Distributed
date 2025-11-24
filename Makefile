# ============================================
# ATM Simulator - Bank Management System
# Makefile for Building and Running
# ============================================

# Project Configuration
PROJECT_NAME = ATM_Simulator
SRC_DIR = src
BIN_DIR = bin
LIB_DIR = lib
ICONS_DIR = src/icons
MAIN_CLASS = atm.simulator.system.Login

# JAR Files
JDBC_JAR = $(LIB_DIR)/mysql-connector-java-8.0.28.jar
JCALENDAR_JAR = $(LIB_DIR)/jcalendar-1.4.jar

# Java Compiler and Runtime
JAVAC = javac
JAVA = java

# Classpath for compilation
CLASSPATH = $(SRC_DIR):$(JDBC_JAR):$(JCALENDAR_JAR)

# Classpath for runtime (includes icons directory)
RUNTIME_CLASSPATH = $(SRC_DIR):$(JDBC_JAR):$(JCALENDAR_JAR):$(ICONS_DIR)

# Colors for output (Unix/Linux/Mac)
GREEN = \033[0;32m
YELLOW = \033[1;33m
RED = \033[0;31m
NC = \033[0m # No Color

.PHONY: all clean compile run help check-deps setup

# Default target
all: check-deps compile

# Help target - shows available commands
help:
	@echo "$(GREEN)============================================$(NC)"
	@echo "$(GREEN)ATM Simulator - Available Commands$(NC)"
	@echo "$(GREEN)============================================$(NC)"
	@echo ""
	@echo "$(YELLOW)make help$(NC)          - Show this help message"
	@echo "$(YELLOW)make check-deps$(NC)    - Check if required dependencies exist"
	@echo "$(YELLOW)make compile$(NC)       - Compile all Java source files"
	@echo "$(YELLOW)make run$(NC)           - Compile and run the application"
	@echo "$(YELLOW)make clean$(NC)         - Remove compiled .class files"
	@echo "$(YELLOW)make setup$(NC)         - Setup instructions"
	@echo ""

# Check if dependencies exist
check-deps:
	@echo "$(YELLOW)[Checking Dependencies]$(NC)"
	@if [ ! -d "$(LIB_DIR)" ]; then \
		echo "$(RED)ERROR: lib/ directory not found!$(NC)"; \
		exit 1; \
	fi
	@if [ ! -f "$(JDBC_JAR)" ]; then \
		echo "$(RED)ERROR: MySQL JDBC driver not found at $(JDBC_JAR)$(NC)"; \
		echo "$(YELLOW)Please download mysql-connector-java-8.0.28.jar and place it in lib/$(NC)"; \
		exit 1; \
	fi
	@if [ ! -f "$(JCALENDAR_JAR)" ]; then \
		echo "$(YELLOW)WARNING: JCalendar library not found at $(JCALENDAR_JAR)$(NC)"; \
		echo "$(YELLOW)Download jcalendar-1.4.jar and place it in lib/$(NC)"; \
	fi
	@if [ ! -d "$(SRC_DIR)" ]; then \
		echo "$(RED)ERROR: src/ directory not found!$(NC)"; \
		exit 1; \
	fi
	@echo "$(GREEN)✓ Dependencies check passed$(NC)"
	@echo ""

# Compile Java source files
compile: check-deps
	@echo "$(YELLOW)[Compiling Java Source Files]$(NC)"
	@$(JAVAC) -cp "$(CLASSPATH)" -d $(SRC_DIR) $(SRC_DIR)/atm/simulator/system/*.java
	@if [ $$? -eq 0 ]; then \
		echo "$(GREEN)✓ Compilation successful!$(NC)"; \
	else \
		echo "$(RED)✗ Compilation failed!$(NC)"; \
		exit 1; \
	fi
	@echo ""

# Run the application
run: compile
	@echo "$(YELLOW)[Starting ATM Simulator]$(NC)"
	@echo "$(YELLOW)Make sure MySQL server is running and database is set up!$(NC)"
	@echo ""
	@$(JAVA) -cp "$(RUNTIME_CLASSPATH)" $(MAIN_CLASS)
	@if [ $$? -ne 0 ]; then \
		echo ""; \
		echo "$(RED)✗ Application failed to start!$(NC)"; \
		echo "$(YELLOW)Check MySQL server and database setup.$(NC)"; \
	fi

# Clean compiled files
clean:
	@echo "$(YELLOW)[Cleaning Compiled Files]$(NC)"
	@find $(SRC_DIR) -name "*.class" -type f -delete
	@find $(BIN_DIR) -name "*.class" -type f -delete 2>/dev/null || true
	@echo "$(GREEN)✓ Clean completed$(NC)"
	@echo ""

# Setup instructions
setup:
	@echo "$(GREEN)============================================$(NC)"
	@echo "$(GREEN)ATM Simulator - Setup Instructions$(NC)"
	@echo "$(GREEN)============================================$(NC)"
	@echo ""
	@echo "$(YELLOW)1. Prerequisites:$(NC)"
	@echo "   - Java JDK 8 or higher"
	@echo "   - MySQL Server"
	@echo "   - MySQL JDBC Driver (mysql-connector-java-8.0.28.jar)"
	@echo "   - JCalendar Library (jcalendar-1.4.jar)"
	@echo ""
	@echo "$(YELLOW)2. Database Setup:$(NC)"
	@echo "   - Open MySQL Workbench or MySQL command line"
	@echo "   - Run the SQL script: sql/ATM_Simulator.sql"
	@echo "   - This will create the database and required tables"
	@echo ""
	@echo "$(YELLOW)3. Configure Database Connection:$(NC)"
	@echo "   - Edit: src/atm/simulator/system/Conn.java"
	@echo "   - Update MySQL username and password"
	@echo "   - Default: username='root', password=''"
	@echo ""
	@echo "$(YELLOW)4. Run the Application:$(NC)"
	@echo "   - Execute: make run"
	@echo "   - Or use: make compile && make run"
	@echo ""
	@echo "$(YELLOW)5. First Time Usage:$(NC)"
	@echo "   - Click 'Sign Up' to create a new account"
	@echo "   - Fill in the registration form"
	@echo "   - Login with your card number and PIN"
	@echo ""
	@echo "$(GREEN)For more details, see PROJECT_STRUCTURE.md$(NC)"
	@echo ""

