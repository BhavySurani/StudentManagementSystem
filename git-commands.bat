@echo off
echo ========================================
echo Student Management System
echo Push to GitHub Script
echo ========================================
echo.

REM Configure Git
git config user.name "BhavySurani"
git config user.email "patelbhavy6651@gmail.com"

REM Initialize repository
git init

REM Add all files
echo Adding all files...
git add .

REM Commit
echo Committing files...
git commit -m "Initial commit: Complete Student Management System with MVC architecture"

REM Add remote (UPDATE THIS URL AFTER CREATING REPOSITORY ON GITHUB)
echo Adding remote repository...
git remote add origin https://github.com/BhavySurani/StudentManagementSystem.git

REM Push to GitHub
echo Pushing to GitHub...
git push -u origin master

echo.
echo ========================================
echo Done! Check your GitHub repository
echo https://github.com/BhavySurani/StudentManagementSystem
echo ========================================
pause
