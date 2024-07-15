<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/seminar";
    String username = "root";
    String password = "";
    String company = "";
    String title = "";
    String seminar = "";
    String fullName = "";
    String contact = "";
    String registrationNumber = "";
    String photoPath = null;
    String contactNumber = "8308535649";
    String companyAddress = "D 9/2,10,11, B-19, MIDC AREA, AMRAVATI-444 605 INDIA.";

    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url, username, password);

        // Prepare and execute SQL query to fetch employee details
        String query = "SELECT * FROM employee WHERE empregno = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, request.getParameter("empId"));
        ResultSet resultSet = statement.executeQuery();

        // Check if employee record exists
        if (resultSet.next()) {
            fullName = resultSet.getString("fname")+" "+resultSet.getString("lname");
            contact = resultSet.getString("mobileNumber");
            registrationNumber = resultSet.getString("empregno");
            photoPath = resultSet.getString("photoPath");

            System.out.println("Photo path " + photoPath);
            company = resultSet.getString("companyName");
            seminar = resultSet.getString("workshopSeminar");
            title = resultSet.getString("title");
            // Close database connection
            resultSet.close();
            statement.close();
            connection.close();
        } else {
            // No employee found with the given ID
            // Handle this case accordingly
        }

%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ID Card - Jadhao Industries</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
     .id-card {
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin: 20px auto;
                max-width: 300px;
                text-align: center;
                position: relative;
                color:black;
            }
            .id-card .photo {
                width: 100px;
                height: 90px;
                border-radius: 50%;
                margin-top: 20px;
            }
            .id-card h6 {
                margin-top: 10px;
                font-size: 22px;
                color: #333;
            }
            .id-card p {
                margin: 5px 0;
                color: #666;
            }
            .id-card hr {
                margin: 10px 0;
                border: none;
                border-top: 1px solid #ddd;
            }
            .id-card .footer p{
                color:white;
                font-weight: bolder;
            }
            .id-card .footer {
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                margin-top: 30px;
                font-size: 10px;
                width: inherit;
                color: white;
                background-color: black;
            }
            .print-btn {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 20px;
                width: 100%;
            }
            .print-btn:hover {
                background-color: #45a049;
            }

            h6 {
                position: relative;
                padding: 0;
                margin: 0;
                font-family: "Raleway", sans-serif;
                font-weight: 300;
                font-size: 10px;
                color: #080808;
                -webkit-transition: all 0.4s ease 0s;
                -o-transition: all 0.4s ease 0s;
                transition: all 0.4s ease 0s;
            }

            h6 span {
                display: block;
                font-size: 0.1em;
                line-height: 1.3;
            }
            h6 em {
                font-style: normal;
                font-weight: 600;
            }
            .company-name h6 {
                font-size:20px;text-align:center; line-height:1.5em; padding-bottom:45px; font-family:"Playfair Display", serif; text-transform:uppercase;letter-spacing: 2px; color:#111;
            }


            .company-name h6:before {
                position: absolute;
                left: 0;
                bottom: 20px;
                width: 60%;
                left:50%; margin-left:-30%;
                height: 1px;
                content: "";
                background-color: #777; z-index: 4;
            }
            .company-name h6:after {
                position:absolute;
                width:40px; height:40px; left:50%; margin-left:-20px; bottom:0px;
                content: '\00a7'; font-size:30px; line-height:40px; color:#c50000;
                font-weight:400; z-index: 5;
                display:block;
                background-color:#f8f8f8;
            }
            .info-table {
                width: 100%;
                text-align: left;
            }
            .info-table td {
                padding: 5px 0;
            }
            .info-table td:first-child {
                width: 30px;
                text-align: center;
            }
            .qr-code {
                margin: 10px auto;
            }
        
            @media only screen and (max-width: 768px) {
           
                .header, .footer {
                    padding: 8px 15px;
                }
                .card {
                    width: 90%;
                    margin-top: 60px;
                }
            }

            @media only screen and (max-width: 480px) {
                .navbar-left {
                    margin-left: 0;
                    justify-content: center;
                }
                .navbar h1 {
                    font-size: 18px;
                }
                .navbar-right {
                    margin-right: 0;
                    justify-content: center;
                }
                .navbar-right a {
                    margin-left: 10px;
                }
                .card {
                    width: 90%;
                    margin-top: 40px;
                    padding: 20px;
                }
            }
            .hamburger-menu {
                display: none;
                cursor: pointer; /* Add cursor pointer for better UX */
            }
            .navbar-right.mobile {
                display: none;
            }
            .navbar-left img {
                height: 40px; /* Adjust logo height for better visibility */
            }
          
                .card {
                    border-radius: 15px;
                    width: 100%;
                    max-width: 400px;
                    text-align: center;
                    margin: 80px auto;
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
            </style>
          
        </head>
        <body>
        <div class="navbar">
        <div class="logo">
            <img src="logo.png" alt="Logo">
        </div>
       
        <div class="navitems" id="navitems">
            <a href="index.jsp">Home</a>
            <a href="generateCertificate.jsp">Dashboard</a>
            <a href="adminLogin.jsp">Log Out</a>
        </div>
    </div>

            <div class="card">
                <div class="id-card">
                    <div class="company-name">
                        <img src="logo.jpeg" height="50" width="50" /><h6>Jadhao Industries</h6></div>

                    <% if (photoPath != null) {%>
                    <img src="<%=photoPath%>" alt="Employee Photo" class="photo">
                    <%} else {%>
                    <i class="fas fa-user-circle photo" style="font-size: 80px; color: #ccc;"></i>
                    <%}%>
                    <h4><%= fullName%></h4>
                    <div style="display:flex; flex-direction:row; justify-content: space-around; align-items: center; margin-bottom: 10%; ">

                        <table class="info-table">
                            <tr>
                                <td><i class="fas fa-phone"></i></td>
                                <td>Mobile: <%= contact%></td>
                            </tr>
                            <tr>
                                <td><i class="fas fa-id-badge"></i></td>
                                <td>Reg No. <%= registrationNumber%></td>
                            </tr>
                        </table>
                        <div id="qrcode" class="qr-code"></div>
                    </div>
                    <div class="footer">
                        <p>Address: <%= companyAddress%></p>
                    </div>
                </div>
                <button class="print-btn" onclick="window.print()">Print ID Card</button>
            </div>
            <script type="text/javascript" src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>
            <script type="text/javascript">
                // Generate QR code with employee details
                const qrData = "Name: <%= fullName%>\nReg No: <%= registrationNumber%>\nCompany: <%= company%>\nSeminar/Workshop: <%= seminar%>\nTitle: <%= title%>";
                new QRCode(document.getElementById("qrcode"), {
                    text: qrData,
                    width: 100,
                    height: 100
                });

                function toggleMobileMenu() {
                    var mobileMenu = document.querySelector('.navbar-right.mobile');
                    mobileMenu.style.display = (mobileMenu.style.display === 'none' || mobileMenu.style.display === '') ? 'flex' : 'none';
                }
            </script>
        </body>
    </html>
    <% } catch (Exception e) {
            e.printStackTrace();
        }%>