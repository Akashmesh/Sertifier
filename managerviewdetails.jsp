<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Managers - Jadhao Industries</title>
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

        .hamburger {
            display: none;
            flex-direction: column;
            cursor: pointer;
        }

        .hamburger div {
            width: 25px;
            height: 3px;
            background-color: black;
            margin: 4px 0;
            transition: 0.4s;
        }

        .card {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 600px;
            text-align: center;
            margin: 100px auto 50px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 16px;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
        }

        table th {
            background-color: #333;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }

        table tr:hover {
            background-color: rgba(255, 87, 34, 0.3);
        }

        table a.button {
            background-color: #7469B6;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 5px 2px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border-radius: 5px;
        }

        table a.button:hover {
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

        @media (max-width: 768px) {
            .navitems {
                display: none;
                flex-direction: column;
                width: 100%;
                background-color: rgba(255, 255, 255, 0.7);
                position: absolute;
                top: 50px;
                left: 0;
                z-index: 10;
            }

            .navitems a {
                padding: 15px 0;
                text-align: center;
                width: 100%;
            }

            .hamburger {
                display: flex;
            }

            .hamburger.active div:nth-child(1) {
                transform: rotate(-45deg) translate(-5px, 6px);
            }

            .hamburger.active div:nth-child(2) {
                opacity: 0;
            }

            .hamburger.active div:nth-child(3) {
                transform: rotate(45deg) translate(-5px, -6px);
            }
            .card {
            background-color: rgba(0, 0, 0, 0.7);
            }
            .navbar {
                position: relative;
            }
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
        <div class="hamburger" onclick="toggleMenu()">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <div class="card">
        <h2>Managers</h2>
        <table>
            <tr>
                <th>No.</th>
                <th>Manager Name</th>
                <th>User Name</th>
                <th>Password</th>
                <th>Action</th>
            </tr>
            <% 
                int i = 1;
                String sql = "select * from manager";
                
                Connection con = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seminar", "root", "");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);
                    while (rs.next()) {
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("name")%></td>
              
                <td><%=rs.getString("username")%></td>
                <td><%=rs.getString("password")%></td>
                <td>
                    <div style="display: flex; flex-direction: row; justify-content: space-around; align-items: center;"> 
                        <a href='editManager.jsp?id=<%=rs.getInt("id")%>' class="button">Edit</a>
                        <a href='deleteManager.jsp?id=<%=rs.getInt("id")%>' class="button">Delete</a>
                    </div>
                </td>
            </tr>
            <% 
                        i++;
                    }
                } catch (Exception e) {
                    out.print(e);
                }
            %>
        </table>
    </div>
    <div class="footer">
        <p>&copy; <span id="year"></span> Jadhao Industries. All rights reserved.</p>
    </div>
    <script>
        document.getElementById("year").textContent = new Date().getFullYear();

        function toggleMenu() {
            var navItems = document.querySelector('.navitems');
            navItems.style.display = (navItems.style.display === 'flex') ? 'none' : 'flex';

            var hamburger = document.querySelector('.hamburger');
            hamburger.classList.toggle('active');
        }
    </script>
</body>
</html>