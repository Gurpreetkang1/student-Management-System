<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px 35px;
            border-radius: 18px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
            width: 420px;
            animation: fadeIn 0.8s ease;
        }

        @keyframes fadeIn {
            from {
                transform: translateY(20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .form-container h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
            font-weight: 600;
        }

        label {
            font-weight: 500;
            color: #333;
            display: block;
            margin-bottom: 6px;
        }

        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 12px 14px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="email"]:focus {
            border-color: #4caf50;
            outline: none;
        }

        input[type="submit"] {
            background: linear-gradient(to right, #4CAF50, #45a049);
            color: white;
            padding: 14px;
            width: 100%;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #45a049, #4CAF50);
            transform: scale(1.02);
        }

        .uid {
            color: #777;
            font-size: 13px;
            margin-top: -15px;
            margin-bottom: 20px;
            font-style: italic;
        }

        @media (max-width: 480px) {
            .form-container {
                width: 90%;
                padding: 30px 20px;
            }

            input[type="submit"] {
                font-size: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Add New Student</h2>
        <form action="AddStudentServlet" method="post">
            <label for="uid">Student UID:</label>
            <input type="text" id="uid" name="uid" required placeholder="e.g. CU123456">
            <div class="uid">University ID (e.g., CU123456)</div>

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required placeholder="Enter full name">

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required placeholder="Enter email address">

            <label for="course">Course:</label>
            <input type="text" id="course" name="course" required placeholder="e.g. MCA, BCA">

            <input type="submit" value="Add Student">
        </form>
    </div>
</body>
</html>
