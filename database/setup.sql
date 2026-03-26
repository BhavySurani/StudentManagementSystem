-- Student Management System Database Setup

-- Create Database
CREATE DATABASE IF NOT EXISTS sms;
USE sms;

-- Create Admin Table
CREATE TABLE IF NOT EXISTS admin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

-- Create Student Table
CREATE TABLE IF NOT EXISTS student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    course VARCHAR(50) NOT NULL
);

-- Insert Default Admin
INSERT INTO admin (username, password) VALUES ('admin', 'admin123');

-- Sample Student Data (Optional)
INSERT INTO student (name, email, course) VALUES 
('John Doe', 'john.doe@example.com', 'Computer Science'),
('Jane Smith', 'jane.smith@example.com', 'Information Technology');
