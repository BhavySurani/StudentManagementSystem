package com.studentmgmt;

import org.apache.catalina.Context;
import org.apache.catalina.LifecycleException;
import org.apache.catalina.startup.Tomcat;

import java.io.File;

/**
 * Main class to run the Student Management System
 * This starts an embedded Tomcat server
 */
public class Main {
    
    public static void main(String[] args) {
        
        System.out.println("========================================");
        System.out.println("Student Management System Starting...");
        System.out.println("========================================");
        
        // Create Tomcat instance
        Tomcat tomcat = new Tomcat();
        tomcat.setPort(8080);
        tomcat.getConnector();
        
        try {
            // Set webapp directory
            String webappDirLocation = "src/main/webapp/";
            Context context = tomcat.addWebapp("/StudentManagementSystem", 
                                              new File(webappDirLocation).getAbsolutePath());
            
            System.out.println("Webapp directory: " + webappDirLocation);
            
            // Start Tomcat
            tomcat.start();
            
            System.out.println("========================================");
            System.out.println("✅ Server started successfully!");
            System.out.println("========================================");
            System.out.println("📌 Open your browser and go to:");
            System.out.println("   http://localhost:8080/StudentManagementSystem/");
            System.out.println("========================================");
            System.out.println("🔑 Login credentials:");
            System.out.println("   Username: admin");
            System.out.println("   Password: admin123");
            System.out.println("========================================");
            System.out.println("Press Ctrl+C to stop the server");
            System.out.println("========================================");
            
            // Keep server running
            tomcat.getServer().await();
            
        } catch (LifecycleException e) {
            System.err.println("❌ Failed to start server!");
            e.printStackTrace();
        }
    }
}
