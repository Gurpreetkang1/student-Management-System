<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String idParam = request.getParameter("id");
    if (idParam == null || idParam.isEmpty()) {
%>
    <h3 style="color: red;">Error: Student ID not provided in URL!</h3>
    <a href="viewStudents.jsp">Go Back</a>
<%
    return;
    }

    int id = 0;
    try {
        id = Integer.parseInt(idParam);
    } catch (NumberFormatException e) {
%>
    <h3 style="color: red;">Invalid Student ID format!</h3>
    <a href="viewStudents.jsp">Go Back</a>
<%
    return;
    }

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_db", "root", "Gurpreet@2004");
        ps = conn.prepareStatement("SELECT * FROM students WHERE id=?");
        ps.setInt(1, id);
        rs = ps.executeQuery();

        if (rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #667eea, #764ba2);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .card {
            background-color: #fff;
            padding: 40px 50px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            max-width: 550px;
            width: 100%;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 28px;
            color: #333;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 14px;
            margin-bottom: 20px;
            border: 2px solid #ddd;
            border-radius: 12px;
            font-size: 15px;
            background-color: #f7f7f7;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus {
            border-color: #667eea;
            background-color: #fff;
            box-shadow: 0 0 6px rgba(102, 126, 234, 0.4);
            outline: none;
        }

        input[readonly] {
            background-color: #e9ecef;
            color: #999;
            cursor: not-allowed;
        }

        .btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border: none;
            color: #fff;
            font-weight: bold;
            font-size: 16px;
            border-radius: 12px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .btn:hover {
            background: linear-gradient(135deg, #5a67d8, #6b46c1);
            transform: translateY(-1px);
        }

        .back-btn {
            display: block;
            text-align: center;
            margin-top: 20px;
            background-color: #2c3e50;
            padding: 12px;
            color: white;
            border-radius: 10px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .back-btn:hover {
            background-color: #1a252f;
        }

    </style>
</head>
<body>
    <div class="card">
        <h2>Update Student</h2>
        <form action="UpdateStudentServlet" method="post">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

            <label>UID:</label>
            <input type="text" name="uid" value="<%= rs.getString("uid") %>" readonly>

            <label>Name:</label>
            <input type="text" name="name" value="<%= rs.getString("name") %>" required>

            <label>Email:</label>
            <input type="email" name="email" value="<%= rs.getString("email") %>" required>

            <label>Course:</label>
            <input type="text" name="course" value="<%= rs.getString("course") %>" required>

            <input type="submit" class="btn" value="Update Student">
        </form>
        <a href="viewStudents.jsp" class="back-btn">Back to Student List</a>
    </div>
</body>
</html>
<%
        } else {
%>
    <h3 style="color: red;">No student found with ID <%= id %>.</h3>
    <a href="viewStudents.jsp">Go Back</a>
<%
        }
    } catch (Exception e) {
%>
    <h3 style="color:red;">Error: <%= e.getMessage() %></h3>
    <a href="viewStudents.jsp">Go Back</a>
<%
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception ignored) {}
        if (ps != null) try { ps.close(); } catch (Exception ignored) {}
        if (conn != null) try { conn.close(); } catch (Exception ignored) {}
    }
%>
