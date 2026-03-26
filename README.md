# Student Management System

A complete Java Web Application using Servlet, JSP, JDBC, and MySQL following MVC Architecture.

## 🚀 Technologies Used
- Java 17
- Servlet 4.0
- JSP 2.3
- JDBC
- MySQL 8.0
- Maven
- Apache Tomcat 9.0+
- Bootstrap 5.3

## 📋 Features
- ✅ Admin Login/Logout with Session Management
- ✅ Add New Student
- ✅ View All Students in Table
- ✅ Edit Student Details
- ✅ Delete Student with Confirmation
- ✅ Responsive UI with Bootstrap
- ✅ Form Validation
- ✅ Error/Success Messages

## 🏗️ MVC Architecture
- **Model:** Student.java (Java Bean)
- **View:** JSP pages with Bootstrap UI
- **Controller:** LoginServlet, StudentServlet
- **DAO:** AdminDAO, StudentDAO (Database operations)
- **Util:** DBConnection (JDBC connection)

## 📁 Project Structure
```
StudentManagementSystem/
├── src/main/java/com/studentmgmt/
│   ├── model/          # Student.java
│   ├── dao/            # AdminDAO.java, StudentDAO.java
│   ├── controller/     # LoginServlet.java, StudentServlet.java
│   └── util/           # DBConnection.java
├── src/main/webapp/
│   ├── WEB-INF/
│   │   ├── web.xml
│   │   └── lib/        # MySQL Connector JAR
│   ├── login.jsp
│   ├── dashboard.jsp
│   ├── addStudent.jsp
│   ├── viewStudents.jsp
│   └── editStudent.jsp
├── database/
│   ├── setup.sql       # Database creation script
│   └── README.md
├── pom.xml
└── Documentation files
```

## 🔧 Quick Setup

### 1. Database Setup
```sql
CREATE DATABASE sms;
USE sms;
-- Run database/setup.sql
```

### 2. Configure Database Connection
Update `src/main/java/com/studentmgmt/util/DBConnection.java`:
```java
private static final String PASSWORD = "your_mysql_password";
```

### 3. Add MySQL Connector
- Download: mysql-connector-java-8.0.33.jar
- Place in: `src/main/webapp/WEB-INF/lib/`

### 4. Run in Eclipse
1. Import as Maven Project
2. Add Tomcat 9.0 Server
3. Run on Server
4. Access: http://localhost:8080/StudentManagementSystem/

## 🔑 Default Login
- Username: `admin`
- Password: `admin123`

## 📚 Documentation
- **SETUP_INSTRUCTIONS.md** - Detailed setup guide
- **PROJECT_STRUCTURE.md** - Complete architecture explanation
- **FINAL_CHECKLIST.md** - Pre-run verification checklist
- **database/README.md** - Database setup instructions

## ✅ Testing
1. Login with admin credentials
2. Add a student
3. View student list
4. Edit student details
5. Delete a student
6. Logout

## 🎯 Key Highlights
- Clean MVC architecture
- PreparedStatement (SQL injection prevention)
- Session management
- Responsive Bootstrap UI
- Proper exception handling
- Resource cleanup
- Form validation

## 📝 Notes
- Session timeout: 30 minutes
- Character encoding: UTF-8
- Bootstrap loaded from CDN
- Suitable for college projects and learning

## 🚀 Ready to Run
Follow **FINAL_CHECKLIST.md** for complete verification before running.

## 📖 For Viva/Demo
See **PROJECT_STRUCTURE.md** for detailed MVC explanation and architecture overview.

---

**Status:** ✅ Production Ready for Learning/Demo
**Version:** 1.0
**Last Updated:** 2026
