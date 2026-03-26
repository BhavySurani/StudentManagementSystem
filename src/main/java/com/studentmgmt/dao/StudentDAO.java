package com.studentmgmt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.studentmgmt.model.Student;
import com.studentmgmt.util.DBConnection;

// DAO class - Handles all database operations for Student
public class StudentDAO {
    
    // Add new student to database
    public boolean addStudent(Student student) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        boolean isAdded = false;
        
        try {
            connection = DBConnection.getConnection();
            String query = "INSERT INTO student (name, email, course) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, student.getName());
            preparedStatement.setString(2, student.getEmail());
            preparedStatement.setString(3, student.getCourse());
            
            int rowsAffected = preparedStatement.executeUpdate();
            isAdded = (rowsAffected > 0);
            
        } catch (SQLException e) {
            System.err.println("Error adding student!");
            e.printStackTrace();
        } finally {
            closeResources(connection, preparedStatement, null);
        }
        
        return isAdded;
    }
    
    // Get all students from database
    public List<Student> getAllStudents() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Student> studentList = new ArrayList<>();
        
        try {
            connection = DBConnection.getConnection();
            String query = "SELECT * FROM student ORDER BY id DESC";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String course = resultSet.getString("course");
                
                Student student = new Student(id, name, email, course);
                studentList.add(student);
            }
            
        } catch (SQLException e) {
            System.err.println("Error fetching students!");
            e.printStackTrace();
        } finally {
            closeResources(connection, preparedStatement, resultSet);
        }
        
        return studentList;
    }
    
    // Get student by ID
    public Student getStudentById(int studentId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Student student = null;
        
        try {
            connection = DBConnection.getConnection();
            String query = "SELECT * FROM student WHERE id = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, studentId);
            resultSet = preparedStatement.executeQuery();
            
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String course = resultSet.getString("course");
                
                student = new Student(id, name, email, course);
            }
            
        } catch (SQLException e) {
            System.err.println("Error fetching student by ID!");
            e.printStackTrace();
        } finally {
            closeResources(connection, preparedStatement, resultSet);
        }
        
        return student;
    }
    
    // Update student details
    public boolean updateStudent(Student student) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        boolean isUpdated = false;
        
        try {
            connection = DBConnection.getConnection();
            String query = "UPDATE student SET name = ?, email = ?, course = ? WHERE id = ?";
            preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, student.getName());
            preparedStatement.setString(2, student.getEmail());
            preparedStatement.setString(3, student.getCourse());
            preparedStatement.setInt(4, student.getId());
            
            int rowsAffected = preparedStatement.executeUpdate();
            isUpdated = (rowsAffected > 0);
            
        } catch (SQLException e) {
            System.err.println("Error updating student!");
            e.printStackTrace();
        } finally {
            closeResources(connection, preparedStatement, null);
        }
        
        return isUpdated;
    }
    
    // Delete student from database
    public boolean deleteStudent(int studentId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        boolean isDeleted = false;
        
        try {
            connection = DBConnection.getConnection();
            String query = "DELETE FROM student WHERE id = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, studentId);
            
            int rowsAffected = preparedStatement.executeUpdate();
            isDeleted = (rowsAffected > 0);
            
        } catch (SQLException e) {
            System.err.println("Error deleting student!");
            e.printStackTrace();
        } finally {
            closeResources(connection, preparedStatement, null);
        }
        
        return isDeleted;
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
