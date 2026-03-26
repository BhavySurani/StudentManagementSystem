<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.studentmgmt.model.Student" %>
<%
    // Check if user is logged in
    if (session.getAttribute("isLoggedIn") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    List<Student> studentList = (List<Student>) request.getAttribute("studentList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Students - Student Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .table-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-top: 30px;
        }
        .table thead {
            background-color: #667eea;
            color: white;
        }
        .table tbody tr:hover {
            background-color: #f1f3f5;
            cursor: pointer;
        }
        .btn-action {
            margin: 0 2px;
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
        <div class="table-container">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2><i class="bi bi-people-fill text-primary"></i> Student List</h2>
                <a href="addStudent.jsp" class="btn btn-success">
                    <i class="bi bi-plus-circle"></i> Add New Student
                </a>
            </div>
            
            <%-- Display success message --%>
            <% if (request.getAttribute("successMessage") != null) { %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="bi bi-check-circle-fill"></i> <%= request.getAttribute("successMessage") %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <% } %>
            
            <%-- Display error message --%>
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="bi bi-exclamation-triangle-fill"></i> <%= request.getAttribute("errorMessage") %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <% } %>
            
            <% if (studentList != null && !studentList.isEmpty()) { %>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Course</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Student student : studentList) { %>
                                <tr>
                                    <td><%= student.getId() %></td>
                                    <td><%= student.getName() %></td>
                                    <td><%= student.getEmail() %></td>
                                    <td><%= student.getCourse() %></td>
                                    <td>
                                        <a href="StudentServlet?action=edit&id=<%= student.getId() %>" 
                                           class="btn btn-sm btn-warning btn-action">
                                            <i class="bi bi-pencil"></i> Edit
                                        </a>
                                        <a href="StudentServlet?action=delete&id=<%= student.getId() %>" 
                                           class="btn btn-sm btn-danger btn-action"
                                           onclick="return confirm('Are you sure you want to delete this student?')">
                                            <i class="bi bi-trash"></i> Delete
                                        </a>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            <% } else { %>
                <div class="alert alert-info text-center">
                    <i class="bi bi-info-circle"></i> No students found. Add your first student!
                </div>
            <% } %>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
