<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.studentmgmt.model.Student" %>
<%
    // Check if user is logged in
    if (session.getAttribute("isLoggedIn") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    Student student = (Student) request.getAttribute("student");
    if (student == null) {
        response.sendRedirect("StudentServlet?action=view");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student - Student Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="dashboard.jsp">
                <i class="bi bi-mortarboard-fill"></i> Student Management System
            </a>
            <div class="d-flex">
                <a href="dashboard.jsp" class="btn btn-light btn-sm me-2">
                    <i class="bi bi-house"></i> Dashboard
                </a>
                <a href="LoginServlet?action=logout" class="btn btn-light btn-sm">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>
            </div>
        </div>
    </nav>
    
    <!-- Main Content -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="form-container">
                    <h2 class="text-center mb-4">
                        <i class="bi bi-pencil-square text-warning"></i> Edit Student Details
                    </h2>
                    
                    <form action="StudentServlet" method="post" onsubmit="return validateForm()">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="id" value="<%= student.getId() %>">
                        
                        <div class="mb-3">
                            <label for="name" class="form-label">Student Name</label>
                            <input type="text" class="form-control" id="name" name="name" 
                                   value="<%= student.getName() %>" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" 
                                   value="<%= student.getEmail() %>" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="course" class="form-label">Course</label>
                            <select class="form-select" id="course" name="course" required>
                                <option value="">Select Course</option>
                                <option value="Computer Science" <%= "Computer Science".equals(student.getCourse()) ? "selected" : "" %>>Computer Science</option>
                                <option value="Information Technology" <%= "Information Technology".equals(student.getCourse()) ? "selected" : "" %>>Information Technology</option>
                                <option value="Electronics" <%= "Electronics".equals(student.getCourse()) ? "selected" : "" %>>Electronics</option>
                                <option value="Mechanical" <%= "Mechanical".equals(student.getCourse()) ? "selected" : "" %>>Mechanical</option>
                                <option value="Civil" <%= "Civil".equals(student.getCourse()) ? "selected" : "" %>>Civil</option>
                            </select>
                        </div>
                        
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-warning btn-lg">
                                <i class="bi bi-check-circle"></i> Update Student
                            </button>
                            <a href="StudentServlet?action=view" class="btn btn-secondary">
                                <i class="bi bi-arrow-left"></i> Back to List
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function validateForm() {
            const name = document.getElementById('name').value.trim();
            const email = document.getElementById('email').value.trim();
            const course = document.getElementById('course').value;
            
            if (name === '' || email === '' || course === '') {
                alert('Please fill all fields!');
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
