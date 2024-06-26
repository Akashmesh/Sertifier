<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Dashboard - Jadhao Industries</title>
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
            width: 90%;
            /*max-width: 800px;*/
            text-align: center;
            margin-top: 80px;
            overflow-x: auto;
        }
        .card table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .card table, .card th, .card td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .card th {
            background-color: #4CAF50;
            color: white;
        }
        .card button {
            background-color: #7469B6;
            border: none;
            color: white;
            padding: 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border-radius: 5px;
        }
        .card button:hover {
            background-color: #ff5722;
        }
        .footer {
            background-color: rgba(0, 0, 0, 0.5);
            text-align: center;
            padding: 10px 20px;
            font-size: 14px;
            width: 100%;
            position: relative;
            /*bottom: 0;*/
        }
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
            width: 70%;
            /*max-width: 400px;*/
            text-align: center;
            margin: 60px auto;
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
        #addbtn {
            width: 50%;
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
            <a href="managerLogin.jsp">Log Out</a>
        </div>
        
    </div>

    <div class="card">
        <h2>Manager Dashboard</h2>
        <button id="addbtn" onclick="window.location.href='addEmployee.jsp'">Add Employee</button>
        <table>
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Database connection parameters
                    String dbURL = "jdbc:mysql://localhost:3306/seminar";
                    String dbUser = "root";
                    String dbPass = "";

                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                        stmt = conn.createStatement();
                        String sql = "SELECT empregno, fname ,lname FROM employee";
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            String id = rs.getString("empregno");
                            String fname = rs.getString("fname");
                            String lname = rs.getString("lname");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= fname %> <%= lname %></td>
                    <td>
                        <div style="display:flex; flex-direction: row; align-items: center; justify-content: space-around;">
                            
                            <button style="width:60%; margin: 2px;" onclick="window.location.href='viewEmployeeDetails.jsp?empregno=<%= id %>'">View</button>
                        <button style="width:60%; margin: 2px;" onclick="window.location.href='updateEmployee.jsp?empregno=<%= id %>'">Update</button>
                        <button style="width:60%; margin: 2px; background-color:red !important;" onclick="window.location.href='deleteEmployee?empregno=<%=id%>'  " >Delete</button>
                        </div>
                        
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </tbody>
        </table>
    </div>
    <div class="footer">
      
        <p>&copy; <span id="year"></span> Jadhao Industries. All rights reserved.</p>
    </div>
    <script>
        document.getElementById("year").textContent = new Date().getFullYear();

        function toggleMobileMenu() {
            const mobileMenu = document.querySelector('.navbar-right.mobile');
            if (mobileMenu.style.display === "flex") {
                mobileMenu.style.display = "none";
            } else {
                mobileMenu.style.display = "flex";
            }
        }

        function deleteEmployee(empId) {
            if (confirm("Are you sure you want to delete this employee?")) {
                window.location.href = `deleteEmployee.jsp?empregno=${empId}`;
            }
        }
    </script>
</body>
</html>
