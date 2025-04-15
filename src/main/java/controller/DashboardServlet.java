package com.example.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("=== DASHBOARD ACCESS ATTEMPT ===");
        
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("adminName") == null) {
            System.out.println("Unauthorized access attempt");
            response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
            return;
        }
        
        System.out.println("User " + session.getAttribute("adminName") + " accessing dashboard");
        request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
    }
}