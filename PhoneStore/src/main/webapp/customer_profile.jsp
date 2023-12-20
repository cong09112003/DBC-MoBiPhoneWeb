<%-- 
    Document   : customer_profile
    Created on : Dec 2, 2023, 8:58:58 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/customer_profile.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Profile</title>
    </head>
    <body>
        <%
            session.setAttribute("wn_Home", false);
            session.setAttribute("wn_Cart", false);
            session.setAttribute("wn_User", true);
            session.setAttribute("wn_InfShop", false);
            session.setAttribute("wn_Comment", false);
        %>
        <%@include file="customer_header.jsp" %>
        <section class="vh-100" style="background-color: #f4f5f7;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-6 mb-4 mb-lg-0">
                        <div class="card mb-3" style="border-radius: .5rem;">
                            <div class="row g-0">
                                <div class="col-md-4 gradient-custom text-center text-white"
                                     style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                    <img src="img/user.png"
                                         alt="Avatar" class="img-fluid my-5" style="width: 80px;" />
                                    <h5>${user.name}</h5>
                                    <p>Customer</p>
                                    <a href="Login.jsp" onclick="logoutFunction()" class="btn btn-light mt-3" style ="margin-bottom: 30px">Logout</a>

                                </div>
                                <div class="col-md-8">
                                    <div class="card-body p-4">
                                        <h6>INFORMATION   <i class="fa-regular fa-id-card"></i></h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Email</h6>
                                                <p class="text-muted" style="width: 500px">${user.email}</p>
                                            </div>
                                        </div>
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Address</h6>
                                                <p class="text-muted">${user.address}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Phone</h6>
                                                <p class="text-muted">${user.phonenumber}</p>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <style>
    .gradient-custom {
        /* Your existing styles for the container */
    }

    .gradient-custom a.btn {
        /* Button styles */
        display: inline-block;
        background-color: #007bff; /* Change to your preferred color */
        color: #fff; /* Text color */
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        text-decoration: none; /* Remove default underline */
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .gradient-custom a.btn:hover {
        background-color: #0056b3; /* Change to a darker shade for hover effect */
    }
</style>

    </body>
</html>
