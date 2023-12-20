<%-- 
    Document   : cart
    Created on : Nov 28, 2023, 3:55:13 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Shopping</title>
    </head>
    <body>
        <%
            session.setAttribute("wn_Home", false);
            session.setAttribute("wn_Cart", true);
            session.setAttribute("wn_User", false);
            session.setAttribute("wn_InfShop", false);
            session.setAttribute("wn_Comment", false);
           %>
        <%@include file="customer_header.jsp" %>
        <link rel="stylesheet" href="styles/cart.css"/>
        <div class="wrapper">
            <h1>My Cart <i class="fa-solid fa-cart-shopping"></i></h1>
            <div class="project">
                <div class="shop">
                    <c:forEach var="lineItem" items="${cart.lslineItems}">
                        <div class="box">
                            <img src="${lineItem.item.image}">
                            <div class="content">
                                <h3><a href="CustomerProduct?done=details&amp;productCode=<c:out value='${lineItem.item.productID}'/>" style="text-decoration: none;">${lineItem.item.name}</a></h3>
                                <h4>Price: $${lineItem.item.price}</h4>
                                <form action="CustomerCart" method="post" class="quantity-section">
                                    <div class="quantity-controls">
                                        <button class="quantity-btn" onclick="updateQuantity(-1,${lineItem.id})">-</button>
                                        <input type="number" pattern="\d+" min ='0' name="quanlity" value="${lineItem.quanlity}" class="quantity-input" id="${lineItem.id}" style="width: 50px" required>
                                        <button class="quantity-btn" onclick="updateQuantity(1,${lineItem.id})">+</button>
                                    </div>
                                    <input type="hidden" name="change_cart" value="update">
                                    <input type="hidden" name="lineItemID" value="<c:out value='${lineItem.id}'/>">
                                    <button class="update-btn" onclick="updateQuantity(0,${lineItem.id})"><i class="fa-solid fa-pen-to-square"></i></button>
                                </form>
                                <a class="btn-area" href="CustomerCart?change_cart=remove&amp;lineItemID=<c:out value="${lineItem.id}"/>" style="text-decoration: none;"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <form action="CustomerCheckout" method="post" class="right-bar">
                    <p><span>Subtotal</span> <span>$${cart.totalPrice}</span></p>
                    <hr>
                    <p><span>Discount</span> <span>- $${cart.totalPrice*discount_save.discount/100}</span></p>
                    <hr>
                    <p><span>Method</span> 
                        <select id="discount" name="method">
                            <option value="1">online</option>
                            <option value="2">offline</option>
                        </select></p>
                    <hr>
                    <p><span>Total</span> <span>$${cart.totalPrice - cart.totalPrice*discount_save.discount/100}</span></p>
                    <button style="width: 200px"><i class="fa fa-shopping-cart"></i>Checkout</button>
                </form>
            </div>
        </div>
        <script>
            function updateQuantity(change, id) {
                // Get the current quantity input element
                var quantityInput = document.getElementById(id);

                // Parse the current quantity value as an integer
                var currentQuantity = parseInt(quantityInput.value);

                // Update the quantity based on the change parameter
                var newQuantity = currentQuantity + change;

                // Ensure the new quantity is not less than 0
                newQuantity = Math.max(newQuantity, 0);

                // Update the quantity input with the new value
                quantityInput.value = newQuantity;
            }
        </script>
    </body>

</html>
