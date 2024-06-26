<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String name = request.getParameter("name");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    String errorMessage = null;
    boolean success = false;

    if (name != null && username != null && password != null) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/seminar", "root", "");

            String sql = "INSERT INTO manager (name, username, password) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, username);
            stmt.setString(3, password);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                success = true;
            } else {
                errorMessage = "Failed to add manager.";
            }
        } catch (Exception e) {
            errorMessage = "An error occurred: " + e.getMessage();
        } 
    } else {
        errorMessage = "All fields are required.";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Manager - Jadhao Industries</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            color: #fff;
            display: flex;
            flex-direction: column;
            height: 100vh;
            background: url("dashboardbg.jpg");
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;
        }

        .logo img {
            width: 20%;
        }

        .navitems {
            display: flex;
            align-items: center;
            margin-top: 30px;
            margin-left: auto;
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

       

       

        .card h2 {
            color: #373737;
        }
        .card {
            background-color: rgba(0, 0, 0, 0.2);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 400px;
            text-align: center;
            margin: 80px auto;
        }
        .card input[type="text"],
        .card input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            box-sizing: border-box;
            font-weight: 600;
        }
        .card button {
            background-color: #7469B6;
            border: none;
            color: white;
            padding: 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 0;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border-radius: 5px;
            width: 100%;
        }
        .card button:hover {
            background-color: #ff5722;
        }
        .footer {
            background-color: #373737;
            text-align: center;
            padding: 10px 20px;
            font-size: 14px;
            width: 100%;
            position: fixed;
            bottom: 0;
        }
        .error-message {
            color: #ff5722;
            font-size: 14px;
            margin-top: 10px;
        }
        
      
        
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <img src="logo.png" alt="Logo">
        </div>
       
        <div class="navitems" id="navitems">
            <a href="index.jsp">Home</a>
            <a href="adminDashboard.jsp">Dashboard</a>
            <a href="adminLogin.jsp">Log Out</a>
        </div>
    </div>
  
    <div class="card">
        <h2>Add Manager</h2>
        <% if (errorMessage != null) { %>
        <div class="error-message" id="error-message"><%= errorMessage %></div>
        <% } else if (success) { %>
        <script>
            alert("Manager added successfully.");
            window.location.href = "adminDashboard.jsp";
        </script>
        <% } %>
        <form id="addManagerForm" action="" method="post" onsubmit="return validateForm()">
            <input type="text" id="name" name="name" placeholder="Name" required>
            <!--<input type="text" id="empregno" name="empregno" placeholder="Employee Registration Number" required>-->
            <input type="text" id="username" name="username" placeholder="Username" required>
            <input type="password" id="password" name="password" placeholder="Password" required>
            <button type="submit">Add Manager</button>
        </form>
    </div>
    <div class="footer">
        <p>&copy; <span id="year"></span> Jadhao Industries. All rights reserved.</p>
    </div>
    <script>
        document.getElementById("year").textContent = new Date().getFullYear();

        function validateForm() {
            var name = document.getElementById("name").value;
            
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;

            if (name === "" ||  username === "" || password === "") {
                document.getElementById("error-message").textContent = "All fields are required.";
                return false;
            }

            // Add more validations as needed

            return true;
        }

    </script>
</body>
</html>