s<%-- 
    Document   : signUpPage
    Created on : May 16, 2015, 8:24:40 PM
    Author     : gagandeep
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script>
            function validateFunction() {
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                var fullName = document.getElementById("fullName").value;
                var address = document.getElementById("address").value;
                var city = document.getElementById("city").value;
                var zipCode = document.getElementById("zipCode").value;
                var phoneNumber = document.getElementById("phoneNumber").value;
                var emailAddress = document.getElementById("emailAddress").value;
                if (!username || !isNaN(username)) {
                    alert("Please fill in all fields and make sure input is of the correct!");
                    return false;
                }
                if (!password) {
                    alert("Please fill in all fields and make sure input is of the correct!");
                    return false;
                }
                if (!fullName || !isNaN(fullName)) {
                    alert("Please fill in all fields and make sure input is of the correct!");
                    return false;
                }
                if (!address || !isNaN(address)) {
                    alert("Please fill in all fields and make sure input is of the correct!");
                    return false;
                }
                if (!city || !isNaN(city)) {
                    alert("Please fill in all fields and make sure input is of the correct!");
                    return false;
                }
                if (!zipCode || isNaN(zipCode) || zipCode.length < 5 || zipCode.length > 5) {
                    alert("Please fill in all fields and make sure input is of the correct type as well as the length of the zip code is 5 digits!");
                    return false;
                }
                if (!phoneNumber || isNaN(phoneNumber) || phoneNumber.length > 10 || phoneNumber.length < 10) {
                    alert("Please fill in all fields and make sure input is of the correct type as well as the length of the phone number is 10 digits! (non dashes allowed)");
                    return false;
                }
                if (!emailAddress || !isNaN(emailAddress)) {
                    alert("Please fill in all fields and make sure input is of the correct!");
                    return false;
                }
                
                return true;
            }
        </script>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="#">Computer Central</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="beginPage.jsp">Home</a></li>
                        <li><a href="#">SHOP</a></li>       
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="signUpPage.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                        <li><a href="loginPage.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="page-header">
                <h1 style="background-color: lightcoral;margin-top: 8%">Sign Up To Make Orders<label style="color:green">!</label></h1>      
            </div>  
        </div>
        <div class="container">
            <c:if test="${error1 ne null}">
                <div class="alert alert-danger">
                    <strong>ERROR:</strong> ${error1}
                </div>
            </c:if>
            <c:if test="${error2 ne null}">
                <div class="alert alert-danger">
                    <strong>ERROR:</strong> ${error2}
                </div>
            </c:if>
        </div>
        <form action="testingJDBC" method="POST" onsubmit="return validateFunction()">
            <div class="container">          
                <div class="form-group col-lg-8">
                    <label>Create Username:</label>
                    <input type="text" class="form-control" name="username" id="username" style="background: beige;" >
                </div>
                <div class="form-group col-lg-8">
                    <label>Create Password:</label>
                    <input type="password" class="form-control" name="password" id="password" style="background: beige;">
                </div>
                <div class="form-group col-lg-8">
                    <label>Full Name:</label>
                    <input type="text" class="form-control" name="fullName" id="fullName" style="background: beige;">
                </div>
                <div class="form-group col-lg-8">
                    <label>Street Address:</label>
                    <input type="text" class="form-control" name="address" id="address" style="background: beige;">
                </div>
                <div class="form-group col-lg-8">
                    <label>City:</label>
                    <input type="text" class="form-control" name="city" id="city" style="background: beige;">
                </div>
                <div class="form-group col-lg-8">
                    <label>Zip Code:</label>
                    <input type="text" class="form-control" name="zipCode" id="zipCode" style="background: beige;">
                </div>
                <div class="form-group col-lg-8">
                    <label>Phone Number:</label>
                    <input type="text" class="form-control" name="phoneNumber" id="phoneNumber" style="background: beige;">
                </div>
                <div class="form-group col-lg-8">
                    <label>Email Address:</label>
                    <input type="email" class="form-control" name="emailAddress" id="emailAddress" style="background: beige;">
                </div>
            </div>
            <input type="submit" value="Sign up" style="margin-left: 85px">
        </form>
    </body>
</html>
