<%-- 
    Document   : customer_invoice
    Created on : Dec 1, 2023, 12:51:57 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invoice</title>
        <link rel="stylesheet" href="styles/customer_invoice.css">
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css'>
        <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js'></script>
    </head>
    <body>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <%
            session.setAttribute("wn_Home", false);
            session.setAttribute("wn_Cart", true);
            session.setAttribute("wn_User", false);
            session.setAttribute("wn_InfShop", false);
            session.setAttribute("wn_Comment", false);
        %>
        <%@include file="customer_header.jsp" %>
        <div class="container mt-6 mb-7">
            <div class="row justify-content-center">
                <div class="col-lg-12 col-xl-7">
                    <div class="card">
                        <div class="card-body p-5">
                            <h2>
                                Hi ${user.name},
                            </h2>
                            <p class="fs-sm">
                                This is the receipt for a payment of <strong>${invoice.totalInvoice}</strong> (USD) you made to Mobile Store
                            </p>

                            <div class="border-top border-gray-200 pt-4 mt-4">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="text-muted mb-2">Payment No.</div>
                                        <strong>########</strong>
                                    </div>
                                    <div class="col-md-6 text-md-end">
                                        <div class="text-muted mb-2">Payment Date</div>
                                        <strong>${invoice.dateCreate}</strong>
                                    </div>
                                </div>
                            </div>

                            <div class="border-top border-gray-200 mt-4 py-4">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="text-muted mb-2">Client</div>
                                        <strong>
                                            ${user.name}
                                        </strong>
                                        <p class="fs-sm">
                                            ${user.address}
                                            <br>
                                            <a class="text-purple">${user.email}
                                            </a>
                                        </p>
                                    </div>
                                    <div class="col-md-6 text-md-end">
                                        <div class="text-muted mb-2">Payment To</div>
                                        <strong>
                                            Mobile Store
                                        </strong>
                                        <p class="fs-sm">
                                            Ho Chi Minh City University of Technology and Education
                                            <br>
                                            <a class="text-purple">nguyenthanhloi260303@gmail.com
                                            </a>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <table class="table border-bottom border-gray-200 mt-3">
                                <thead>
                                    <tr>
                                        <th scope="col" class="fs-sm text-dark text-uppercase-bold-sm px-0">Description</th>
                                        <th scope="col" class="fs-sm text-dark text-uppercase-bold-sm text-end px-0">Amount
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="lineItem" items="${invoice.cart.lslineItems}">
                                        <tr>
                                            <td class="px-0">${lineItem.item.name}</td>
                                            <td class="text-end px-0">$${lineItem.item.price} x ${lineItem.quanlity}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <div class="mt-5">
                                <div class="d-flex justify-content-end">
                                    <p class="text-muted me-3">Subtotal:</p>
                                    <span>$${invoice.cart.totalPrice}</span>
                                </div>
                                <div class="d-flex justify-content-end">
                                    <p class="text-muted me-3">Discount:</p>
                                    <span>- $${invoice.cart.totalPrice*invoice.discount.discount/100}</span>
                                </div>
                                <div class="d-flex justify-content-end">
                                    <p class="text-muted me-3">Pay Method</p>
                                    <span>${invoice.payMethod.method}</span>
                                </div>
                                <div class="d-flex justify-content-end mt-3">
                                    <h5 class="me-3">Total:</h5>
                                    <h5 class="text-success">$${invoice.totalInvoice} USD</h5>
                                </div>
                            </div>
                        </div>
                        <a href="CustomerCheckout"
                           class="btn btn-dark btn-lg card-footer-btn justify-content-center text-uppercase-bold-sm hover-lift-light">
                            <span class="svg-icon text-white me-2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="512" height="512" viewBox="0 0 512 512">
                                <title>ionicons-v5-g</title>
                                <path d="M336,208V113a80,80,0,0,0-160,0v95"
                                      style="fill:none;stroke:#000;stroke-linecap:round;stroke-linejoin:round;stroke-width:32px">
                                </path>
                                <rect x="96" y="208" width="320" height="272" rx="48" ry="48"
                                      style="fill:none;stroke:#000;stroke-linecap:round;stroke-linejoin:round;stroke-width:32px">
                                </rect>
                                </svg>
                            </span>
                            Pay Now
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
