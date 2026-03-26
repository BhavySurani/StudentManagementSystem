#!/bin/bash

echo "========================================"
echo "Student Management System"
echo "Push to GitHub Script"
echo "========================================"
echo ""

# Configure Git
git config user.name "BhavySurani"
git config user.email "patelbhavy6651@gmail.com"

# Initialize repository
git init

# Add all files
echo "Adding all files..."
git add .

# Commit
echo "Committing files..."
git commit -m "Initial commit: Complete Student Management System with MVC architecture"

# Add remote (UPDATE THIS URL AFTER CREATING REPOSITORY ON GITHUB)
echo "Adding remote repository..."
git remote add origin https://github.com/BhavySurani/StudentManagementSystem.git

# Push to GitHub
echo "Pushing to GitHub..."
git push -u origin master

echo ""
echo "========================================"
echo "Done! Check your GitHub repository"
echo "https://github.com/BhavySurani/StudentManagementSystem"
echo "========================================"
