<%-- 
    Document   : loginPage
    Created on : May 17, 2015, 4:21:42 PM
    Author     : gagandeep
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style media="screen" type="text/css">

            input{

                margin-left: 460px;
                margin-top: 55px;
                width: 350px;
                border-radius: 10px;
                border:solid 1px black;
                padding:5px;

            }
        </style>

    </head>
    <body style="background-color: #6699FF">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                    </button>
                    <a class="navbar-brand" href="#">COMPUTER CENTRAL</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="beginPage.jsp">Home</a></li>
                        <li><a href="#">SHOP</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="signUpPage.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                        <li class="active"><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <label style="font-family: Courier new;font-size: 30px; margin-left: 45%; margin-top: 5%">Welcome</label>
        <form action="loginValidation" method="POST">
            <label><input type="text" name="username" placeholder="username"></label>
            <label><input type="password" name="pword" placeholder="password"></label>
            <input type="submit" value="Login"></input>
        </form>
    <center><label style="color:red">${invalid}</label></center>
    </body>
</html>
