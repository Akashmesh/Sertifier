<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Employee - Jadhao Industries</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            color: #fff;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background: url("dashboardbg.jpg") no-repeat center center fixed;
            background-size: cover;
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
            color: #373737;
            text-decoration: none;
            padding: 10px 30px;
            transition: background 0.3s;
            border-radius: 25px;
            font-size: 18px;
        }
        .navitems a:hover {
            background: #373737;
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
            background-color: #fff;
            margin: 4px;
        }
        .card {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 600px;
            text-align: center;
            margin: 50px auto;
            flex-grow: 1;
        }
        .card input[type="text"],
        .card input[type="date"],
        .card input[type="file"],
        .card input[type="number"],
        .card select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            box-sizing: border-box;
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
            flex-shrink: 0;
        }
        @media (max-width: 768px) {
            .navitems {
                display: none;
                flex-direction: column;
                width: 100%;
                background-color: rgba(255, 255, 255, 0.3);
                position: absolute;
                top: 50px;
                left: 0;
                z-index: 1;
            }
            .navitems a {
                text-align: center;
                padding: 15px;
                width: 100%;
                border-top: 1px solid #fff;
            }
            .hamburger {
                display: flex;
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
            <a href="managerDashboard.jsp">Dashboard</a>
            <a href="managerLogin.jsp">Log Out</a>
        </div>
        <div class="hamburger" onclick="toggleMenu()">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <div class="card">
        <h2>Update Employee</h2>
        <form id="updateEmployeeForm" action="updateEmployee" method="post" enctype="multipart/form-data">
            <%
                String empregno = request.getParameter("empregno");
                String name = "", surname = "", fathersName = "", dob = "", contactAddress = "", companyName = "", jobTitle = "";
                String mobileNumber = "", whatsappNumber = "";

                if (empregno != null && !empregno.isEmpty()) {
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
                        String sql = "SELECT * FROM employee WHERE empregno = '" + empregno + "'";
                        rs = stmt.executeQuery(sql);

                        if (rs.next()) {
                            name = rs.getString("fname");
                            surname = rs.getString("lname");
                            fathersName = rs.getString("fathersName");
                            dob = rs.getString("dob");
                            contactAddress = rs.getString("contactAddress");
                            companyName = rs.getString("companyName");
                            jobTitle = rs.getString("jobTitle");
                            mobileNumber = rs.getString("mobileNumber");
                            whatsappNumber = rs.getString("whatsappNumber");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                }
            %>
            <input type="text" name="empregno" value="<%= empregno %>" hidden>
            <div style="display: flex; flex-direction: row; align-items: center; width: 100%; justify-content: space-between;">
                <input type="text" name="name" style="margin-right: 4px !important;" value="<%= name %>" placeholder="Name" required>
                <input type="text" name="surname" value="<%= surname %>" placeholder="Surname" required>
            </div>
            <input type="text" name="fathersName" value="<%= fathersName %>" placeholder="Father's Name" required>
            <input type="date" name="dob" value="<%= dob %>" placeholder="Date of Birth" required>
            <input type="text" name="contactAddress" value="<%= contactAddress %>" placeholder="Contact Address" required>
            <input type="file" name="photo">
            <input type="text" name="companyName" value="<%= companyName %>" placeholder="Company Name/Organization" required>
            <input type="text" name="jobTitle" value="<%= jobTitle %>" placeholder="Job Title/Department" required>
            <input type="number" name="mobileNumber" value="<%= mobileNumber %>" placeholder="Mobile Number" required>
            <input type="number" name="whatsappNumber" value="<%= whatsappNumber %>" placeholder="WhatsApp Number">
            <button type="submit">Update Employee</button>
        </form>
    </div>
    <div class="footer">
        <p>&copy; <span id="year"></span> Jadhao Industries. All rights reserved.</p>
    </div>
    <script>
        function toggleMenu() {
            const navItems = document.querySelector('.navitems');
            navItems.style.display = navItems.style.display === 'flex' ? 'none' : 'flex';
        }
        document.getElementById("year").textContent = new Date().getFullYear();
    </script>
</body>
</html>
