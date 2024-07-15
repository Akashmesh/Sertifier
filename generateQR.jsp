<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate QR Code</title>
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

        .footer {
            background-color: #373737;
            padding: 10px 20px;
            font-size: 14px;
            width: 100%;
            position: fixed;
            bottom: 0;
            text-align: center;
        }

        .card {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            width: 300px;
            text-align: center;
            margin: 100px auto;
        }

        #qrcode {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
/*            background-color: #7d057e;*/
            padding: 5px;
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

            .navbar {
                position: relative;
            }
        }
    </style>
    <!-- Include ZXing JavaScript library -->
    <script type="text/javascript" src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>
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
        <div class="hamburger" onclick="toggleMenu()">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <div class="card">
        <h2>QR Code</h2>
        <div id="qrcode"></div>
    </div>

    <div class="footer">
        <p>&copy; <span id="year"></span> Jadhao Industries. All rights reserved.</p>
    </div>

    <script type="text/javascript">
        // Get empId from URL
        const urlParams = new URLSearchParams(window.location.search);
        const empId = urlParams.get('empId');

        // Fetch employee details from the server
        fetchEmployeeDetails(empId);

        function fetchEmployeeDetails(empId) {
            // Send AJAX request to fetch employee details
            // Replace 'fetchEmployeeDetailsURL' with the actual URL to fetch employee details
            const fetchEmployeeDetailsURL = "fetchEmployeeDetails.jsp?empId=" + empId;
            fetch(fetchEmployeeDetailsURL)
                .then(response => response.text())
                .then(data => {
                    // Generate QR code using employee details
                    generateQRCode(data);
                })
                .catch(error => console.error('Error:', error));
        }

        function generateQRCode(employeeDetails) {
            // Generate QR code
            new QRCode(document.getElementById("qrcode"), {
                text: employeeDetails, // Data to encode (employee details)
                width: 200,
                height: 200
            });
        }

        function toggleMenu() {
            var navItems = document.querySelector('.navitems');
            navItems.style.display = (navItems.style.display === 'flex') ? 'none' : 'flex';

            var hamburger = document.querySelector('.hamburger');
            hamburger.classList.toggle('active');
        }
    </script>

    <script>
        document.getElementById("year").textContent = new Date().getFullYear();
    </script>
</body>
</html>