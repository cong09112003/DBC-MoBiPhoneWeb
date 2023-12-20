<%-- 
    Document   : Admin
    Created on : Oct 29, 2023, 9:48:31 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css'>
        <link rel="stylesheet" href="styles/Admin.css">
    </head>
    <body>
        <div class="app-container">
            <div class="sidebar">
                <div class="sidebar-header">
                    <div class="app-icon">
                        <i class="fa-solid fa-shop"></i> MOBILE STORE
                    </div>
                </div>
                <ul class="sidebar-list">
                    <% if (session.getAttribute("sidebar-list") == null || session.getAttribute("sidebar-list").equals("Products") || session.getAttribute("sidebar-list").equals("Comment")) { %>
                    <li class="sidebar-list-item active">
                        <% } else { %>
                    <li class="sidebar-list-item">
                        <% }%>
                        <a href="Admin?sidebar-list=Products">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 384 512" fill= "#ffffff"><path d="M80 0C44.7 0 16 28.7 16 64V448c0 35.3 28.7 64 64 64H304c35.3 0 64-28.7 64-64V64c0-35.3-28.7-64-64-64H80zM192 400a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
                            <span>Products</span>
                        </a>
                    </li>
                    <% if (session.getAttribute("sidebar-list") != null && session.getAttribute("sidebar-list").equals("Promotion")) { %>
                    <li class="sidebar-list-item active">
                        <% } else { %>
                    <li class="sidebar-list-item">
                        <% }%>
                        <a href="Admin?sidebar-list=Promotion">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 512 512" fill= "#ffffff"><path d="M345 39.1L472.8 168.4c52.4 53 52.4 138.2 0 191.2L360.8 472.9c-9.3 9.4-24.5 9.5-33.9 .2s-9.5-24.5-.2-33.9L438.6 325.9c33.9-34.3 33.9-89.4 0-123.7L310.9 72.9c-9.3-9.4-9.2-24.6 .2-33.9s24.6-9.2 33.9 .2zM0 229.5V80C0 53.5 21.5 32 48 32H197.5c17 0 33.3 6.7 45.3 18.7l168 168c25 25 25 65.5 0 90.5L277.3 442.7c-25 25-65.5 25-90.5 0l-168-168C6.7 262.7 0 246.5 0 229.5zM144 144a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z"/></svg>
                            <span>Promotion</span>
                        </a>
                    </li>
                    <% if (session.getAttribute("sidebar-list") != null && session.getAttribute("sidebar-list").equals("Sales")) { %>
                    <li class="sidebar-list-item active">
                        <% } else { %>
                    <li class="sidebar-list-item">
                        <% }%>
                        <a href="Admin?sidebar-list=Sales">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 576 512" fill="#ffffff"><path d="M304 240V16.6c0-9 7-16.6 16-16.6C443.7 0 544 100.3 544 224c0 9-7.6 16-16.6 16H304zM32 272C32 150.7 122.1 50.3 239 34.3c9.2-1.3 17 6.1 17 15.4V288L412.5 444.5c6.7 6.7 6.2 17.7-1.5 23.1C371.8 495.6 323.8 512 272 512C139.5 512 32 404.6 32 272zm526.4 16c9.3 0 16.6 7.8 15.4 17c-7.7 55.9-34.6 105.6-73.9 142.3c-6 5.6-15.4 5.2-21.2-.7L320 288H558.4z"/></svg>
                            <span>Statistics</span>
                        </a>
                    </li>
                    <% if (session.getAttribute("sidebar-list") != null && session.getAttribute("sidebar-list").equals("Invoice")) { %>
                    <li class="sidebar-list-item active">
                        <% } else { %>
                    <li class="sidebar-list-item">
                        <% }%>
                        <a href="Admin?sidebar-list=Invoice">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 384 512" fill="#ffffff"><path d="M64 0C28.7 0 0 28.7 0 64V448c0 35.3 28.7 64 64 64H320c35.3 0 64-28.7 64-64V160H256c-17.7 0-32-14.3-32-32V0H64zM256 0V128H384L256 0zM64 80c0-8.8 7.2-16 16-16h64c8.8 0 16 7.2 16 16s-7.2 16-16 16H80c-8.8 0-16-7.2-16-16zm0 64c0-8.8 7.2-16 16-16h64c8.8 0 16 7.2 16 16s-7.2 16-16 16H80c-8.8 0-16-7.2-16-16zm128 72c8.8 0 16 7.2 16 16v17.3c8.5 1.2 16.7 3.1 24.1 5.1c8.5 2.3 13.6 11 11.3 19.6s-11 13.6-19.6 11.3c-11.1-3-22-5.2-32.1-5.3c-8.4-.1-17.4 1.8-23.6 5.5c-5.7 3.4-8.1 7.3-8.1 12.8c0 3.7 1.3 6.5 7.3 10.1c6.9 4.1 16.6 7.1 29.2 10.9l.5 .1 0 0 0 0c11.3 3.4 25.3 7.6 36.3 14.6c12.1 7.6 22.4 19.7 22.7 38.2c.3 19.3-9.6 33.3-22.9 41.6c-7.7 4.8-16.4 7.6-25.1 9.1V440c0 8.8-7.2 16-16 16s-16-7.2-16-16V422.2c-11.2-2.1-21.7-5.7-30.9-8.9l0 0c-2.1-.7-4.2-1.4-6.2-2.1c-8.4-2.8-12.9-11.9-10.1-20.2s11.9-12.9 20.2-10.1c2.5 .8 4.8 1.6 7.1 2.4l0 0 0 0 0 0c13.6 4.6 24.6 8.4 36.3 8.7c9.1 .3 17.9-1.7 23.7-5.3c5.1-3.2 7.9-7.3 7.8-14c-.1-4.6-1.8-7.8-7.7-11.6c-6.8-4.3-16.5-7.4-29-11.2l-1.6-.5 0 0c-11-3.3-24.3-7.3-34.8-13.7c-12-7.2-22.6-18.9-22.7-37.3c-.1-19.4 10.8-32.8 23.8-40.5c7.5-4.4 15.8-7.2 24.1-8.7V232c0-8.8 7.2-16 16-16z"/></svg>
                            <span>Invoice</span>
                        </a>
                    </li>
                    <% if (session.getAttribute("sidebar-list") != null && (session.getAttribute("sidebar-list").equals("Account") || session.getAttribute("sidebar-list").equals("Profile"))) { %>
                    <li class="sidebar-list-item active">
                        <% } else { %>
                    <li class="sidebar-list-item">
                        <% }%>
                        <a href="Admin?sidebar-list=Account">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 640 512" fill="#ffffff"><path d="M144 0a80 80 0 1 1 0 160A80 80 0 1 1 144 0zM512 0a80 80 0 1 1 0 160A80 80 0 1 1 512 0zM0 298.7C0 239.8 47.8 192 106.7 192h42.7c15.9 0 31 3.5 44.6 9.7c-1.3 7.2-1.9 14.7-1.9 22.3c0 38.2 16.8 72.5 43.3 96c-.2 0-.4 0-.7 0H21.3C9.6 320 0 310.4 0 298.7zM405.3 320c-.2 0-.4 0-.7 0c26.6-23.5 43.3-57.8 43.3-96c0-7.6-.7-15-1.9-22.3c13.6-6.3 28.7-9.7 44.6-9.7h42.7C592.2 192 640 239.8 640 298.7c0 11.8-9.6 21.3-21.3 21.3H405.3zM224 224a96 96 0 1 1 192 0 96 96 0 1 1 -192 0zM128 485.3C128 411.7 187.7 352 261.3 352H378.7C452.3 352 512 411.7 512 485.3c0 14.7-11.9 26.7-26.7 26.7H154.7c-14.7 0-26.7-11.9-26.7-26.7z"/></svg>
                            <span>Account</span>
                        </a>
                    </li>
                </ul>
                <div class="account-info" style="background: aqua">
                    <div class="account-info-picture">
                        <img src="img/user.png" alt="Account" style="background: red">
                    </div>
                    <div class="account-info-name" style="color: black">${user.name}</div>
                    <a href="Admin?sidebar-list=Profile" class="account-info-more" style="color: black">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal"><circle cx="12" cy="12" r="1"/><circle cx="19" cy="12" r="1"/><circle cx="5" cy="12" r="1"/></svg>
                    </a>
                </div>
            </div>
            <% if (session.getAttribute("sidebar-list") == null || session.getAttribute("sidebar-list").equals("Products")) {%>           
            <%@include file="admin_products.jsp" %>
            <% } else if (session.getAttribute("sidebar-list").equals("Promotion")) {%>
            <%@include file="admin_discounts.jsp" %>
            <% } else if (session.getAttribute("sidebar-list").equals("Sales")) {%>
            <%@include file="admin_sales.jsp" %>
            <% } else if (session.getAttribute("sidebar-list").equals("Invoice")) {%>
            <%@include file="admin_invoice.jsp" %>
            <% } else if (session.getAttribute("sidebar-list").equals("Account")) {%>
            <%@include file="admin_account.jsp" %>
            <% } else if (session.getAttribute("sidebar-list").equals("Comment")) {%>
            <%@include file="admin_comment.jsp" %>
            <% } else if (session.getAttribute("sidebar-list").equals("Profile")) {%>
            <%@include file="admin_card_profile.jsp" %>
            <% }%>
        </div>
        <script src="js/Admin.js"></script>
    </body>
</html>
