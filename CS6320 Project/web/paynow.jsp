<%-- 
    Document   : paynow
    Created on : May 28, 2015, 7:25:12 PM
    Author     : gagandeep
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Pay</title>
        <script type="text/javascript">
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

            function validateFunction() {
                var cardHolder = document.getElementById("cardHolder").value;
                var creditCard = document.getElementById("creditCard").value;
                var cvn = document.getElementById("cvn").value;
                var expiration = document.getElementById("datepicker").value;

                if (!cardHolder || !isNaN(cardHolder)) {
                    alert("Please fill in all fields and make sure input is of the correct!");
                    return false;
                }
                if (!creditCard || isNaN(creditCard) || creditCard.length < 16 || creditCard.length > 16) {
                    alert("Please fill in all fields and make sure input is of the correct type as well as the length of the card # is 16 digits!");
                    return false;
                }
                if (!cvn || isNaN(cvn) || cvn.length > 3 || cvn.length < 3) {
                    alert("Please fill in all fields and make sure input is of the correct type as well as the length of CVN is 3 digits! (non hyphens or slashes allowed)");
                    return false;
                }
                if (!expiration) {
                    alert("Please choose a date");
                    return false;
                }
                return true;
            }
        </script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
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
                        <li class="active" ><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span><label id="shoppingCart"></label></a></li>
                        <li><a href="logoutUser" onclick="return logout()"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">EDIT <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="updateProfile.jsp">Update Profile</a></li>
                                <li><a href="deleteProfile.jsp">Delete Profile</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <form action="makeOrder" method="POST" onsubmit="return validateFunction()">
            <div class="container">
                <div class="page-header">
                    <h1 style="background-color: gold;margin-top: 3%">We will ship to the address that used to create the account</h1>      
                </div>  
            </div>
            <div class="container">          
                <div class="form-group col-lg-8">
                    <label>Full Name of Card Holder</label>
                    <input type="text" class="form-control" name="cardHolder" id="cardHolder" style="background: beige;" >
                </div>
                <div class="form-group col-lg-8">
                    <label>Credit Card # (NO DASHES)</label>
                    <input type="text" class="form-control" name="creditCard" id="creditCard" style="background: beige;" >
                </div>
                <div class="form-group col-lg-8">
                    <label>Credit Card CVN #</label>
                    <input type="text" class="form-control" name="cvn" id="cvn" style="background: beige;" >
                </div>
                <div class="form-group col-lg-8">
                    <label>Card Expiration Date (NO HYPHENS OR SLASHES)</label>
                    <input type="text" class="form-control" name="expiration" id="datepicker" style="background: beige;" >
                </div>
            </div>
            <input style="margin-left: 6.6%" type="submit" value="Make Payment">
        </form>
    </body>
</html>
