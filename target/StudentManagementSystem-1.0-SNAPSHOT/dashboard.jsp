<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Rubik:wght@400;600&display=swap');

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Rubik', sans-serif;
        }

        body {
            background: linear-gradient(120deg, #e0eafc, #cfdef3);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background: #2c3e50;
            color: white;
            padding: 18px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.25);
        }

        .navbar h1 {
            font-size: 24px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logout-btn {
            background-color: #e74c3c;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            font-size: 14px;
            transition: 0.3s;
        }

        .logout-btn:hover {
            background-color: #c0392b;
            box-shadow: 0 0 12px rgba(231, 76, 60, 0.5);
        }

        .dashboard {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
            padding: 20px;
            flex: 1;
        }

        .welcome {
            text-align: center;
            margin-bottom: 35px;
        }

        .welcome h2 {
            font-size: 30px;
            color: #2c3e50;
        }

        /* Controls Section */
        .controls {
            display: flex;
            justify-content: space-evenly;
            margin-bottom: 40px;
        }

        .card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(8px);
            padding: 35px 25px;
            border-radius: 18px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            text-align: center;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease-in-out;
            width: 180px;
        }

        .card::before {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(135deg, #9b59b6, #3498db);
            transform: rotate(45deg);
            opacity: 0.08;
            pointer-events: none;
        }

        .card:hover {
            transform: translateY(-6px) scale(1.02);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.25);
        }

        .card i {
            font-size: 42px;
            color: #3498db;
            margin-bottom: 20px;
            transition: transform 0.3s ease-in-out;
        }

        .card:hover i {
            transform: scale(1.2);
        }

        .card h3 {
            font-size: 22px;
            color: #2c3e50;
            margin-bottom: 15px;
        }

        .card a {
            text-decoration: none;
            padding: 12px 26px;
            background: linear-gradient(135deg, #3498db, #9b59b6);
            color: white;
            border-radius: 12px;
            font-weight: bold;
            display: inline-block;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }

        .card a:hover {
            background: linear-gradient(135deg, #9b59b6, #3498db);
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25);
        }

        .card a::after {
            content: " →";
            transition: margin-left 0.3s;
        }

        .card a:hover::after {
            margin-left: 8px;
        }

        .footer {
            background: #2c3e50;
            color: #bdc3c7;
            text-align: center;
            padding: 15px 0;
            font-size: 14px;
        }

        /* Stats Section */
        .dashboard-stats {
            margin-bottom: 40px;
            text-align: center;
        }

        .dashboard-stats h2 {
            font-size: 28px;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(8px);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            margin: 20px;
            text-align: center;
        }

        .stat-card canvas {
            max-width: 100%;
            height: auto;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1><i class="fas fa-cogs"></i> Admin Dashboard</h1>
        <form action="logout.jsp" method="post">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>

    <div class="dashboard">
        <div class="welcome">
            <h2>Welcome, <%= adminName %> 👋</h2>
        </div>

        <!-- Controls Section -->
        <div class="controls">
            <div class="card" title="Register a new student into the system">
                <i class="fas fa-user-plus"></i>
                <h3>Add Student</h3>
                <a href="addStudent.jsp">Click</a>
            </div>

            <div class="card" title="Browse the list of registered students">
                <i class="fas fa-users"></i>
                <h3>View Students</h3>
                <a href="viewStudents.jsp">Click</a>
            </div>

            <div class="card" title="Edit student records as needed">
                <i class="fas fa-edit"></i>
                <h3>Update Records</h3>
                <a href="viewStudents.jsp">Click</a>
            </div>

            <div class="card" title="Remove a student from the database">
                <i class="fas fa-trash-alt"></i>
                <h3>Delete Student</h3>
                <a href="viewStudents.jsp">Click</a>
            </div>
        </div>

        <!-- Real-Time Statistics Section -->
        <div class="dashboard-stats">
            <h2>Real-Time Statistics</h2>

            <div class="stat-card">
                <h3>Total Number of Students</h3>
                <canvas id="totalStudentsChart"></canvas>
            </div>

            <div class="stat-card">
                <h3>Students per Course</h3>
                <canvas id="studentsPerCourseChart"></canvas>
            </div>

            <div class="stat-card">
                <h3>Most Popular Courses</h3>
                <canvas id="popularCoursesChart"></canvas>
            </div>

            <div class="stat-card">
                <h3>Average Student Performance</h3>
                <canvas id="studentPerformanceChart"></canvas>
            </div>
        </div>
    </div>

    <div class="footer">
        © 2025 Chandigarh University | UIC Department | Admin Panel
    </div>

    <script>
        // Dummy Data for Charts (replace with real data from your backend)
        const totalStudents = 150;
        const coursesData = {
            labels: ['Course A', 'Course B', 'Course C'],
            datasets: [{
                data: [45, 60, 45], // Number of students per course
                backgroundColor: ['#3498db', '#e74c3c', '#2ecc71'],
            }]
        };
        const popularCoursesData = {
            labels: ['Course A', 'Course B', 'Course C'],
            datasets: [{
                data: [75, 50, 100], // Popularity based on student interest
                backgroundColor: ['#9b59b6', '#f39c12', '#e74c3c'],
            }]
        };
        const studentPerformanceData = {
            labels: ['Math', 'English', 'Science'],
            datasets: [{
                label: 'Average Score',
                data: [85, 90, 80], // Average performance in different subjects
                backgroundColor: 'rgba(26, 188, 156, 0.5)',
                borderColor: 'rgba(26, 188, 156, 1)',
                borderWidth: 1,
            }]
        };

        const ctxTotalStudents = document.getElementById('totalStudentsChart').getContext('2d');
        const ctxStudentsPerCourse = document.getElementById('studentsPerCourseChart').getContext('2d');
        const ctxPopularCourses = document.getElementById('popularCoursesChart').getContext('2d');
        const ctxStudentPerformance = document.getElementById('studentPerformanceChart').getContext('2d');

        new Chart(ctxTotalStudents, {
            type: 'doughnut',
            data: {
                labels: ['Total Students'],
                datasets: [{
                    data: [totalStudents],
                    backgroundColor: ['#3498db'],
                }]
            }
        });

        new Chart(ctxStudentsPerCourse, {
            type: 'pie',
            data: coursesData
        });

        new Chart(ctxPopularCourses, {
            type: 'bar',
            data: popularCoursesData
        });

        new Chart(ctxStudentPerformance, {
            type: 'radar',
            data: studentPerformanceData
        });
    </script>
</body>
</html>
