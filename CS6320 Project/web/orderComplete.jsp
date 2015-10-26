<%-- 
    Document   : orderComplete
    Created on : May 29, 2015, 6:58:11 PM
    Author     : gagandeep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Order complete</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script>
            function clearCart(){
                window.sessionStorage.clear();
            }
        </script>
    </head>
    <body background="shipping-box.png" onload="clearCart()">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">COMPUTER CENTRAL</a>
                </div>
                <div>
                    <ul class="nav navbar-nav">
                        <li><a href="beginPage.jsp">Home</a></li>
                        <li><a href="#">SHOP</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="signUpPage.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                        <li><a href="loginPage.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="page-header">
                <h1 style="background-color: gold;margin-top: 1%">We have received your order, it will be shipping soon.</h1>      
            </div>  
        </div>
        <h2 style="margin-left: 32%; color:blue">Here is your order #: ${sessionScope.random}</h2>
        <h2 style="margin-left: 32%; color:blue">Log into make another order!</h2>
    </body>
</html>
