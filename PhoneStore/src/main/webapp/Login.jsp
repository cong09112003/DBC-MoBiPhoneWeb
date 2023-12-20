<%-- 
    Document   : Login
    Created on : Dec 2, 2023, 6:19:16 PM
    Author     : Tris Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        session.setAttribute("user", null);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css'>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css'>
        <link rel="stylesheet" href="styles/Login.css"/>
        <title>Login</title>
    </head>
    <body>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="Register" method="post">
                    <h1>Create Account</h1>
                    <span style="color: red;">${message}.</span>
                    <input id="Name" name="name" type="text" placeholder="Name"/>
                    <input id="email" name="email" type="email" placeholder="Email" />
                    <input id="Address" name="address" type="text" placeholder="Address" />
                    <input id="phonenumber" name="phonenumber" type="text" placeholder="PhoneNumber" />
                    <input id="username" name="username" type="text" placeholder="UserName" />
                    <input id="Password" name ="password" type="password" placeholder ="Password" />
                    <input id="ConfirmPassword" name="confirmpassword" type="password" placeholder ="ConfirmPassword" />

                    <button name="sign_up">Sign Up</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <a class="navbar-brand navbar-logo" href="CustomerServlet">
                    <span style="font-size: 20px"><i class="fa-solid fa-shop"></i>MOBILE STORE</span>
                </a>
                <form action="Login" method="post">
                    <h1>Sign in</h1>
                    <span>or use your account</span>
                    <span style="color: red;">${message}.</span>
                    <input type="text" name="txtUserName" placeholder="UserID" value="${username_save}" />
                    <input type="password" name="txtPassword" placeholder="Password" value="${password_save}" />
                    <button name="sign_in">Sign In</button>
                </form>
            </div>

            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <a class="navbar-brand navbar-logo" href="CustomerServlet">
                            <span style="font-size: 20px"><i class="fa-solid fa-shop"></i>MOBILE STORE</span>
                        </a>
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/login.js"></script>
        <style>
            /* CSS cho phần navbar-logo */
            .navbar-brand.navbar-logo {
                position: absolute;
                left: 50%;
                top: 20px; /* Khoảng cách từ đỉnh màn hình */
                transform: translateX(-50%);
                display: inline-block;
                text-decoration: none;
                color: #333;
            }

            .navbar-brand.navbar-logo span {
                font-size: 20px;
                vertical-align: middle;
            }

            .navbar-brand.navbar-logo i {
                margin-right: 5px;
            }

            /* Hover style (nếu cần) */
            .navbar-brand.navbar-logo:hover {
                color: #ff6347;
            }


        </style>
    </body>
</html>
