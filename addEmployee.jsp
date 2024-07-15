<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Employee - Jadhao Industries</title>
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
                max-width: 600px;
                text-align: center;
                margin: 50px auto;
            }
            .card input[type="text"],
            .card input[type="date"],
            .card input[type="file"],
            .card input[type="number"],
            .card select {
                width: 100%;
                padding: 12px;
                margin: 10px;
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
                position: relative;
            }
            .invalid-login {
                color: #ff5722;
                font-size: 14px;
                margin-top: 10px;
            }
            .space {
                margin-right: 8px !important;
                padding:4px;
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

        </div>


        <div class="card">
            <h2>Employee Registration</h2>
            <form id="registerEmployeeForm" action="employeeRegistration" method="post" enctype="multipart/form-data">
                <div style="display: flex; flex-direction: row; align-items: center; width: 100%; justify-content: space-around;">
                    <select name="namePrefix" required style="width: 25%;">
                        <option value="" disabled selected>Prefix</option>
                        <option value="Mr.">Mr.</option>
                        <option value="Mrs.">Mrs.</option>
                        <option value="Miss.">Miss.</option>
                        <option value="Ms.">Ms.</option>
                    </select>
                    <input class="space" type="text" name="fname" placeholder="Name" required>
                    <input type="text" class="" name="lname" placeholder="Surname" required>


                </div>
                <div style="display: flex; flex-direction: row; align-items: center; width: 100%;">
                </div>
                <input type="text" name="fathersName" placeholder="Father's/Husband's Name" required>
                <div style="display: flex; flex-direction: row; align-items: center; width: 100%; justify-content: space-around">
                    <label for="dob" style="padding: 5px; width: 100%">Date of Birth</label>
                    <input type="date" name="dob" placeholder="Date of Birth" required>
                </div>
                <input type="text" name="contactAddress" placeholder="Contact Address" required>
                <div style="display: flex; flex-direction: row; align-items: center; width: 100%; justify-content: space-around">
                    <label for="time" style="padding: 5px; width: 100%">Upload Photo</label>
                    <input type="file" name="photo" >
                </div>
                <input type="text" name="companyName" placeholder="Company Name/Organization" required>
                <input type="text" name="jobTitle" placeholder="Job Title/Department" required>
                <div style="display: flex; flex-direction: row; align-items: center; width: 100%; justify-content: space-around">
                    <label for="dateOfJoining" style="padding: 5px; width: 100%">Date of Joining</label>
                    <input type="date" name="dateOfJoining" id="dateOfJoining" placeholder="Date of Joining" required>
                </div>
                <input type="number" name="mobileNumber" placeholder="Mobile Number" required>
                <input type="number" name="whatsappNumber" placeholder="WhatsApp Number">
                <div style="display:flex; flex-direction: row;">

                    <select name="workshopSeminar" id="workshopSeminar" required>
                        <option value="" disabled selected>Workshop/Seminar</option>
                    </select>
                    <button type="button" onclick="addNewSeminar()" style="width:70%; margin: 10px;">Add New Seminar</button>
                </div>
                <div style="display:flex; flex-direction: row;">

                    <select name="title" id="title" required>
                        <option value="" disabled selected>Title</option>
                    </select>
                    <button type="button" onclick="addNewTitle()" style="width:70%; margin: 10px;">Add New Title</button>
                </div>
                <div style="display: flex; flex-direction: row; align-items: center;">
                    <label for="date" style="width:100%; padding: 5px;">Date of Seminar/Workshop</label>
                    <input type="date" name="date" placeholder="Date" id="date" required>
                </div>
                <div style="display: flex; flex-direction: row; align-items: center; width: 100%; justify-content: space-around">
                    <label for="time" style="padding: 5px;">Time of Seminar/Workshop</label>
                    <input type="time" name="time" placeholder="Time" id="time" required>
                </div>
                <div style="display: flex; flex-direction: row; align-items: center; width: 100%; justify-content: space-around">
                    <label for="fees" style="padding: 5px;">Fees: </label>
                    <input type="number" name="fees" placeholder="fees" id="fees" required>
                </div>
                <button type="submit">Add Employee</button>
            </form>
        </div>


        <div class="footer">
            <p>&copy; <span id="year"></span> Jadhao Industries. All rights reserved.</p>
        </div>
        <script>
            document.getElementById("year").textContent = new Date().getFullYear();
            window.onload = function () {
                fetchData();
            };

            function fetchData() {
                fetch('fetchData')
                        .then(response => response.json())
                        .then(data => {
                            const seminars = data[0];
                            const titles = data[1];

                            const seminarSelect = document.getElementById('workshopSeminar');
                            const titleSelect = document.getElementById('title');

                            seminars.forEach(seminar => {
                                const option = document.createElement('option');
                                option.value = seminar;
                                option.textContent = seminar;
                                seminarSelect.appendChild(option);
                            });

                            titles.forEach(title => {
                                const option = document.createElement('option');
                                option.value = title;
                                option.textContent = title;
                                titleSelect.appendChild(option);
                            });
                        });
            }

            function addNewSeminar() {
                const name = prompt(`Enter new seminar`);
                if (name) {
                    const seminarSelect = document.getElementById('workshopSeminar');
                    const option = document.createElement('option');
                    option.value = name;
                    option.textContent = name;
                    seminarSelect.appendChild(option);
                }
            }

            function addNewTitle() {
                const name = prompt(`Enter new title`);
                if (name) {
                    const titleSelect = document.getElementById('title');
                    const option = document.createElement('option');
                    option.value = name;
                    option.textContent = name;
                    titleSelect.appendChild(option);
                }
            }

        </script>
    </body>
</html>
