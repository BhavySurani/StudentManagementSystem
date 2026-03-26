# Database Setup Instructions

## Step 1: Install MySQL
Ensure MySQL Server is installed on your system.

## Step 2: Run SQL Script
1. Open MySQL Command Line or MySQL Workbench
2. Execute the `setup.sql` script:
   ```bash
   mysql -u root -p < setup.sql
   ```
   Or copy-paste the SQL commands directly into MySQL Workbench

## Step 3: Verify Database
```sql
USE sms;
SHOW TABLES;
SELECT * FROM admin;
SELECT * FROM student;
```

## Step 4: Update DBConnection.java
Update the following in `src/main/java/com/studentmgmt/util/DBConnection.java`:
- USERNAME: Your MySQL username (default: root)
- PASSWORD: Your MySQL password
- URL: Database URL (default: jdbc:mysql://localhost:3306/sms)

## Default Admin Credentials
- Username: admin
- Password: admin123

## Database Schema

### admin table
- id (INT, PRIMARY KEY, AUTO_INCREMENT)
- username (VARCHAR(50), UNIQUE, NOT NULL)
- password (VARCHAR(100), NOT NULL)

### student table
- id (INT, PRIMARY KEY, AUTO_INCREMENT)
- name (VARCHAR(100), NOT NULL)
- email (VARCHAR(100), UNIQUE, NOT NULL)
- course (VARCHAR(50), NOT NULL)
