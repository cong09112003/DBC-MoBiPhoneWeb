<%-- 
    Document   : header
    Created on : Oct 22, 2023, 10:52:42 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css'>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css'>
        <link rel="stylesheet" href="styles/header.css">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-custom navbar-mainbg">
                <a class="navbar-brand navbar-logo" href="CustomerServlet" ><span style="font-size: 20px"><i class="fa-solid fa-shop"></i>MOBILE STORE</span></a>
                <button class="navbar-toggler" type="button" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars text-white"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <div class="hori-selector"><div class="left"></div><div class="right"></div></div>
                        <% if (session.getAttribute("wn_Home") == null || (Boolean) session.getAttribute("wn_Home") == false) { %>
                        <li class="nav-item" id= 'Home'>
                        <% } else { %>
                        <li class="nav-item active" id= 'Home'>
                        <% } %>
                            <a class="nav-link" href="customer_Home.jsp"><i class="fa-solid fa-mobile"></i>Home</a>
                        </li>
                        <% if (session.getAttribute("wn_Cart") == null || (Boolean) session.getAttribute("wn_Cart") == false) { %>
                        <li class="nav-item" id= 'Cart'>
                        <% } else { %>
                        <li class="nav-item active" id= 'Cart'>
                        <% } %>
                            <a class="nav-link" href="customer_cart.jsp"><i class="fa-solid fa-cart-shopping"></i>Cart</a>
                        </li>
                        <% if (session.getAttribute("wn_Comment") == null || (Boolean) session.getAttribute("wn_Comment") == false) { %>
                        <li class="nav-item" id= 'InfShop'>
                        <% } else { %>
                        <li class="nav-item active" id= 'Comment'>
                        <% } %>
                            <a class="nav-link" href="customer_comment.jsp"><i class="fa-regular fa-comment-dots"></i>Comment</a>
                        </li>
                        <% if (session.getAttribute("wn_User") == null || (Boolean) session.getAttribute("wn_User") == false) { %>
                        <li class="nav-item" id= 'User'>
                        <% } else { %>
                        <li class="nav-item active" id= 'User'>
                        <% } %>
                            <a class="nav-link" href="customer_profile.jsp"><i class="fa-solid fa-user"></i>User</a>
                        </li>
                        <% if (session.getAttribute("wn_InfShop") == null || (Boolean) session.getAttribute("wn_InfShop") == false) { %>
                        <li class="nav-item" id= 'InfShop'>
                        <% } else { %>
                        <li class="nav-item active" id= 'InfShop'>
                        <% } %>
                            <a class="nav-link" href="admin_profile.jsp"><i class="fa-solid fa-circle-info"></i>Shop</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
            <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
            <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js'></script>
            <script  src="js/header.js"></script>
        </header>
    </body>
</html>
