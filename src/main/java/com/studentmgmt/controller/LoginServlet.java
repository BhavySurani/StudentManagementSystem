package com.studentmgmt.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.studentmgmt.dao.AdminDAO;

// Controller - Handles login and logout requests
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    
    private AdminDAO adminDAO;
    
    @Override
    public void init() {
        adminDAO = new AdminDAO();
    }
    
    // Handle login form submission
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Validate credentials using AdminDAO
        if (adminDAO.validateAdmin(username, password)) {
            // Create session for logged-in user
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("isLoggedIn", true);
            
            // Redirect to dashboard
            response.sendRedirect("dashboard.jsp");
            
        } else {
            // Invalid credentials - show error
            request.setAttribute("errorMessage", "Invalid username or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    
    // Handle logout request
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("logout".equals(action)) {
            // Invalidate session
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            
            // Redirect to login page
            response.sendRedirect("login.jsp");
        }
    }
}
