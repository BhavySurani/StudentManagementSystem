# How to Run Using Main.java

## ✅ Simple Method - Just Run Main.java

### Step 1: Setup Database (One Time Only)
1. Open MySQL Command Line or MySQL Workbench
2. Run the SQL from `database/setup.sql`:
   ```sql
   CREATE DATABASE IF NOT EXISTS sms;
   USE sms;
   -- (copy rest of the SQL from setup.sql)
   ```

### Step 2: Update Database Password
1. Open: `src/main/java/com/studentmgmt/util/DBConnection.java`
2. Change line 12:
   ```java
   private static final String PASSWORD = "your_mysql_password";
   ```

### Step 3: Update Maven Dependencies
1. Right-click project → Maven → Update Project
2. Wait for dependencies to download

### Step 4: Run Main.java
1. Open: `src/main/java/com/studentmgmt/Main.java`
2. Right-click → Run As → Java Application
3. Wait for console message: "✅ Server started successfully!"

### Step 5: Open Browser
1. Go to: http://localhost:8080/StudentManagementSystem/
2. Login with:
   - Username: `admin`
   - Password: `admin123`

### Step 6: Stop Server
- Press Ctrl+C in Eclipse console

---

## 🎯 That's It!

No need to configure Tomcat separately. Just run Main.java like any Java program!

---

## ⚠️ Troubleshooting

**Problem: "Cannot find Main class"**
- Solution: Right-click project → Maven → Update Project

**Problem: "Port 8080 already in use"**
- Solution: Change port in Main.java line 21:
  ```java
  tomcat.setPort(8081); // Change to 8081 or any free port
  ```

**Problem: "Database connection failed"**
- Solution: Check MySQL is running and password is correct in DBConnection.java

---

## 📝 Note

This still runs a web server (embedded Tomcat), but you don't need to configure it separately. Just run Main.java and it works!
