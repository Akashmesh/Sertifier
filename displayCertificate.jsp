<%@page import="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
    <title>Certificate</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Baloo+2:wght@400..800&family=Offside&family=Protest+Riot&display=swap');
        body {
            margin: 0;
            padding: 0;
        }

        .certificate {
            width: 297mm; /* A4 width in landscape */
            height: 210mm; /* A4 height in landscape */
            padding: 20px;
            box-sizing: border-box;
            position: relative;
            background: url("certificate.png") no-repeat center center;
            background-size: cover;
            margin: 0 auto;
        }

        .content {
            position: absolute;
            text-align: center;
            color: #000;
            width: 100%;
        }

        .name {
            font-family: "Protest Riot", sans-serif;
            letter-spacing: 4px;
            color: #070e2e;
            font-size: 31px;
            font-weight: 600;
            position: absolute;
            top: 99mm;   
            left: 50%;
            transform: translate(-50%, 0);
            text-align: center;
            width: 80%; /* Adjust as needed */
        }

        .logos {
            position: absolute;
            top: 165mm; 
            left: -10mm;
            width: 100%;
        }

        .logos img {
            border-radius: 50%;
            height: 100px;
            max-width: 100px;
        }

        .passage {
            position: absolute;
            font-size: 20px;
            top: 108mm;
            left: 50%;
            transform: translate(-50%, 0);
            font-family: "Offside", sans-serif;
            width: 60%;
            word-spacing: 2px;
            letter-spacing: 2px;
            text-align: justify;
        }

        .idate {
            position: absolute;
            font-family: "Offside", sans-serif;
            font-size: 20px;
            font-weight: 600;
            top: 135mm; 
            left: 89mm;
            transform: translate(-50%, 0);
            width: 100%;
        }
        .sign {
            margin-top: 157mm;
            margin-left: 120mm;
            font-family: "Baloo 2", sans-serif;
        }

        .print-button {
            background-color: #7469B6;
            border: none;
            color: white;
            padding: 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 20px 600px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border-radius: 5px;
            width: 20%;
        }
        .print-button:hover {
            background-color: #ff5722;
        }
        .border {
            margin: 35px 140px;
            padding: 70px;
            border: 2px solid black;
        }
        .text {
            margin: 10px 725px;
            width: 100%;
            text-decoration: underline;
            font-weight: 600;
        }
    </style>
    <script>
        function printCertificate() {
            var printContents = document.querySelector('.certificate').outerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
    </script>
</head>
<body>
    <div class="text">Certificate Page</div>
    <div class="border">
        <div class="certificate">
            <div class="content">
                <div class="name"><%= request.getAttribute("namePrefix") %> <%= request.getAttribute("employeeName") %> <%= request.getAttribute("fathersName") %> <%= request.getAttribute("employeeSurname") %></div>
                <div class="passage">
                    <p>for attending Seminar/Workshop on <b><%= request.getAttribute("workshopSeminar") %></b> on <b><%= request.getAttribute("title") %></b>
                        on dated<b>:<%= request.getAttribute("seminarDate") %></b> and Performed<b>  <%= request.getAttribute("remarks") %>.</b>
                    </p>
                </div>
                <div class="idate">Issue Date:<%= request.getAttribute("dateOfIssue") %></div>
                <div class="logos">
                    <%
                        for (int i = 0; i < 4; i++) {
                            byte[] fileContent = (byte[]) request.getAttribute("logo" + i);
                            if (fileContent != null) {
                                String base64Image = Base64.getEncoder().encodeToString(fileContent);
                    %>
                                <img src="data:image/png;base64,<%= base64Image %>" alt="Logo <%= i + 1 %>"/>
                    <%
                            }
                        }
                    %>
                </div>
                <div class="sign">Authority: Jadhav Group Of Industries</div>
            </div>
        </div>
    </div>

    <button class="print-button" onclick="printCertificate()">Print Certificate</button>
</body>
</html>
