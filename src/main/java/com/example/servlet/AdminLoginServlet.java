package com.example.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("=== LOGIN REQUEST RECEIVED ===");
        System.out.println("Context Path: " + request.getContextPath());
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        System.out.println("Username: " + username);
        System.out.println("Password: " + password);

        if ("admin".equals(username) && "admin123".equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("adminName", username);
            System.out.println("Session created: " + session.getId());
            
            String redirectPath = request.getContextPath() + "/dashboard";
            System.out.println("Redirecting to: " + redirectPath);
            
            // Ensure no caching of sensitive pages
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            
            response.sendRedirect(redirectPath);
            return;
        } else {
            request.setAttribute("error", "Invalid credentials");
            request.getRequestDispatcher("/adminLogin.jsp").forward(request, response);
        }
    }
}