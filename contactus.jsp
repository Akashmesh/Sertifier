<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
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
            background: url("loginbg.jpg") no-repeat center center fixed;
            background-size: cover;
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
            background-color: #000;
            margin: 4px;
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

        .footer {
            color: white;
            background-color: #373737;
            text-align: center;
            padding: 10px 20px;
            font-size: 14px;
            width: 100%;
            margin-top: -100px;
            flex-shrink: 0;
        }

        .container {
            margin: 140px auto;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .container p {
            font-weight: 700;
            margin-bottom: 10px;
            font-size: 18px;
        }

        .card {
            height: 200px;
            width: 600px;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 20px;
            margin: 10px 0;
            padding: 20px 20px;
        }

        .card a {
            display: block;
            text-decoration: none;
            color: black;
            margin: 10px 0;
            font-weight: 500;
        }

        .card a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .logo img {
                width: 40%;
            }

            .navitems {
                display: none;
                flex-direction: column;
                width: 100%;
                background-color: rgba(255, 255, 255, 0.6);
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

            .container {
                margin: 100px 20px;
            }

            .card {
                width: 100%;
                margin: 10px auto;
            }
            iframe {
                width: 100%;
                height: 300px;
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
            <div class="login">
                <a href="#">Login</a>
                <div class="loginmenu">
                    <a href="adminLogin.jsp">Admin Login</a>
                    <a href="managerLogin.jsp">Manager Login</a>
                </div>
            </div>
            <a href="#">Contact Us</a>
        </div>
        <div class="hamburger" onclick="toggleMenu()">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <div class="container">
        <p>Visit us at:</p>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d8264.363081462014!2d77.7456191595768!3d20.879300479444424!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bd6a52774ed27b3%3A0x21b3964a500b9d91!2sJADHAO%20GROUP%20OF%20COMPANIES!5e0!3m2!1sen!2sin!4v1718007299956!5m2!1sen!2sin" width="1200" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        <div class="card">
            <h2>JADHAV GROUP OF COMPANIES</h2>
            <a href="https://maps.app.goo.gl/95HSCUqaDDoMH9fA8">D 9/2,10,11, B-19, MIDC AREA, AMRAVATI-444 605 INDIA.</a>
            Contact:1234567890
        </div>
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
