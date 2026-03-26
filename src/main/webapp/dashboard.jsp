<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if user is logged in
    if (session.getAttribute("isLoggedIn") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Student Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 12px rgba(0,0,0,0.15);
        }
        .card-icon {
            font-size: 3rem;
            margin-bottom: 15px;
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
                <span class="navbar-text text-white me-3">
                    Welcome, <%= username %>
                </span>
                <a href="LoginServlet?action=logout" class="btn btn-light btn-sm">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>
            </div>
        </div>
    </nav>
    
    <!-- Main Content -->
    <div class="container mt-5">
        <h2 class="text-center mb-4">Dashboard</h2>
        
        <div class="row g-4">
            <!-- Add Student Card -->
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <div class="card-body">
                        <i class="bi bi-person-plus-fill text-success card-icon"></i>
                        <h5 class="card-title">Add Student</h5>
                        <p class="card-text">Register new student to the system</p>
                        <a href="addStudent.jsp" class="btn btn-success">
                            <i class="bi bi-plus-circle"></i> Add New
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- View Students Card -->
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <div class="card-body">
                        <i class="bi bi-people-fill text-primary card-icon"></i>
                        <h5 class="card-title">View Students</h5>
                        <p class="card-text">View and manage all students</p>
                        <a href="StudentServlet?action=view" class="btn btn-primary">
                            <i class="bi bi-eye"></i> View All
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- Manage Records Card -->
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <div class="card-body">
                        <i class="bi bi-gear-fill text-warning card-icon"></i>
                        <h5 class="card-title">Manage Records</h5>
                        <p class="card-text">Edit and delete student records</p>
                        <a href="StudentServlet?action=view" class="btn btn-warning">
                            <i class="bi bi-pencil-square"></i> Manage
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
