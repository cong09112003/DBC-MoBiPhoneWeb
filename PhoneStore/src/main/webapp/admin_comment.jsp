<%-- 
    Document   : admin_comment
    Created on : Nov 6, 2023, 3:42:44 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300" rel="stylesheet">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css'>
    <link rel="stylesheet" href="styles/ad_comment.css">

    <div class="card-container">
        <c:forEach var="item" items="${comments}">
            <div class="card">
                <div class="card-image"></div>
                <div class="card-info">
                    <div class="card-title">${item.customer.name}</div>
                    <div class="card-detail">${item.review}</div>
                </div>
                <div class="card-social">
                    <ul>
                        <c:choose>
                            <c:when test="${item.star == 1}">
                                <li><i class="fa-solid fa-star"></i></li>
                            </c:when>
                            <c:when test="${item.star == 2}">
                            <li><i class="fa-solid fa-star"></i></li>
                            <li><i class="fa-solid fa-star"></i></li>
                            </c:when>
                            <c:when test="${item.star == 3}">
                            <li><i class="fa-solid fa-star"></i></li>
                            <li><i class="fa-solid fa-star"></i></li>
                            <li><i class="fa-solid fa-star"></i></li>
                            </c:when>
                            <c:when test="${item.star == 4}">
                            <li><i class="fa-solid fa-star"></i></li>
                            <li><i class="fa-solid fa-star"></i></li>
                            <li><i class="fa-solid fa-star"></i></li>
                            <li><i class="fa-solid fa-star"></i></li>
                            </c:when>
                            <c:when test="${item.star == 5}">
                            <li><i class="fa-solid fa-star"></i></li>
                            <li><i class="fa-solid fa-star"></i></li>
                            <li><i class="fa-solid fa-star"></i></li>
                            <li><i class="fa-solid fa-star"></i></li>
                            <li><i class="fa-solid fa-star"></i></li>
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </c:forEach>
    </div>
</html>
