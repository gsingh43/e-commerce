<%-- 
    Document   : deleteProfile
    Created on : May 19, 2015, 12:58:47 PM
    Author     : gagandeep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
        <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style type="text/css"> 
            #removeButton{
                width:80px;
                height:20px;
                background-color:#ed8223;
                color:#fff;
                font-family:'Helvetica Neue';
                font-size:16px;
                border-radius:20px;
            }                
        </style>
        <script>
            function cartFunction() {
                var numberOfItemsInCart = window.sessionStorage.getItem("numberOfItemsInCart");
                document.getElementById("shoppingCart").innerHTML = numberOfItemsInCart;


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
            function deleteAccount() {
                var logout = confirm("Are you sure you want to delete your account?");
                if (logout) {
                    window.sessionStorage.clear();
                    return true;
                }
                return false;
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
                <h1 style="background-color:#B0B0B0;margin-top: 3%">Click "Remove" to delete<label style="color:#FF6600">!</label></h1>      
            </div>  
        </div>
        <div class="container">
            <table class="table">
                <thead>
                    <tr>
                        <th><span class="glyphicon glyphicon-user"></span></th>
                        <th><span class="glyphicon glyphicon-envelope"></span></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${userInfo.userID}</td>
                        <td>${userInfo.emailAddress}</td>
                        <td id="removeButton"><a href="deleteFromDB" onclick="return deleteAccount()">Remove</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
