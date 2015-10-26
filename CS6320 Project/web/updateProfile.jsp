<%-- 
    Document   : updateProfile
    Created on : May 19, 2015, 12:58:36 PM
    Author     : gagandeep
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
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
            function logout() {
                var logout = confirm("Are you sure you want to logout?");
                if (logout) {
                    window.sessionStorage.clear();
                    return true;
                }
                return false;
            }
        </script>
        <script>
            function cartFunction() {
                var numberOfItemsInCart = window.sessionStorage.getItem("numberOfItemsInCart");
                document.getElementById("shoppingCart").innerHTML = numberOfItemsInCart;


            }
        </script>
    </head>
    <body onload="cartFunction()">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">COMPUTER CENTRAL</a>
                </div>
                <div>
                    <ul class="nav navbar-nav">
                        <li><a href="afterLogin.jsp">Home</a></li>
                        <li><a href="RAM.jsp">SHOP</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span>${userInfo.userID}</a></li>
                        <li><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span><label id="shoppingCart"></label></a></li>
                        <li><a href="logoutUser" onclick="return logout()"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
                        <li class="active" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">EDIT <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="updateProfile.jsp">Update Profile</a></li>
                                <li><a href="deleteProfile.jsp">Delete Profile</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="page-header">
                <h1 style="background-color:#B0B0B0;margin-top: 3%">Update the fields you want!</h1>      
            </div>  
        </div>
        <div class="container">
            <c:if test="${errorUsername ne null}">
                <div class="alert alert-danger">
                    <strong>ERROR:</strong> ${errorUsername}
                </div>
            </c:if>
        </div>
        <div class="container">
            <c:if test="${errorEmail ne null}">
                <div class="alert alert-danger">
                    <strong>ERROR:</strong> ${errorEmail}
                </div>
            </c:if>
        </div>
        <form action="updateToDB" method="POST" onsubmit="return validateFunction()">
            <div class="container">          
                <div class="form-group col-lg-8">
                    <label>Create Username:</label>
                    <input type="text" class="form-control" name="username" value="${userInfo.userID}" id="username" style="background: beige;" >${errorUsername}
                </div>
                <div class="form-group col-lg-8">
                    <label>Create Password:</label>
                    <input type="password" class="form-control" name="password" value="${userInfo.pword}" id="password" style="background: beige;">
                </div>
                <div class="form-group col-lg-8">
                    <label>Full Name:</label>
                    <input type="text" class="form-control" name="fullName" value="${userInfo.fullName}" id="fullName" style="background: beige;">
                </div>
                <div class="form-group col-lg-8">
                    <label>Street Address:</label>
                    <input type="text" class="form-control" name="address" value="${userInfo.address}" id="address" style="background: beige;">
                </div>
                <div class="form-group col-lg-8">
                    <label>City:</label>
                    <input type="text" class="form-control" name="city" value="${userInfo.city}" id="city" style="background: beige;">
                </div>
                <div class="form-group col-lg-8">
                    <label>Zip Code:</label>
                    <input type="text" class="form-control" name="zipCode" value="${userInfo.zipCode}" id="zipCode" style="background: beige;">
                </div>
                <div class="form-group col-lg-8">
                    <label>Phone Number:</label>
                    <input type="text" class="form-control" name="phoneNumber" value="${userInfo.phoneNumber}" id="phoneNumber" style="background: beige;">
                </div>
                <div class="form-group col-lg-8">
                    <label>Email Address:</label>
                    <input type="email" class="form-control" name="emailAddress" value="${userInfo.emailAddress}" id="emailAddress" style="background: beige;">${errorEmail}
                </div>
            </div>
            <input type="submit" value="Update" style="margin-left: 85px">
        </form>
    </body>
</html>
