# Student Management System - Setup Instructions

## Prerequisites
- Java JDK 11 or higher
- Eclipse IDE for Java EE Developers
- Apache Tomcat 9.0 or higher
- MySQL Server 8.0 or higher
- MySQL Connector JAR (mysql-connector-java-8.0.33.jar)

---

## Step 1: Database Setup

### 1.1 Install MySQL Server
- Download and install MySQL Server from https://dev.mysql.com/downloads/mysql/
- Remember your root password during installation

### 1.2 Create Database
Open MySQL Command Line or MySQL Workbench and run:

```sql
-- Navigate to database folder and run setup.sql
-- OR copy-paste the following:

CREATE DATABASE IF NOT EXISTS sms;
USE sms;

CREATE TABLE IF NOT EXISTS admin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    course VARCHAR(50) NOT NULL
);

INSERT INTO admin (username, password) VALUES ('admin', 'admin123');
```

### 1.3 Verify Database
```sql
USE sms;
SHOW TABLES;
SELECT * FROM admin;
```

---

## Step 2: Download MySQL Connector

### 2.1 Download JAR File
- Visit: https://dev.mysql.com/downloads/connector/j/
- Download: mysql-connector-java-8.0.33.jar (or latest version)
- Select "Platform Independent" ZIP archive

### 2.2 Extract JAR
- Extract the downloaded ZIP file
- Locate the JAR file: mysql-connector-java-8.0.33.jar

---

## Step 3: Eclipse IDE Setup

### 3.1 Import Project
1. Open Eclipse IDE
2. File → Import → Existing Maven Projects
3. Browse to project folder (StudentManagementSystem)
4. Click Finish

### 3.2 Add MySQL Connector to Project

**Option A: Using Maven (Recommended)**
- The pom.xml already includes MySQL dependency
- Right-click project → Maven → Update Project

**Option B: Manual Addition**
1. Copy mysql-connector-java-8.0.33.jar
2. Paste into: `src/main/webapp/WEB-INF/lib/`
3. Right-click project → Refresh

### 3.3 Configure Database Connection
1. Open: `src/main/java/com/studentmgmt/util/DBConnection.java`
2. Update these lines:
   ```java
   private static final String USERNAME = "root";
   private static final String PASSWORD = "your_mysql_password";
   ```

---

## Step 4: Configure Apache Tomcat

### 4.1 Download Tomcat
- Download Apache Tomcat 9.0 from: https://tomcat.apache.org/download-90.cgi
- Extract to a folder (e.g., C:\apache-tomcat-9.0.xx)

### 4.2 Add Tomcat to Eclipse
1. Window → Preferences → Server → Runtime Environments
2. Click "Add"
3. Select "Apache Tomcat v9.0"
4. Click "Next"
5. Browse to Tomcat installation directory
6. Click "Finish"

### 4.3 Create Server Instance
1. Window → Show View → Servers
2. In Servers tab, right-click → New → Server
3. Select "Apache Tomcat v9.0"
4. Click "Next"
5. Add your project to "Configured" side
6. Click "Finish"

---

## Step 5: Build and Run Project

### 5.1 Clean and Build
1. Right-click project → Maven → Update Project
2. Project → Clean → Clean all projects
3. Project → Build Project

### 5.2 Run on Server
1. Right-click project → Run As → Run on Server
2. Select Tomcat server
3. Click "Finish"

### 5.3 Access Application
- Browser will open automatically
- URL: http://localhost:8080/StudentManagementSystem/
- Login page should appear

---

## Step 6: Test Application

### 6.1 Login
- Username: `admin`
- Password: `admin123`

### 6.2 Test Features
1. Click "Add Student" → Fill form → Submit
2. Click "View Students" → See student list
3. Click "Edit" → Modify details → Update
4. Click "Delete" → Confirm deletion
5. Click "Logout" → Return to login

---

## Common Issues and Solutions

### Issue 1: ClassNotFoundException - MySQL Driver
**Solution:**
- Ensure mysql-connector-java-8.0.33.jar is in `WEB-INF/lib/`
- Clean and rebuild project
- Restart Tomcat server

### Issue 2: Database Connection Failed
**Solution:**
- Verify MySQL is running
- Check username and password in DBConnection.java
- Verify database name is "sms"
- Test connection: `mysql -u root -p`

### Issue 3: 404 Error - Page Not Found
**Solution:**
- Check URL: http://localhost:8080/StudentManagementSystem/
- Verify project is deployed on Tomcat
- Check Servers tab → Right-click server → Clean
- Restart server

### Issue 4: Servlet Not Found
**Solution:**
- Verify @WebServlet annotations in servlet classes
- Check servlet mappings in web.xml
- Clean and rebuild project

### Issue 5: JSP Compilation Error
**Solution:**
- Ensure Tomcat supports JSP 2.3
- Check for syntax errors in JSP files
- Verify servlet-api dependency in pom.xml

### Issue 6: Session Not Working
**Solution:**
- Clear browser cookies
- Check session timeout in web.xml
- Verify session attributes in servlets

---

## Project Structure Verification

Ensure your project has this structure:

```
StudentManagementSystem/
├── src/main/java/com/studentmgmt/
│   ├── model/
│   │   └── Student.java
│   ├── dao/
│   │   ├── AdminDAO.java
│   │   └── StudentDAO.java
│   ├── controller/
│   │   ├── LoginServlet.java
│   │   └── StudentServlet.java
│   └── util/
│       └── DBConnection.java
├── src/main/webapp/
│   ├── WEB-INF/
│   │   ├── web.xml
│   │   └── lib/
│   │       └── mysql-connector-java-8.0.33.jar
│   ├── login.jsp
│   ├── dashboard.jsp
│   ├── addStudent.jsp
│   ├── viewStudents.jsp
│   └── editStudent.jsp
├── database/
│   ├── setup.sql
│   └── README.md
└── pom.xml
```

---

## Default Credentials

**Admin Login:**
- Username: `admin`
- Password: `admin123`

**Database:**
- Host: `localhost`
- Port: `3306`
- Database: `sms`
- Username: `root`
- Password: (your MySQL password)

---

## Port Configuration

If port 8080 is already in use:

1. Double-click Tomcat server in Servers tab
2. Change HTTP port from 8080 to 8081 (or any available port)
3. Save and restart server
4. Access: http://localhost:8081/StudentManagementSystem/

---

## Additional Notes

1. **Session Timeout:** Set to 30 minutes in web.xml
2. **Character Encoding:** UTF-8 for all JSP pages
3. **Bootstrap:** Loaded from CDN (requires internet)
4. **Security:** Passwords stored in plain text (for learning purposes only)

---

## For Production Deployment

1. Hash passwords using BCrypt or similar
2. Use connection pooling (Apache DBCP or HikariCP)
3. Add input validation and sanitization
4. Implement proper error handling
5. Use HTTPS for secure communication
6. Add logging framework (Log4j or SLF4J)
7. Implement CSRF protection
8. Add SQL injection prevention (already using PreparedStatement)

---

## Support

For issues or questions:
1. Check console logs in Eclipse
2. Check Tomcat logs in Servers tab
3. Verify database connection
4. Review PROJECT_STRUCTURE.md for architecture details

---

**Project Status:** Ready for deployment and testing
**Last Updated:** 2026
**Version:** 1.0
