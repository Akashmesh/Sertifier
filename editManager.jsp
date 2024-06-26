<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Manager - Jadhao Industries</title>
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

        .card {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 400px;
            text-align: center;
            margin: 80px auto;
        }

        .card input, .card button {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            border: none;
            font-size: 16px;
            box-sizing: border-box;
        }

        .card button {
            background-color: #7469B6;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
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
    </style>
</head>
<body>
   <div class="navbar">
        <div class="logo">
            <img src="logo.png" alt="Logo">
        </div>
        <div class="navitems">
            <a href="index.jsp">Home</a>
            <a href="adminDashboard.jsp">Dashboard</a>
            <a href="adminLogin.jsp">Log Out</a>
        </div>
            </div>
    <div class="card">
        <h2>Edit Manager</h2>
        <% 
            String id = request.getParameter("id");
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            String name = "", username = "", password = "";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seminar", "root", "");
                stmt = con.createStatement();
                String sql = "SELECT * FROM manager WHERE id=" + id;
                rs = stmt.executeQuery(sql);
                if (rs.next()) {
                    name = rs.getString("name");
                    username = rs.getString("username");
                    password = rs.getString("password");
                }
            } catch (Exception e) {
                out.print(e);
            }
        %>
        <form action="updateManager.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <input type="text" name="name" value="<%= name %>" placeholder="Manager Name" required>
            <input type="text" name="username" value="<%= username %>" placeholder="User Name" required>
            <input type="password" name="password" value="<%= password %>" placeholder="Password" required>
            <button type="submit">Update</button>
        </form>
    </div>

    <div class="footer">
        <p>&copy; <span id="year"></span> Jadhao Industries. All rights reserved.</p>
    </div>

    <script>
        document.getElementById("year").textContent = new Date().getFullYear();
      
    </script>
</body>
</html>