<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Details - Jadhao Industries</title>
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
        }
        .card img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-bottom: 20px;
            object-fit: cover;
        }
        .card h2 {
            margin: 10px 0;
        }
        .card p {
            margin: 5px 0;
            font-size: 16px;
        }
        table {
            width: 100%;
            margin: 0 auto;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #fff;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            text-align: center;
        }
        .footer {
            background-color: #373737;
            text-align: center;
            padding: 10px 20px;
            font-size: 14px;
            width: 100%;
            position: relative;
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
        <%
            String empregno = request.getParameter("empregno");
            if (empregno != null) {
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/seminar", "root", "");

                    String sql = "SELECT * FROM employee WHERE empregno = ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, empregno);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        String name = rs.getString("fname");
                        String surname = rs.getString("lname");
                        String fathersName = rs.getString("fathersName");
                        String dob = rs.getString("dob");
                        String contactAddress = rs.getString("contactAddress");
                        String photoPath = rs.getString("photoPath");
                        String companyName = rs.getString("companyName");
                        String jobTitle = rs.getString("jobTitle");
                        String dateOfJoining = rs.getString("dateOfJoining");
                        String mobileNumber = rs.getString("mobileNumber");
                        String whatsappNumber = rs.getString("whatsappNumber");
                        String workshopSeminar = rs.getString("workshopSeminar");
                        String title = rs.getString("title");
                        String date = rs.getString("date");
                        String time = rs.getString("time");
                        int fees = rs.getInt("fees");

                        if (photoPath == null || photoPath.isEmpty()) {
                            photoPath = "default.jpg"; // Path to default photo
                        }
                        %>
                        <img src="<%= photoPath %>" alt="Employee Photo">
                        <h2><%= name != null ? name : "" %> <%= surname != null ? surname : "" %></h2>
                        <table> 
                            <tr> 
                                <th>Father's Name</th>
                                <td><%= fathersName != null ? fathersName : "" %></td>
                            </tr>
                            <tr> 
                                <th>Date of Birth</th>
                                <td><%= dob != null ? dob : "" %></td>
                            </tr>
                            <tr> 
                                <th>Contact Address</th>
                                <td><%= contactAddress != null ? contactAddress : "" %></td> 
                            </tr>
                            <tr> 
                                <th>Company Name</th>
                                <td><%= companyName != null ? companyName : "" %></td> 
                            </tr>
                            <tr> 
                                <th>Job Title</th>
                                <td><%= jobTitle != null ? jobTitle : "" %></td> 
                            </tr>
                            <tr> 
                                <th>Date of Joining</th>
                                <td><%= dateOfJoining != null ? dateOfJoining : "" %></td> 
                            </tr>
                            <tr> 
                                <th>Mobile Number</th>
                                <td><%= mobileNumber != null ? mobileNumber : "" %></td> 
                            </tr>
                            <tr> 
                                <th>WhatsApp Number</th>
                                <td><%= whatsappNumber != null ? whatsappNumber : "" %></td> 
                            </tr>
                        </table>
                        <%
                    } else {
                        %>
                        <p>No employee found with the given registration number.</p>
                        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    %>
                    <p>Error: <%= e.getMessage() %></p>
                    <%
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            } else {
                %>
                <p>Employee registration number is missing.</p>
                <%
            }
        %>
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
