<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Employees - Jadhao Industries</title>
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

        .content {
            margin-top: 0px;
            flex: 1;
        }
        
        .card {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 600px;
            text-align: center;
            margin: 80px auto;
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
        .inline {
            width: 100%;
            display: flex;
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
    <div class="content">
        <div class="card">
            <h2>Select User</h2>
            <form id="employeeForm" action="ProcessFormServlet" method="post" enctype="multipart/form-data">
                <select name="employeeId" id="employeeId" onchange="displayEmpReg()">
                    <option value="">Select User</option>
                    <%  
                        String query = "SELECT empregno, namePrefix, fname,fathersName ,lname FROM employee";
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/seminar", "root", "");
                            PreparedStatement stmt = conn.prepareStatement(query);
                            ResultSet rs = stmt.executeQuery();
                            while (rs.next()) {
                    %>
                                <option value="<%= rs.getString("empregno") %>">
                                    <%= rs.getString("namePrefix") %> <%= rs.getString("fname") %> 
                                    <%if(rs.getString("lname")==null){
                                        out.print("");
                                        }else{
                                        out.print(rs.getString("lname"));
                                    }%>
                                </option>
                    <% 
                            }
                            conn.close();
                        } catch(Exception e) {
                            out.print("Error " + e);
                        }
                    %>
                </select>

                <input type="text" id="empregnoDisplay" name="empregnoDisplay" placeholder="Employee Registration Number" readonly>
                <div style="display:flex; flex-direction: row; justify-content: space-around; align-items: center;">
                    <input type="text" id="remarks" name="remarks" placeholder="Alloted Remarks"/>
                </div>
                <div style="display:flex; flex-direction: row; justify-content: space-around; align-items: center;"> 
                    <label for="dateOfIssue">Date Of Issue: </label>
                    <input style="width:50%" type="date" id="dateOfIssue" name="dateOfIssue" placeholder="Date of issue"/> 
                </div>
                <div class="inline">
                    <label for="logos">Add Logos (Max 4): </label>
                    <input type="file" id="logos" name="logos" accept="image/*" multiple>
                </div>
                <br><br>
                <button type="submit">Generate Certificate</button>
            </form>

            <script>
                function displayEmpReg() {
                    var e = document.getElementById("employeeId");
                    var empregno = e.options[e.selectedIndex].value;
                    document.getElementById("empregnoDisplay").value = empregno;
                }
            </script>

            <button type="button" onclick="generateQR()">Generate QR Code</button>
            <button type="button" onclick="generateIDCard()">Generate ID Card</button>
        </div>
    </div>
    <div class="footer">
        <p>&copy; <span id="year"></span> Jadhao Industries. All rights reserved.</p>
    </div>
    <script>
        document.getElementById("year").textContent = new Date().getFullYear();

        function getSelectedEmployeeId() {
            var employeeIdSelect = document.getElementById("employeeId");
            return employeeIdSelect.value;
        }

        function generateCertificate() {
            var empId = getSelectedEmployeeId();
            if (empId) {
                document.getElementById("employeeForm").submit();
            } else {
                alert("Please select a user.");
            }
        }

        function generateQR() {
            var empId = getSelectedEmployeeId();
            if (empId) {
                window.location.href = "generateQR.jsp?empId=" + empId;
            } else {
                alert("Please select a user.");
            }
        }

        function displayEmpRegNo() {
            var employeeIdSelect = document.getElementById("employeeId");
            var selectedEmpRegNo = employeeIdSelect.value;
            var empregnoDisplay = document.getElementById("empregnoDisplay");
            empregnoDisplay.value = selectedEmpRegNo; // Set value of input field
        }

        function generateIDCard() {
            var empId = getSelectedEmployeeId();
            if (empId) {
                window.location.href = "generateIDCard.jsp?empId=" + empId;
            } else {
                alert("Please select a user.");
            }
        }

        function toggleMenu() {
            var navItems = document.querySelector('.navitems');
            navItems.style.display = (navItems.style.display === 'flex') ? 'none' : 'flex';

            var hamburger = document.querySelector('.hamburger');
            hamburger.classList.toggle('active');
        }
    </script>
</body>
</html>
