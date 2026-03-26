package com.studentmgmt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.studentmgmt.util.DBConnection;

// DAO class - Handles admin authentication
public class AdminDAO {
    
    // Validate admin login credentials
    public boolean validateAdmin(String username, String password) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        boolean isValid = false;
        
        try {
            connection = DBConnection.getConnection();
            String query = "SELECT * FROM admin WHERE username = ? AND password = ?";
            preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            
            resultSet = preparedStatement.executeQuery();
            isValid = resultSet.next(); // Returns true if admin exists
            
        } catch (SQLException e) {
            System.err.println("Error validating admin!");
            e.printStackTrace();
        } finally {
            closeResources(connection, preparedStatement, resultSet);
        }
        
        return isValid;
    }
    
    // Helper method to close database resources
    private void closeResources(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                DBConnection.closeConnection(connection);
            }
        } catch (SQLException e) {
            System.err.println("Error closing resources!");
            e.printStackTrace();
        }
    }
}
