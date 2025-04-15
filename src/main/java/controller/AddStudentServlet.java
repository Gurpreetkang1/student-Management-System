package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import model.DBConnection;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String uid = request.getParameter("uid");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                 "INSERT INTO students(uid, name, email, course) VALUES (?, ?, ?, ?)")) {

            ps.setString(1, uid);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, course);

            int rowsInserted = ps.executeUpdate();

            if (rowsInserted > 0) {
                response.sendRedirect("viewStudents.jsp?status=success");
            } else {
                response.sendRedirect("addStudent.jsp?status=fail");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("addStudent.jsp?status=error");
        }
    }
} 