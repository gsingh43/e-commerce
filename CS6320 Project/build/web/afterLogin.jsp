<%-- 
    Document   : beginPage
    Created on : May 16, 2015, 5:03:02 PM
    Author     : gagandeep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Success</title>
        <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        </script>
    </head>
    <body background="hd_resolution.jpg" onload="cartFunction()">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">COMPUTER CENTRAL</a>
                </div>
                <div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="RAM.jsp">SHOP</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span>${userInfo.userID}</a></li>
                        <li><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span><label id="shoppingCart"></label></a></li>
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
        <script>
            $(document).ready(function () {
                var div = $("#welcome");
                div.delay(1400).animate({left: '525px', opacity: '0.8'}, "slow");
                div.animate({width: '255px', opacity: '0.8'}, "slow");
                div.animate({height: '-80px', opacity: '0.8'}, "slow");
            });
        </script> 
        <div style="background:#00FFFF;height:60px;width:100px;position:absolute;" id="welcome"><b>WELCOME TO COMPUTER CENTRAL</b></div>
    <center> 
        <p style="margin-top: 15%;font-size:120%;">Computer Central founded in 2015 is a online computer parts retailer. We are currently located in Hayward, California and
            we sell a wide array of computer products and offer <label style="color:red">FREE</label> express shipping.To place and order you can reach us Monday-Friday
            8:00 am to 6:00 pm PST by calling 1-800-267-9388 or you can sign up by creating an account.
        </p> 
    </center>
</body>
</html>
