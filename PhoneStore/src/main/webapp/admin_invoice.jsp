<%-- 
    Document   : admin_invoice
    Created on : Nov 5, 2023, 9:07:10 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
    <link rel="stylesheet" href="styles/ad_invoice.css">
    <link rel="stylesheet" href="styles/ad_comment.css">
    <link rel="stylesheet" href="styles/Admin.css">

    <div class="app-content">
        <div class="app-content-header">
            <h1 class="app-content-headerText"><i class="fa-brands fa-shopify"></i> INVOICES <i class="fa-solid fa-receipt"></i></h1>
        </div>
        <div class= "card-container">
            <c:forEach var="item" items="${invoices}">
                <div class="card" style="height: 250px">
                    <div class="panel panel-default panel-signing">
                        <div class="panel-heading">
                            <form class="signing-remove" action="AdminInvoice" method="post">
                                <button class="glyphicon glyphicon-remove-circle"></button>
                                <input type="hidden" name="invoiceID" value="${item.invoiceID}"/>
                                <input type="hidden" name="ManageInvoices" value="remove"/>
                            </form><!-- /.signing-remove -->

                            <div class="signing-name"><a href="#signingModal" data-toggle="modal">Invoice ${item.invoiceID}</a></div><!-- /.signing-name -->
                        </div><!-- /.panel-heading -->

                        <div class="signing-info text-center">
                            <div class="signing-date"><a data-toggle="modal"><span class="glyphicon glyphicon-calendar"></span> ${item.dateCreate}</a></div>
                            <c:choose>
                                <c:when test="${item.status == true}">
                                    <div class="signing-time" style="color: blue;"><i class="fa-solid fa-check"></i>  Sent</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="signing-time" style="color: red;"><i class="fa-solid fa-xmark"></i>  Not sent</div>
                                </c:otherwise>
                            </c:choose>
                        </div><!-- /.signing-info -->

                        <button class="btn btn-default btn-block btn-signing-details text-uppercase" type="button" data-toggle="collapse" data-target="#signing-details-${item.invoiceID}" aria-expanded="false" aria-controls="signing-details-${item.invoiceID}">
                            <span class="glyphicon glyphicon-menu-down"></span> More Details
                        </button><!-- /.btn -->

                        <div id="signing-details-${item.invoiceID}" class="signing-details-collapse collapse" >
                            <div class="panel-body panel-signing-details">
                                <dl class="dl-bordered dl-no-margin">
                                    <c:forEach var="lineItem" items="${item.cart.lslineItems}">
                                        <dt>Product: ${lineItem.item.name}</dt>
                                        <dd>Quanlity: ${lineItem.quanlity}</dd>
                                        <dd>Price: $${lineItem.item.price}</dd>
                                    </c:forEach>
                                    <dt>Discount</dt>
                                    <dd>${item.discount.discount}%</dd>
                                    <dt>Amount</dt>
                                    <dd>$${item.totalInvoice}</dd>
                                    <dt>Payment Method</dt>
                                    <dd>${item.payMethod.method}</dd>
                                    <dt>Invoice Number</dt>
                                    <dd><a href="#createInvoiceModal" data-toggle="modal">${item.invoiceID}</a></dd>
                                </dl>
                            </div>
                        </div>

                        <div class="panel-body">
                            <dl class="dl-bordered dl-no-margin">
                                <dt>Location </dt>
                                <dd>${item.cart.customer.address}</dd>
                                <dt>Customer: </dt>
                                <dd>${item.cart.customer.name}</dd>
                            </dl>
                        </div>

                        <div class="panel-footer">
                            <div class="text-uppercase"><a href="AdminInvoice?ManageInvoices=sent&amp;invoiceID=<c:out value="${item.invoiceID}"></c:out>" data-toggle="modal"><span class="glyphicon glyphicon-edit" title="Edit Signing"></span> send confirm</a></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
    <script  src="js/ad_invoice.js"></script>

</html>
