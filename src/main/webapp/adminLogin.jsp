<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap');

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Montserrat', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #1d2b64, #f8cdda);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 40px 35px;
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 420px;
            animation: fadeIn 0.8s ease;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h2 {
            text-align: center;
            color: #fff;
            margin-bottom: 25px;
            font-weight: 600;
        }

        .input-group {
            position: relative;
            margin-bottom: 25px;
        }

        .input-group input {
            width: 100%;
            padding: 14px 45px 14px 15px;
            border: none;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.25);
            color: #fff;
            font-size: 15px;
            transition: 0.3s;
        }

        .input-group input:focus {
            background: rgba(255, 255, 255, 0.35);
            outline: none;
        }

        .input-group i {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #fff;
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(to right, #43cea2, #185a9d);
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.4s;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #2bc0e4, #eaecc6);
            color: #000;
        }

        .footer-text {
            margin-top: 20px;
            text-align: center;
            font-size: 13px;
            color: #eee;
        }

        @media (max-width: 500px) {
            .login-container {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>🔐 Admin Login</h2>
        <form action="AdminLoginServlet" method="post">
            <div class="input-group">
                <input type="text" name="username" placeholder="Enter Username" required>
                <i class="fas fa-user"></i>
            </div>
            <div class="input-group">
                <input type="password" name="password" placeholder="Enter Password" required>
                <i class="fas fa-lock"></i>
            </div>
            <input type="submit" value="Login">
        </form>
        <div class="footer-text">
            &copy; 2025 Chandigarh University | UIC Admin Panel
        </div>
    </div>
</body>
</html>
