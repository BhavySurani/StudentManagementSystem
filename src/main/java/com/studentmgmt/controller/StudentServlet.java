package com.studentmgmt.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.studentmgmt.dao.StudentDAO;
import com.studentmgmt.model.Student;

// Controller - Handles student CRUD operations
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
    
    private StudentDAO studentDAO;
    
    @Override
    public void init() {
        studentDAO = new StudentDAO();
    }
    
    // Handle GET requests - View and Delete operations
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Check if user is logged in
        if (!isLoggedIn(request)) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "view";
        }
        
        switch (action) {
            case "view":
                viewAllStudents(request, response);
                break;
                
            case "delete":
                deleteStudent(request, response);
                break;
                
            case "edit":
                showEditForm(request, response);
                break;
                
            default:
                viewAllStudents(request, response);
                break;
        }
    }
    
    // Handle POST requests - Add and Update operations
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Check if user is logged in
        if (!isLoggedIn(request)) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        
        if ("add".equals(action)) {
            addStudent(request, response);
        } else if ("update".equals(action)) {
            updateStudent(request, response);
        }
    }
    
    // Add new student
    private void addStudent(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        
        // Create Student object
        Student student = new Student(name, email, course);
        
        // Add to database
        boolean isAdded = studentDAO.addStudent(student);
        
        if (isAdded) {
            request.setAttribute("successMessage", "Student added successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to add student!");
        }
        
        request.getRequestDispatcher("addStudent.jsp").forward(request, response);
    }
    
    // View all students
    private void viewAllStudents(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Student> studentList = studentDAO.getAllStudents();
        request.setAttribute("studentList", studentList);
        request.getRequestDispatcher("viewStudents.jsp").forward(request, response);
    }
    
    // Delete student
    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int studentId = Integer.parseInt(request.getParameter("id"));
        boolean isDeleted = studentDAO.deleteStudent(studentId);
        
        if (isDeleted) {
            request.setAttribute("successMessage", "Student deleted successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to delete student!");
        }
        
        // Redirect to view page
        viewAllStudents(request, response);
    }
    
    // Show edit form with student data
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int studentId = Integer.parseInt(request.getParameter("id"));
        Student student = studentDAO.getStudentById(studentId);
        
        request.setAttribute("student", student);
        request.getRequestDispatcher("editStudent.jsp").forward(request, response);
    }
    
    // Update student details
    private void updateStudent(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        
        // Create Student object
        Student student = new Student(id, name, email, course);
        
        // Update in database
        boolean isUpdated = studentDAO.updateStudent(student);
        
        if (isUpdated) {
            request.setAttribute("successMessage", "Student updated successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to update student!");
        }
        
        // Redirect to view page
        viewAllStudents(request, response);
    }
    
    // Check if user is logged in
    private boolean isLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return (session != null && session.getAttribute("isLoggedIn") != null);
    }
}
