<%-- 
    Document   : cart
    Created on : May 26, 2015, 1:02:33 AM
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

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cart</title>
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
        <div class="container">
            <table class="table">
                <thead>
                    <tr>
                        <th>Item </th>
                        <th>Quantity</th>
                        <th><label style="color:green"><span class="glyphicon glyphicon-usd"></span></label></th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="i" scope="page" value="0"/>
                    <c:forEach var="products" items="${userCart.productsArray}">
                        <c:if test="${products > 0 && i == 0 }">
                            <tr>
                                <td>2GB Kit (1GBx2) DDR3 PC3-12800 Unbuffered NON-ECC 1.35V 1024Meg x 64</td>
                                <td><c:out value="${products}"/></td>
                                <td>$ 39.99 each</td>
                            </tr>
                        </c:if>
                        <c:if test="${products > 0 && i == 1 }">
                            <tr>
                                <td>4GB Kit (2GBx2) DDR3 PC3-12800 Unbuffered NON-ECC 1.35V 1024Meg x 64</td>
                                <td><c:out value="${products}"/></td>
                                <td>$ 59.99 each</td>
                            </tr>
                        </c:if>
                        <c:if test="${products > 0 && i == 2 }">
                            <tr>
                                <td>8GB Kit (4GBx2) DDR3 PC3-12800 Unbuffered NON-ECC 1.35V 1024Meg x 64</td>
                                <td><c:out value="${products}"/></td>
                                <td>$ 79.99 each</td>
                            </tr>
                        </c:if>
                        <c:if test="${products > 0 && i == 3 }">
                            <tr>
                                <td>16GB Kit (8GBx2) DDR3 PC3-12800 Unbuffered NON-ECC 1.35V 1024Meg x 64</td>
                                <td><c:out value="${products}"/></td>
                                <td>$ 99.99 each</td>
                            </tr>
                        </c:if>
                        <c:if test="${products > 0 && i == 4 }">
                            <tr>
                                <td>128GB SATA 6Gb/s 2.5" Internal SSD</td>
                                <td><c:out value="${products}"/></td>
                                <td>$ 69.99 each</td>
                            </tr>
                        </c:if>
                        <c:if test="${products > 0 && i == 5 }">
                            <tr>
                                <td>256GB SATA 6Gb/s 2.5" Internal SSD</td>
                                <td><c:out value="${products}"/></td>
                                <td>$ 109.99 each</td>
                            </tr>
                        </c:if>
                        <c:if test="${products > 0 && i == 6 }">
                            <tr>
                                <td>512GB SATA 6Gb/s 2.5" Internal SSD</td>
                                <td><c:out value="${products}"/></td>
                                <td>$ 199.99 each</td>
                            </tr>
                        </c:if>
                        <c:if test="${products > 0 && i == 7 }">
                            <tr>
                                <td>1TB SATA 6Gb/s 2.5" Internal SSD</td>
                                <td><c:out value="${products}"/></td>
                                <td>$ 429.99 each</td>
                            </tr>
                        </c:if>
                        <c:set var="i" scope="page" value="${i + 1}"/>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <c:if test="${userCart.totalPrice > '0'}">
            <label style="margin-left: 5.5%">Total Price: ${userCart.totalPrice}</label><br>
            <span title="We accept all major credit cards"><button style="margin-left: 5.5%"><a href="paynow.jsp">pay now</a></button></span>
                </c:if>
    </body>
</html>
