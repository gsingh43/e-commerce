<%-- 
    Document   : RAM
    Created on : May 21, 2015, 12:33:31 PM
    Author     : gagandeep
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop</title>
        <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript">
            function cartFunction() {
                var numberOfItemsInCart = sessionStorage.getItem("numberOfItemsInCart");
                document.getElementById("shoppingCart").innerHTML = numberOfItemsInCart;

                var current0 = window.sessionStorage.getItem("current0");
                var current1 = window.sessionStorage.getItem("current1");
                var current2 = window.sessionStorage.getItem("current2");
                var current3 = window.sessionStorage.getItem("current3");
                var current4 = window.sessionStorage.getItem("current4");
                var current5 = window.sessionStorage.getItem("current5");
                var current6 = window.sessionStorage.getItem("current6");
                var current7 = window.sessionStorage.getItem("current7");

                if (current0 > '0') {

                    document.getElementById("Ram1").value = current0;
                }
                if (current1 > '0') {

                    document.getElementById("Ram2").value = current1;
                }
                if (current2 > '0') {

                    document.getElementById("Ram3").value = current2;
                }
                if (current3 > '0') {

                    document.getElementById("Ram4").value = current3;
                }
                if (current4 > '0') {

                    document.getElementById("Ssd5").value = current4;
                }
                if (current5 > '0') {

                    document.getElementById("Ssd6").value = current5;
                }
                if (current6 > '0') {

                    document.getElementById("Ssd7").value = current6;
                }
                if (current7 > '0') {

                    document.getElementById("Ssd8").value = current7;
                }


            }

        </script>
        <style type="text/css">
            body { 

                background-repeat: no-repeat;
                background-attachment: fixed;


            }
        </style>
        <script type="text/javascript">
            function transfer(index) {

                if (index === 1) {
                    document.getElementById("transferURL").value = "/afterLogin.jsp";
                    document.getElementById("myForm").submit();
                }
                else if (index === 2) {
                    document.getElementById("transferURL").value = "/cart.jsp";
                    document.getElementById("myForm").submit();
                }
                else if (index === 3) {

                    var send = confirm("Are you sure you want to logout?");
                    if (send) {
                        window.sessionStorage.clear();
                        return true;
                    }
                    return false;
                }
                else if (index === 4) {

                    document.getElementById("transferURL").value = "/updateProfile.jsp";
                    document.getElementById("myForm").submit();

                }
                else if (index === 5) {

                    document.getElementById("transferURL").value = "/deleteProfile.jsp";
                    document.getElementById("myForm").submit();

                }

            }
        </script>
        <script type="text/javascript">
            function updateCart(sel, index) {

                var numberOfItemsInCart = window.sessionStorage.getItem("numberOfItemsInCart");
                var arrayOfPrevious = window.sessionStorage.getItem("arrayOfPrevious");
                arrayOfPrevious = JSON.parse(arrayOfPrevious);
                var current0 = window.sessionStorage.getItem("current0");
                var current1 = window.sessionStorage.getItem("current1");
                var current2 = window.sessionStorage.getItem("current2");
                var current3 = window.sessionStorage.getItem("current3");
                var current4 = window.sessionStorage.getItem("current4");
                var current5 = window.sessionStorage.getItem("current5");
                var current6 = window.sessionStorage.getItem("current6");
                var current7 = window.sessionStorage.getItem("current7");

                var onOrOff0 = window.sessionStorage.getItem("onOrOff0");
                var onOrOff1 = window.sessionStorage.getItem("onOrOff1");
                var onOrOff2 = window.sessionStorage.getItem("onOrOff2");
                var onOrOff3 = window.sessionStorage.getItem("onOrOff3");
                var onOrOff4 = window.sessionStorage.getItem("onOrOff4");
                var onOrOff5 = window.sessionStorage.getItem("onOrOff5");
                var onOrOff6 = window.sessionStorage.getItem("onOrOff6");
                var onOrOff7 = window.sessionStorage.getItem("onOrOff7");

                onOrOff0 = JSON.parse(onOrOff0);
                onOrOff1 = JSON.parse(onOrOff1);
                onOrOff2 = JSON.parse(onOrOff2);
                onOrOff3 = JSON.parse(onOrOff3);
                onOrOff4 = JSON.parse(onOrOff4);
                onOrOff5 = JSON.parse(onOrOff5);
                onOrOff6 = JSON.parse(onOrOff6);
                onOrOff7 = JSON.parse(onOrOff7);

                var ram;

                if (!numberOfItemsInCart) {

                    numberOfItemsInCart = 0;

                    arrayOfPrevious = new Array(8);

                    ram = sel.value;
                                    
                    if (ram > "0" && index === 0) {
                        
                        numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                        current0 = sel.value;
                        arrayOfPrevious[0] = 0;
                        arrayOfPrevious[1] = 0;
                        arrayOfPrevious[2] = 0;
                        arrayOfPrevious[3] = 0;
                        arrayOfPrevious[4] = 0;
                        arrayOfPrevious[5] = 0;
                        arrayOfPrevious[6] = 0;
                        arrayOfPrevious[7] = 0;
                        current1 = 0;
                        current2 = 0;
                        current3 = 0;
                        current4 = 0;
                        current5 = 0;
                        current6 = 0;
                        current7 = 0;
                        onOrOff0 = true;
                        if (ram && index === 0) {
                            onOrOff0 = false;

                        }

                    }
                    if (ram > "0" && index === 1) {
                        
                        numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                        current1 = sel.value;
                        arrayOfPrevious[0] = 0;
                        arrayOfPrevious[1] = 0;
                        arrayOfPrevious[2] = 0;
                        arrayOfPrevious[3] = 0;
                        arrayOfPrevious[4] = 0;
                        arrayOfPrevious[5] = 0;
                        arrayOfPrevious[6] = 0;
                        arrayOfPrevious[7] = 0;
                        current0 = 0;
                        current2 = 0;
                        current3 = 0;
                        current4 = 0;
                        current5 = 0;
                        current6 = 0;
                        current7 = 0;
                        onOrOff1 = true;
                        if (ram && index === 1) {
                            onOrOff1 = false;
                        }

                    }
                    if (ram > "0" && index === 2) {
                        
                        numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                        current2 = sel.value;
                        arrayOfPrevious[0] = 0;
                        arrayOfPrevious[1] = 0;
                        arrayOfPrevious[2] = 0;
                        arrayOfPrevious[3] = 0;
                        arrayOfPrevious[4] = 0;
                        arrayOfPrevious[5] = 0;
                        arrayOfPrevious[6] = 0;
                        arrayOfPrevious[7] = 0;
                        current1 = 0;
                        current0 = 0;
                        current3 = 0;
                        current4 = 0;
                        current5 = 0;
                        current6 = 0;
                        current7 = 0;
                        onOrOff2 = true;
                        if (ram && index === 2) {
                            onOrOff2 = false;
                        }


                    }
                    if (ram > "0" && index === 3) {
                        
                        numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                        current3 = sel.value;
                        arrayOfPrevious[0] = 0;
                        arrayOfPrevious[1] = 0;
                        arrayOfPrevious[2] = 0;
                        arrayOfPrevious[3] = 0;
                        arrayOfPrevious[4] = 0;
                        arrayOfPrevious[5] = 0;
                        arrayOfPrevious[6] = 0;
                        arrayOfPrevious[7] = 0;
                        current1 = 0;
                        current2 = 0;
                        current0 = 0;
                        current4 = 0;
                        current5 = 0;
                        current6 = 0;
                        current7 = 0;
                        onOrOff3 = true;
                        if (ram && index === 3) {
                            onOrOff3 = false;
                        }

                    }
                    if (ram > "0" && index === 4) {
                       
                        numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                        current4 = sel.value;
                        arrayOfPrevious[0] = 0;
                        arrayOfPrevious[1] = 0;
                        arrayOfPrevious[2] = 0;
                        arrayOfPrevious[3] = 0;
                        arrayOfPrevious[4] = 0;
                        arrayOfPrevious[5] = 0;
                        arrayOfPrevious[6] = 0;
                        arrayOfPrevious[7] = 0;
                        current0 = 0;
                        current1 = 0;
                        current2 = 0;
                        current3 = 0;
                        current5 = 0;
                        current6 = 0;
                        current7 = 0;
                        onOrOff4 = true;
                        if (ram && index === 4) {
                            onOrOff4 = false;
                        }

                    }
                    if (ram > "0" && index === 5) {
                        
                        numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                        current5 = sel.value;
                        arrayOfPrevious[0] = 0;
                        arrayOfPrevious[1] = 0;
                        arrayOfPrevious[2] = 0;
                        arrayOfPrevious[3] = 0;
                        arrayOfPrevious[4] = 0;
                        arrayOfPrevious[5] = 0;
                        arrayOfPrevious[6] = 0;
                        arrayOfPrevious[7] = 0;
                        current0 = 0;
                        current1 = 0;
                        current2 = 0;
                        current3 = 0;
                        current4 = 0;
                        current6 = 0;
                        current7 = 0;
                        onOrOff5 = true;
                        if (ram && index === 5) {
                            onOrOff5 = false;
                        }

                    }
                    if (ram > "0" & index === 6) {

                        numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                        current6 = sel.value;
                        arrayOfPrevious[0] = 0;
                        arrayOfPrevious[1] = 0;
                        arrayOfPrevious[2] = 0;
                        arrayOfPrevious[3] = 0;
                        arrayOfPrevious[4] = 0;
                        arrayOfPrevious[5] = 0;
                        arrayOfPrevious[6] = 0;
                        arrayOfPrevious[7] = 0;
                        current0 = 0;
                        current1 = 0;
                        current2 = 0;
                        current3 = 0;
                        current4 = 0;
                        current5 = 0;
                        current7 = 0;
                        onOrOff6 = true;
                        if (ram && index === 6) {
                            onOrOff6 = false;
                        }

                    }
                    if (ram > "0" & index === 7) {
                        
                        numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                        current7 = sel.value;
                        arrayOfPrevious[0] = 0;
                        arrayOfPrevious[1] = 0;
                        arrayOfPrevious[2] = 0;
                        arrayOfPrevious[3] = 0;
                        arrayOfPrevious[4] = 0;
                        arrayOfPrevious[5] = 0;
                        arrayOfPrevious[6] = 0;
                        arrayOfPrevious[7] = 0;
                        current0 = 0;
                        current1 = 0;
                        current2 = 0;
                        current3 = 0;
                        current4 = 0;
                        current5 = 0;
                        current6 = 0;
                        onOrOff7 = true;
                        if (ram && index === 7) {
                            onOrOff7 = false;
                        }

                    }

                    document.getElementById("shoppingCart").innerHTML = numberOfItemsInCart;
                    window.sessionStorage.setItem("numberOfItemsInCart", numberOfItemsInCart);
                    window.sessionStorage.setItem("current0", current0);
                    window.sessionStorage.setItem("current1", current1);
                    window.sessionStorage.setItem("current2", current2);
                    window.sessionStorage.setItem("current3", current3);
                    window.sessionStorage.setItem("current4", current4);
                    window.sessionStorage.setItem("current5", current5);
                    window.sessionStorage.setItem("current6", current6);
                    window.sessionStorage.setItem("current7", current7);

                    window.sessionStorage.setItem("arrayOfPrevious", JSON.stringify(arrayOfPrevious));
                    window.sessionStorage.setItem("onOrOff0", JSON.stringify(onOrOff0));
                    window.sessionStorage.setItem("onOrOff1", JSON.stringify(onOrOff1));
                    window.sessionStorage.setItem("onOrOff2", JSON.stringify(onOrOff2));
                    window.sessionStorage.setItem("onOrOff3", JSON.stringify(onOrOff3));
                    window.sessionStorage.setItem("onOrOff4", JSON.stringify(onOrOff4));
                    window.sessionStorage.setItem("onOrOff5", JSON.stringify(onOrOff5));
                    window.sessionStorage.setItem("onOrOff6", JSON.stringify(onOrOff6));
                    window.sessionStorage.setItem("onOrOff7", JSON.stringify(onOrOff7));


                }
                else {

                    ram = sel.value;

                    if (ram && index === 0) {

                        if (onOrOff0 !== false && ram > '0') {

                            arrayOfPrevious[0] = parseInt(arrayOfPrevious[0]) + parseInt(current0);

                            current0 = sel.value;

                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff0 = false;



                        }
                        else if (ram === '0') {

                            arrayOfPrevious[0] = parseInt(current0);
                            current0 = sel.value;
                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[0]);
                                onOrOff0 = true;
                            }
                        }
                        else if (ram > '0' && onOrOff0 !== true) {

                            arrayOfPrevious[0] = parseInt(current0);
                            current0 = sel.value;

                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[0]);

                            }


                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff0 = false;


                        }
                    }

                    if (ram && index === 1) {

                        if (onOrOff1 !== false && ram > '0') {

                            arrayOfPrevious[1] = parseInt(arrayOfPrevious[1]) + parseInt(current1);

                            current1 = sel.value;

                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff1 = false;



                        }
                        else if (ram === '0') {

                            arrayOfPrevious[1] = parseInt(current1);
                            current1 = sel.value;
                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[1]);
                                onOrOff1 = true;
                            }
                        }
                        else if (ram > '0' && onOrOff1 !== true) {

                            arrayOfPrevious[1] = parseInt(current1);
                            current1 = sel.value;

                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[1]);

                            }


                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff1 = false;


                        }
                    }
                    if (ram && index === 2) {

                        if (onOrOff2 !== false && ram > '0') {

                            arrayOfPrevious[2] = parseInt(arrayOfPrevious[2]) + parseInt(current2);

                            current2 = sel.value;

                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff2 = false;



                        }
                        else if (ram === '0') {

                            arrayOfPrevious[2] = parseInt(current2);
                            current2 = sel.value;
                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[2]);
                                onOrOff2 = true;
                            }
                        }
                        else if (ram > '0' && onOrOff2 !== true) {

                            arrayOfPrevious[2] = parseInt(current2);
                            current2 = sel.value;

                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[2]);

                            }


                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff2 = false;


                        }

                    }
                    if (ram && index === 3) {

                        if (onOrOff3 !== false && ram > '0') {

                            arrayOfPrevious[3] = parseInt(arrayOfPrevious[3]) + parseInt(current3);

                            current3 = sel.value;

                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff3 = false;



                        }
                        else if (ram === '0') {

                            arrayOfPrevious[3] = parseInt(current3);
                            current3 = sel.value;
                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[3]);
                                onOrOff3 = true;
                            }
                        }
                        else if (ram > '0' && onOrOff3 !== true) {

                            arrayOfPrevious[3] = parseInt(current3);
                            current3 = sel.value;

                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[3]);

                            }


                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff3 = false;


                        }

                    }
                    if (ram && index === 4) {

                        if (onOrOff4 !== false && ram > '0') {

                            arrayOfPrevious[4] = parseInt(arrayOfPrevious[4]) + parseInt(current4);

                            current4 = sel.value;

                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff4 = false;

                        }
                        else if (ram === '0') {

                            arrayOfPrevious[4] = parseInt(current4);
                            current4 = sel.value;
                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[4]);
                                onOrOff4 = true;
                            }
                        }
                        else if (ram > '0' && onOrOff4 !== true) {

                            arrayOfPrevious[4] = parseInt(current4);
                            current4 = sel.value;

                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[4]);

                            }


                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff4 = false;


                        }


                    }
                    if (ram && index === 5) {
                        if (onOrOff5 !== false && ram > '0') {

                            arrayOfPrevious[5] = parseInt(arrayOfPrevious[5]) + parseInt(current5);

                            current5 = sel.value;

                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff5 = false;



                        }
                        else if (ram === '0') {

                            arrayOfPrevious[5] = parseInt(current5);
                            current5 = sel.value;
                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[5]);
                                onOrOff5 = true;
                            }
                        }
                        else if (ram > '0' && onOrOff5 !== true) {

                            arrayOfPrevious[5] = parseInt(current5);
                            current5 = sel.value;

                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[5]);

                            }


                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff5 = false;


                        }
                    }
                    if (ram && index === 6) {

                        if (onOrOff6 !== false && ram > '0') {

                            arrayOfPrevious[6] = parseInt(arrayOfPrevious[6]) + parseInt(current6);

                            current6 = sel.value;

                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff6 = false;



                        }
                        else if (ram === '0') {

                            arrayOfPrevious[6] = parseInt(current6);
                            current6 = sel.value;
                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[6]);
                                onOrOff6 = true;
                            }
                        }
                        else if (ram > '0' && onOrOff6 !== true) {

                            arrayOfPrevious[6] = parseInt(current6);
                            current6 = sel.value;

                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[6]);

                            }


                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff6 = false;


                        }

                    }
                    if (ram && index === 7) {
                        if (onOrOff7 !== false && ram > '0') {

                            arrayOfPrevious[7] = parseInt(arrayOfPrevious[7]) + parseInt(current7);

                            current7 = sel.value;

                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff7 = false;



                        }
                        else if (ram === '0') {

                            arrayOfPrevious[7] = parseInt(current7);
                            current7 = sel.value;
                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[7]);
                                onOrOff7 = true;
                            }
                        }
                        else if (ram > '0' && onOrOff7 !== true) {

                            arrayOfPrevious[7] = parseInt(current7);
                            current7 = sel.value;

                            if (numberOfItemsInCart > 0) {

                                numberOfItemsInCart = parseInt(numberOfItemsInCart) - parseInt(arrayOfPrevious[7]);

                            }


                            numberOfItemsInCart = (+numberOfItemsInCart) + (+sel.value);
                            onOrOff7 = false;


                        }
                    }

                    sessionStorage.setItem("numberOfItemsInCart", numberOfItemsInCart);
                    document.getElementById("shoppingCart").innerHTML = numberOfItemsInCart;
                    window.sessionStorage.setItem("current0", current0);
                    window.sessionStorage.setItem("current1", current1);
                    window.sessionStorage.setItem("current2", current2);
                    window.sessionStorage.setItem("current3", current3);
                    window.sessionStorage.setItem("current4", current4);
                    window.sessionStorage.setItem("current5", current5);
                    window.sessionStorage.setItem("current6", current6);
                    window.sessionStorage.setItem("current7", current7);

                    window.sessionStorage.setItem("arrayOfPrevious", JSON.stringify(arrayOfPrevious));
                    window.sessionStorage.setItem("onOrOff0", JSON.stringify(onOrOff0));
                    window.sessionStorage.setItem("onOrOff1", JSON.stringify(onOrOff1));
                    window.sessionStorage.setItem("onOrOff2", JSON.stringify(onOrOff2));
                    window.sessionStorage.setItem("onOrOff3", JSON.stringify(onOrOff3));
                    window.sessionStorage.setItem("onOrOff4", JSON.stringify(onOrOff4));
                    window.sessionStorage.setItem("onOrOff5", JSON.stringify(onOrOff5));
                    window.sessionStorage.setItem("onOrOff6", JSON.stringify(onOrOff6));
                    window.sessionStorage.setItem("onOrOff7", JSON.stringify(onOrOff7));
                }

            }

        </script>
    </head>
    <body background="ProcessorCPU.jpg" onload="cartFunction()">
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">COMPUTER CENTRAL</a>
                </div>
                <div>
                    <ul class="nav navbar-nav">
                        <li><a href="#" onclick="transfer(1)">Home</a></li>
                        <li class="active"><a href="RAM.jsp">SHOP</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span>${userInfo.userID}</a></li>
                        <li><a href="#" onclick="transfer(2)" ><span class="glyphicon glyphicon-shopping-cart"></span><label id="shoppingCart"></label></a></li>
                        <li><a href="logoutUser" onclick="return transfer(3)"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">EDIT <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#" onclick="transfer(4)">Update Profile</a></li>
                                <li><a href="#" onclick="transfer(5)">Delete Profile</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <form id="myForm" action="shopToControl0" method="POST">
            <div class="container">
                <table class="table">
                    <tbody>
                        <tr>
                            <td><img style="margin-top: 12%" src="vengeance.png" width="450px" height="250px"></td>
                            <td><label style="color:yellowgreen; margin-top: 18%">2GB Kit (1GBx2) DDR3 PC3-12800 Unbuffered NON-ECC 1.35V 1024Meg x 64</label><br>
                                <label style="color:red; margin-top: 5%">$ 39.99 each</label><br><label style="color:yellow; margin-top: 10%">**Limit 10 Per Person**</label></td>
                            <td>
                                <select name="Ram1" onchange="updateCart(this, 0)" id="Ram1" style="margin-top: 185%">
                                    <option value="0">Select</option>
                                    <option value="1">1</option> 
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option> 
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option> 
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="ballistix.png" width="450px" height="250px"></td>
                            <td><label style="color:yellowgreen; margin-top: 10%">4GB Kit (2GBx2) DDR3 PC3-12800 Unbuffered NON-ECC 1.35V 1024Meg x 64</label><br>
                                <label style="color:red; margin-top: 5%">$ 59.99 each</label><br><label style="color:yellow; margin-top: 10%">**Limit 10 Per Person**</label></td>
                            <td>
                                <select name="Ram2" onchange="updateCart(this, 1)" id="Ram2" style="margin-top: 125%">
                                    <option value="0" selected="selected">Select</option>
                                    <option value="1">1</option> 
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option> 
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option> 
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="kingston.png" width="450px" height="250px"></td>
                            <td><label style="color:yellowgreen; margin-top: 10%">8GB Kit (4GBx2) DDR3 PC3-12800 Unbuffered NON-ECC 1.35V 1024Meg x 64</label><br>
                                <label style="color:red; margin-top: 5%">$ 79.99 each</label><br><label style="color:yellow; margin-top: 10%">**Limit 10 Per Person**</label></td>
                            <td>
                                <select name="Ram3" onchange="updateCart(this, 2)" id="Ram3" style="margin-top: 125%">
                                    <option value="0">Select</option>
                                    <option value="1">1</option> 
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option> 
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option> 
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="adataXPG.png" width="450px" height="250px"></td>
                            <td><label style="color:yellowgreen; margin-top: 10%">16GB Kit (8GBx2) DDR3 PC3-12800 Unbuffered NON-ECC 1.35V 1024Meg x 64</label><br>
                                <label style="color:red; margin-top: 5%">$ 99.99 each</label><br><label style="color:yellow; margin-top: 10%">**Limit 10 Per Person**</label></td>
                            <td>
                                <select name="Ram4" onchange="updateCart(this, 3)" id="Ram4" style="margin-top: 125%">
                                    <option value="0">Select</option>
                                    <option value="1">1</option> 
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option> 
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option> 
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="crucialSSD.png" width="450px" height="250px"></td>
                            <td><label style="color:yellowgreen; margin-top: 10%">128GB SATA 6Gb/s 2.5" Internal SSD</label><br>
                                <label style="color:red; margin-top: 5%">$ 69.99 each</label><br><label style="color:yellow; margin-top: 10%">**Limit 10 Per Person**</label></td>
                            <td>
                                <select name="Ssd5" onchange="updateCart(this, 4)" id="Ssd5" style="margin-top: 125%">
                                    <option value="0">Select</option>
                                    <option value="1">1</option> 
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option> 
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option> 
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="CorsairSSD.png" width="450px" height="250px"></td>
                            <td><label style="color:yellowgreen; margin-top: 10%">256GB SATA 6Gb/s 2.5" Internal SSD</label><br>
                                <label style="color:red; margin-top: 5%">$ 109.99 each</label><br><label style="color:yellow; margin-top: 10%">**Limit 10 Per Person**</label></td>
                            <td>
                                <select name="Ssd6" onchange="updateCart(this, 5)" id="Ssd6" style="margin-top: 125%">
                                    <option value="0">Select</option>
                                    <option value="1">1</option> 
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option> 
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option> 
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="hyperxSSD.png" width="450px" height="250px"></td>
                            <td><label style="color:yellowgreen; margin-top: 10%">512GB SATA 6Gb/s 2.5" Internal SSD</label><br>
                                <label style="color:red; margin-top: 5%">$ 199.99 each</label><br><label style="color:yellow; margin-top: 10%">**Limit 10 Per Person**</label></td>
                            <td>
                                <select name="Ssd7" onchange="updateCart(this, 6)" id="Ssd7" style="margin-top: 125%">
                                    <option value="0">Select</option>
                                    <option value="1">1</option> 
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option> 
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option> 
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="sandiskSSD.png" width="450px" height="250px"></td>
                            <td><label style="color:yellowgreen; margin-top: 10%">1TB SATA 6Gb/s 2.5" Internal SSD</label><br>
                                <label style="color:red; margin-top: 5%">$ 429.99 each</label><br><label style="color:yellow; margin-top: 10%">**Limit 10 Per Person**</label></td>
                            <td>
                                <select name="Ssd8" onchange="updateCart(this, 7)" id="Ssd8" style="margin-top: 125%">
                                    <option value="0">Select</option>
                                    <option value="1">1</option> 
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option> 
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option> 
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <input type="hidden" name="transferURL" value="" id="transferURL">
        </form>
    </body>
</html>
