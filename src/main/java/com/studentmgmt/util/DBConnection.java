package com.studentmgmt.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// Utility class - Manages database connection
public class DBConnection {
    
    // Database credentials
    private static final String URL = "jdbc:mysql://localhost:3306/sms";
    private static final String USERNAME = "root";
    private static final String PASSWORD = ""; // Update with your MySQL password
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    
    // Get database connection
    public static Connection getConnection() {
        Connection connection = null;
        try {
            // Load MySQL JDBC Driver
            Class.forName(DRIVER);
            
            // Establish connection
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Database connection failed!");
            e.printStackTrace();
        }
        return connection;
    }
    
    // Close connection
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                System.err.println("Failed to close connection!");
                e.printStackTrace();
            }
        }
    }
}
