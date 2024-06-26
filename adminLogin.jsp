<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Jadhao Industries</title>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Open Sans", sans-serif;
        }

        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            width: 100%;
            position: absolute;
            top: 0;
            box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;
/*            background: rgba(255, 255, 255, 0.8);*/
            z-index: 10;
        }

        .logo img {
            width: 20%;
        }

        .navitems {
            display: flex;
            align-items: center;
        }

        .navitems a {
            color: black;
            text-decoration: none;
            padding: 10px 30px;
            transition: background 0.3s;
            border-radius: 25px;
            font-size: 18px;
        }

        .navitems a:hover {
            background: #373737;
            scale: 1.1;
            color: #ffffff;
        }

        .login {
            position: relative;
        }

        .loginmenu {
              display: none;
                position: absolute;
                top: 30px;
                left: 0;
                background: #EEEEEE;
                padding: 10px;
                border-radius: 5px;
                width: 160px;
                z-index: 2;
                text-align: center;
        }
        .loginmenu a {
             display: block;
                padding: 5px 0;
        }

        .login:hover .loginmenu {
            display: block;
        }

        body::before {
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
            background: url("loginbg.jpg"), #000;
            background-position: center;
            background-size: cover;
            z-index: -1;
        }

        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
        }

        .wrapper {
            width: 400px;
            border-radius: 8px;
            padding: 30px;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.5);
            background: rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(9px);
            -webkit-backdrop-filter: blur(9px);
        }

        form {
            display: flex;
            flex-direction: column;
            padding: 10px 0;
        }

        h2 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #fff;
        }

        .input-field {
            position: relative;
            border-bottom: 2px solid #ccc;
            margin: 15px 0;
        }

        .input-field label {
            position: absolute;
            top: 50%;
            left: 0;
            transform: translateY(-50%);
            color: #fff;
            font-size: 16px;
            pointer-events: none;
            transition: 0.15s ease;
        }

        .input-field input {
            width: 100%;
            height: 40px;
            background: transparent;
            border: none;
            outline: none;
            font-size: 16px;
            color: #fff;
        }

        .input-field input:focus~label,
        .input-field input:valid~label {
            font-size: 0.8rem;
            top: 10px;
            transform: translateY(-120%);
        }

        .wrapper a {
            color: #efefef;
            text-decoration: none;
        }

        .wrapper a:hover {
            text-decoration: underline;
        }

        button {
            background: #fff;
            color: #000;
            font-weight: 600;
            border: none;
            padding: 12px 20px;
            cursor: pointer;
            border-radius: 3px;
            font-size: 16px;
            border: 2px solid transparent;
            transition: 0.3s ease;
        }

        button:hover {
            color: #fff;
            border-color: #fff;
            background: rgba(255, 255, 255, 0.15);
        }

        button:active {
            transform: scale(0.9);
        }

        .footer {
            text-align: center;
            padding: 10px;
            background: #373737;
            color: white;
        }

        .footer p {
            margin: 0;
        }

        /* Mobile View */
        .hamburger {
            display: none;
            flex-direction: column;
            cursor: pointer;
        }

        .hamburger div {
            width: 25px;
            height: 2px;
            background-color: black;
            margin: 4px;
        }

        @media (max-width: 768px) {
            .navitems {
                display: none;
                flex-direction: column;
                position: absolute;
                top: 70px;
                right: 0;
                width: 80%;
                align-items: flex-start;
                padding: 10px;
                background: rgba(0 ,0, 0, 0.2);
            }

            .navitems a {
                width: 50%;
                padding: 10px 20px;
                text-align: left;
            }

            .hamburger {
                display: flex;
            }
            .loginmenu {
                width: 220%;
            }
        }
        .invalid-login {
            color: red;
            font-weight: 600;
            position: absolute;
            margin-top: 32%;
            margin-left: 580px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <img src="logo.png" alt="Logo">
        </div>
        <div class="navitems">
            <a href="index.jsp">Home</a>
            <div class="login">
                <a href="#">Login</a>
                <div class="loginmenu">
                    <a href="adminLogin.jsp">Admin Login</a>
                    <a href="managerLogin.jsp">Manager Login</a>
                </div>
            </div>
            <a href="contactus.jsp">Contact Us</a>
        </div>
        <div class="hamburger" onclick="toggleMenu()">
            <div></div>
            <img src="../../../../Downloads/industry.jpg" alt=""/>
            <div></div>
            <div></div>
        </div>
    </div>

    <div class="content">
        <div class="wrapper">
            <form id="loginForm" action="" method="post" onsubmit="return validateForm()">
                <h2>Admin Login</h2>
                <div class="input-field">
                    <input type="text" id="username" name="username" required>
                    <label for="username">Enter your Username</label>
                </div>
                <div class="input-field">
                    <input type="password" id="password" name="password" required>
                    <label for="password">Enter your Password</label>
                </div>
                <button type="submit">LOGIN</button>
            </form>
        </div>
    </div>

    <div class="invalid-login">
        <% 
            String errorMessage = request.getParameter("error");
            if (errorMessage != null) {
                out.print("Invalid username or password. Please try again.");
            }
        %>
    </div>

    <div class="footer">
        <p>&copy; <span id="year"></span> Jadhao Industries. All rights reserved.</p>
    </div>

    <script>
        document.getElementById("year").textContent = new Date().getFullYear();

        function validateForm() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            if (username == "" || password == "") {
                alert("Username and Password must be filled out");
                return false;
            }
            return true;
        }

        function toggleMenu() {
            var navitems = document.querySelector('.navitems');
            if (navitems.style.display === 'flex') {
                navitems.style.display = 'none';
            } else {
                navitems.style.display = 'flex';
            }
        }
    </script>
</body>
</html>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String dbUsername = null;
        String dbPassword = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Connect to the database
            String dbURL = "jdbc:mysql://localhost:3306/seminar";
            String dbUser = "root"; // Change to your database username
            String dbPass = ""; // Change to your database password
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            
            // Create a SQL query
            String sql = "SELECT username, password FROM adminlogin WHERE username = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            
            // Execute the query
            rs = pstmt.executeQuery();
            
            // Check if the user exists
            if (rs.next()) {
                dbUsername = rs.getString("username");
                dbPassword = rs.getString("password");
            }
            
            // Validate the username and password
            if (username.equals(dbUsername) && password.equals(dbPassword)) {
                response.sendRedirect("adminDashboard.jsp");
            } else {
                response.sendRedirect("adminLogin.jsp?error=true");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the ResultSet, PreparedStatement, and Connection
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>