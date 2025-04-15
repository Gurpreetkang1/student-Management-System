<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>All Students</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            margin: 0;
            padding: 40px;
        }

        h2 {
            color: #2c3e50;
            font-size: 32px;
            margin-bottom: 15px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .btn {
            padding: 12px 20px;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            margin-left: 10px;
            transition: all 0.3s ease;
        }

        .btn.dashboard {
            background: #34495e;
            color: #ecf0f1;
        }

        .btn.dashboard:hover {
            background: #2c3e50;
        }

        .btn.add {
            background: #27ae60;
            color: white;
        }

        .btn.add:hover {
            background: #219150;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            padding: 14px 16px;
            text-align: center;
            border-bottom: 1px solid #f0f0f0;
        }

        th {
            background-color: #3498db;
            color: white;
            font-size: 16px;
            text-transform: uppercase;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .btn.edit {
            background: #f39c12;
            color: white;
        }

        .btn.edit:hover {
            background: #e67e22;
        }

        .btn.delete {
            background: #e74c3c;
            color: white;
        }

        .btn.delete:hover {
            background: #c0392b;
        }

        .actions {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        @media screen and (max-width: 768px) {
            th, td {
                font-size: 14px;
                padding: 10px;
            }

            .btn {
                padding: 10px;
                font-size: 12px;
            }
        }
    </style>
</head>
<body>

<div class="top-bar">
    <h2>All Students</h2>
    <div>
        <a href="dashboard.jsp" class="btn dashboard">Dashboard</a>
        <a href="addStudent.jsp" class="btn add">Add Student</a>
    </div>
</div>

<table>
    <tr>
        <th>ID</th>
        <th>UID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Course</th>
        <th>Actions</th>
    </tr>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_db", "root", "Gurpreet@2004");
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM students");

            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("uid") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("course") %></td>
        <td class="actions">
            <a href="updateStudent.jsp?id=<%= rs.getInt("id") %>" class="btn edit">Edit</a>
            <a href="DeleteStudentServlet?id=<%= rs.getInt("id") %>" class="btn delete" onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
        </td>
    </tr>
    <%
            }
        } catch (Exception e) {
            out.println("<tr><td colspan='6' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    %>
</table>

</body>
</html>