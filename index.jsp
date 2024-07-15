<!DOCTYPE html>
<html>
<head>
    <title>Jadhav Group</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
        }

        .main {
            width: 100%;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
        }

        .logo img {
            width: 20%;
        }

        .navitems {
            display: flex;
            align-items: center;
            margin-top: 30px;
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

        .login:hover .loginmenu {
            display: block;
        }

        .loginmenu a {
            display: block;
            padding: 5px 0;
        }

        .title {
            height: 500px;
            text-align: center;
            background-image: url("industry.jpg");
            background-size: cover;
            overflow: hidden;
            box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px;
        }

        .title h1 {
            font-size: 3em;
            margin-bottom: 10px;
            color: white;
            position: relative;
        }

        .title h2, .title h3 {
            font-size: 1.5em;
            margin-bottom: 5px;
        }

        .about {
            padding: 50px 50px;
            display: flex;
            flex-direction: column;
            background-color: #fcfbfa;
        }

        .about h2 {
            color: #404040;
            font-size: 2em;
            text-decoration: double underline;
            text-align: center;
        }

        .aboutuscontent {
            font-size: 1.2em;
            line-height: 2.0;
            color: #595959;
            letter-spacing: 2px;
            word-spacing: 5px;
            margin-right: -50px;
            text-align: justify;
        }

        .aboutusimg img {
            width: 80%;
            margin-left: 100px;
            box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
        }

        .rowwise {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .aboutuscontent, .aboutusimg {
            flex: 1;
            padding: 10px;
            box-sizing: border-box;
            margin-top: 20px;
        }

        footer {
            text-align: center;
            padding: 20px;
            background: #333;
            color: white;
        }

        .title {
            font: 500 2em "Neuton";
            background: url("industry.jpg");
            color: rgb(255, 255, 255);
            background-size: cover;
            text-align: center;
            margin: 0;
            padding: 1em;
        }

        .bgdark {
            background-color: rgba(0, 0, 0, 0.6);
        }

        p {
            text-transform: uppercase;
            letter-spacing: .5em;
            display: inline-block;
            border: 2px double rgb(255, 255, 255);
            border-width: 4px 0;
            padding: 1.5em 1em;
            position: relative;
            width: 90%;
            max-width: 40em;
            margin: 50px auto;
        }

        span {
            font: 700 2em/1 "Oswald", sans-serif;
            letter-spacing: 0;
            padding: .25em 0 .325em;
            display: block;
            margin: 0 auto;
            text-shadow: 0 0 80px rgba(255, 255, 255, .5);
        }

        /* Animate Background Image */
        @-webkit-keyframes aitf {
            0% {
                background-position: 0% 50%;
            }

            100% {
                background-position: 100% 50%;
            }
        }

        /* Mobile View */
        .hamburger {
            display: none;
            flex-direction: column;
            cursor: pointer;
        }

        .hamburger div {
            width: 25px;
            height: 2px;
            background-color: black;
            margin: 4px;
        }

        @media (max-width: 768px) {
            .navitems {
                display: none;
                flex-direction: column;
                position: absolute;
                top: 70px;
                right: 0;
                width: 80%;
                align-items: flex-start;
                padding: 10px;
                background: rgb(255, 255, 255);
                z-index: 3;
            }

            .navitems a {
                width: 100%;
                padding: 10px 20px;
                text-align: left;
            }

            .hamburger {
                display: flex;
                position: absolute;
                right: 10px;
            }
             .rowwise {
                    display: flex;
                    flex-direction: column;
                }
                 .aboutuscontent {
    min-height: auto;
    margin-left: -40px;
                }
  .aboutusimg {
    margin-left: -100px;
  }
    p {
                    top: -50px;
                    letter-spacing: .2em;
                    padding: .5em;
                    border-width: 2px 0;
                }
                span {
                    font-size: 1.2em;
        }
    </style>
</head>
<body>
    <div class="main">
        <div class="navbar">
            <div class="logo">
                <img src="logo.png">
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
                <a href="#about">About Us</a>
                <a href="contactus.jsp">Contact Us</a>
            </div>
            <div class="hamburger" onclick="toggleMenu()">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
        <div class="title">
            <div class="bgdark">
                <p>
                    SINCE 1986 <span>JADHAV GROUP OF COMPANIES</span> &mdash; INNOVATING RIGHT SOLUTIONS &mdash;
                </p>
            </div>
        </div>

        <div class="about" id="about">
            <h2>About Us</h2>
            <div class="rowwise">
                <div class="aboutuscontent">
                    JADHAO GROUP is well known in India and overseas
                    We aim to be as efficient and productive as possible, maintaining the highest standards all the while
                    Our professionalism and experience allow us to deliver quality products,
                    On-time, and at a competitive price.
                    We provide innovative product solutions for sustainable progress. Our professional team works to increase productivity and cost effectiveness on the market.
                    We offer customers cost efficient high-tech solutions as well as products and services.
                    Our commitment to excellence drives us to continuously improve and adapt. By leveraging cutting-edge technology and industry expertise,
                    we create innovative solutions that address the evolving needs of our clients. Our collaborative approach ensures that we understand our
                    customers unique challenges and tailor our offerings accordingly.
                    At JADHAO GROUP, we believe in sustainable progress.
                </div>
                <div class="aboutusimg">
                    <img src="aboutus.jpg">
                </div>
            </div>
        </div>
        <footer>
            ©Jadhav Group Of Companies.
        </footer>
    </div>
    <script>
        function toggleMenu() {
            var navitems = document.querySelector('.navitems');
            navitems.style.display = navitems.style.display === 'flex' ? 'none' : 'flex';
        }
    </script>
</body>
</html>