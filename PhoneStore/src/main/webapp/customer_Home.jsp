<%-- 
    Document   : Home
    Created on : Oct 23, 2023, 10:58:46 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <%
            session.setAttribute("wn_Home", true);
            session.setAttribute("wn_Cart", false);
            session.setAttribute("wn_User", false);
            session.setAttribute("wn_InfShop", false);
            session.setAttribute("wn_Comment", false);
        %>
        <%@include file="customer_header.jsp" %>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;0,800;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        <link rel="stylesheet" href="styles/Home.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
        <section class="hero">
            <h1>Welcome To Our Store!! <i class="fa-solid fa-heart" style="color: #ff0000;"></i></h1>
            <form action="CustomerProduct" method="post" class="btn-group">
                <button class="btn-filled-dark"><span class="material-symbols-outlined">
                        shopping_cart
                    </span>Shop All Products</button>
                <input type="hidden" name="typeProduct" value="all"/>
                <input type="hidden" name="done" value="show_product"/>
            </form>

        </section>
        <section>
            <h2><i class="fa-solid fa-angles-right"></i> SHOP BY PHONES <i class="fa-solid fa-angles-right fa-rotate-180"></i></h2>

            <ul class="shop-phones">
                <li class="card-large card-light" id="sup-1">
                    <div class="card-image"><img src="img/icons8-xiaomi-384.png"></div>
                    <ul>XIAOMI
                        <li><i class="fa-regular fa-circle-check"></i><a> Super smooth</a></li>
                        <li><i class="fa-regular fa-circle-check"></i><a> Takes super sharp photos</a></li>
                        <li><i class="fa-regular fa-circle-check"></i><a> Trendy design</a></li>
                        <li><i class="fa-regular fa-circle-check"></i><a> Huge battery capacity</a></li>
                        <li><i class="fa-regular fa-circle-check"></i><a> Fast charging time</a></li>
                        <form action="CustomerProduct" method="post">
                            <button class="btn-outline-light">Shop All<span class="material-symbols-outlined">
                                    arrow_forward
                                </span></button>
                            <input type="hidden" name="typeProduct" value="xiaomi"/>
                            <input type="hidden" name="done" value="show_product"/>
                        </form>

                    </ul>


                </li>

                <li class="card-large card-dark" id="sup-2">
                    <div class="card-image"><img src="img/realme_logo.png"> </div>
                    <ul>REALME
                        <li><i class="fa-regular fa-square-check"></i><a> 1 billion color screen</a></li>
                        <li><i class="fa-regular fa-square-check"></i><a> Establish Advanced camera</a></li>
                        <li><i class="fa-regular fa-square-check"></i><a> Only 63 minutes to fully charge</a></li>
                        <li><i class="fa-regular fa-square-check"></i><a> Modern design</a></li>
                        <form action="CustomerProduct" method="post" style="margin-top:50px">
                            <button class="btn-outline-dark">Shop All<span class="material-symbols-outlined">
                                    arrow_forward
                                </span></button>
                            <input type="hidden" name="typeProduct" value="realme"/>
                            <input type="hidden" name="done" value="show_product"/>
                        </form>
                    </ul>

                </li>

                <li class="card-large card-dark" id="sup-3">
                    <div class="card-image"><img src="img/icons8-iphone-14-100.png"></div>
                    <ul>IPHONE
                        <li><i class="fa-regular fa-circle-check"></i><a> Splashproof and dustproof</a></li>
                        <li><i class="fa-regular fa-circle-check"></i><a> Trendy</a></li>
                        <li><i class="fa-regular fa-circle-check"></i><a> Luxurious</a></li>
                        <li><i class="fa-regular fa-circle-check"></i><a> IOS system</a></li>
                        <li><i class="fa-regular fa-circle-check"></i><a> Ultra-sharp camera</a></li>
                        <form action="CustomerProduct" method="post">
                            <button class="btn-outline-dark">Shop All<span class="material-symbols-outlined">
                                    arrow_forward
                                </span></button>
                            <input type="hidden" name="typeProduct" value="iphone"/>
                            <input type="hidden" name="done" value="show_product"/>
                        </form>
                    </ul>

                </li>

                <li class="card-large card-light" id="sup-4">
                    <div class="card-image"><img src="img/samsung_logo.png"></div>
                    <ul>SAMSUNG
                        <li><i class="fa-regular fa-square-check"></i><a> Sustainable design</a></li>
                        <li><i class="fa-regular fa-square-check"></i><a> Dark God's Eye Camera</a></li>
                        <li><i class="fa-regular fa-square-check"></i><a> Snapdragon processors</a></li>
                        <li><i class="fa-regular fa-square-check"></i><a> The future of display technology</a></li>
                        <form action="CustomerProduct" method="post" style="margin-top:45px">
                            <button class="btn-outline-light">Shop All<span class="material-symbols-outlined">
                                    arrow_forward
                                </span></button>
                            <input type="hidden" name="typeProduct" value="samsung"/>
                            <input type="hidden" name="done" value="show_product"/>
                        </form>
                    </ul>

                </li>
            </ul>
        </section>

        <section>
            <h2><i class="fa-solid fa-angles-right"></i> OUR PROMOTIONS <i class="fa-solid fa-angles-right fa-rotate-180"></i></h2>
            <ul class="services">
                <c:forEach var="item" items="${discounts}">
                    <li class="card-large card-dark card-wide" id="serv-groom">
                        <div class="card-image"><img src="img/discount.jpg"></div>
                        <ul>
                            ${item.name}<span class="subtitle">We will provide discount for the following orders</span>
                            <li><a>Code</a><span>${item.discountID}</span></li>
                            <li><a>Discount</a><span>${item.discount}%</span></li>
                            <li><a>Start</a><span>${item.dateStart}</span></li>
                            <li><a>End</a><span>${item.dateEnd}</span></li>
                            <c:choose>
                                <c:when test="${discount_save.discountID == null || item.discountID != discount_save.discountID}">
                                    <form action="CustomerDiscount" method="post">
                                        <button id="addToCartButton" class="btn-filled-dark" ><i class="fa-regular fa-circle-down"></i></i>Add Cart</button>
                                        <input type="hidden" name="discountID" value="${item.discountID}"/>
                                        <input type="hidden" name="done" value="change_discount"/>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <button id="addToCartButton" class="btn-filled-dark" style="pointer-events: none; cursor: not-allowed; opacity: 0.6; "><i class="fa-regular fa-circle-down"></i></i>Add Cart</button>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </li>
                </c:forEach>
            </ul>
        </section>

        <section id="locate">

            <div>
                <h2>Location &amp; Contact</h2>
                <p>Our knowledgeable and friendly staff is always ready to assist you in making the best choices for your phone.</p>
                <div class="btn-group">
                    <button class="btn-filled-dark"><span class="material-symbols-outlined">
                            pin_drop
                        </span><a style="color: white" href="https://www.google.com/maps/place/Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+S%C6%B0+ph%E1%BA%A1m+K%E1%BB%B9+thu%E1%BA%ADt+Th%C3%A0nh+ph%E1%BB%91+H%E1%BB%93+Ch%C3%AD+Minh/@10.8506377,106.7693382,17z/data=!3m1!4b1!4m6!3m5!1s0x31752763f23816ab:0x282f711441b6916f!8m2!3d10.8506324!4d106.7719131!16s%2Fm%2F02pz17z?entry=ttu">
                            Find a Store</a></button>
                    <button class="btn-outline-dark btn-hover-color"><span class="material-symbols-outlined">
                            contact_support
                        </span> <a href="https://www.facebook.com/profile.php?id=100008830505221">Contact Us</a></button>
                </div>
            </div>
        </section>
    </body>
</html>
