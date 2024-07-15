<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Jadhao Industries</title>
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
            background-color: rgba(0, 0, 0, 0.1);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 400px;
            text-align: center;
            margin: 80px auto;
        }

        .card button {
            background-color: #373737;
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

        /* Media Queries for responsiveness */
        @media (max-width: 1024px) {
            .logo img {
                width: 30%;
            }

            .navitems {
                margin-top: 0;
            }

            .navitems a {
                padding: 10px 20px;
                font-size: 16px;
            }
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
            }

            .logo img {
                width: 40%;
            }

            .navitems {
                flex-direction: column;
                align-items: flex-start;
                margin-top: 10px;
            }

            .navitems a {
                padding: 10px 15px;
                font-size: 20px;
            }

            .card {
                margin: 60px auto;
                padding: 20px;
            }

            .card button {
                padding: 10px;
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .logo img {
                width: 35%;
            }

            .navitems a {
                padding: 10px;
                font-size: 20px;
            }

            .card {
                margin: 40px auto;
                padding: 15px;
            }

            .card button {
                padding: 8px;
                font-size: 12px;
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
            <a href="adminLogin.jsp">Log Out</a>
        </div>
        <div class="hamburger" onclick="toggleMenu()">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <div class="card">
        <h2>Admin Dashboard</h2>
        <button onclick="location.href='addManager.jsp'">Add Manager</button>
        <button onclick="location.href='managerviewdetails.jsp'">View Managers</button>
        <button onclick="location.href='generateCertificate.jsp'">Generate Certificate & QR Code</button>
    </div>
    <div class="footer">
        <p>&copy; <span id="year"></span> Jadhao Industries. All rights reserved.</p>
    </div>
    <script>
        document.getElementById("year").textContent = new Date().getFullYear();
    </script>
</body>
</html>