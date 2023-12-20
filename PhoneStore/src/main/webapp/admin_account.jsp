<%-- 
    Document   : admin_account
    Created on : Nov 6, 2023, 5:38:28 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <div class="app-content">
        <div class="app-content-header">
            <h1 class="app-content-headerText"><i class="fa-solid fa-address-card"></i> CUSTOMER <i class="fa-solid fa-key"></i></h1>
            <form action="AdminAccount" method="post">
                <button class="app-content-headerButton">Add Account</button>
                <input type="hidden" name="ManageAccounts" value="open_add"/>
            </form>
        </div>
        <div class="app-content-actions">
            <span style="color: yellow">${message}</span>
            <div class="app-content-actions-wrapper jsFilter">
                <button class="action-button list active" title="List View">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list"><line x1="8" y1="6" x2="21" y2="6"/><line x1="8" y1="12" x2="21" y2="12"/><line x1="8" y1="18" x2="21" y2="18"/><line x1="3" y1="6" x2="3.01" y2="6"/><line x1="3" y1="12" x2="3.01" y2="12"/><line x1="3" y1="18" x2="3.01" y2="18"/></svg>
                </button>
                <button class="action-button grid" id= "gridButton" title="Grid View">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
                </button>
                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        // Simulate a click on the "Grid View" button when the page loads
                        document.getElementById('gridButton').click();
                    });
                </script>
            </div>
        </div>
        <div class="products-area-wrapper tableView">
            <div class="products-header">
                <div class="product-cell user">
                    Username
                    <button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
                    </button>
                </div>
                <div class="product-cell name">Name<button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
                    </button></div>
                <div class="product-cell email">Email<button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
                    </button></div>
                <div class="product-cell address">Address<button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
                    </button></div>
                <div class="product-cell phone">Phone Number<button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
                    </button></div>
                <div class="product-cell reset">Reset Password</div>
                <div class="product-cell remove">Remove</div>
            </div>
            <c:forEach var="item" items="${accounts}">
                <c:if test="${item.user.isManager != true}">      
                    <div class="products-row">
                        <button class="cell-more-button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical"><circle cx="12" cy="12" r="1"/><circle cx="12" cy="5" r="1"/><circle cx="12" cy="19" r="1"/></svg>
                        </button>
                        <div class="product-cell image">
                            <img src="img/user.png" alt="user" style="background: white">
                            <span>${item.username}</span>
                        </div>
                        <div class="product-cell name"><span class="cell-label">Name:</span>${item.user.name}</div>
                        <div class="product-cell email"><span class="cell-label">Email:</span>${item.user.email}</div>
                        <div class="product-cell address"><span class="cell-label">Address:</span>${item.user.address}</div>
                        <div class="product-cell phone"><span class="cell-label">Phone:</span>${item.user.phonenumber}</div>
                        <form class="product-cell reset" action="AdminAccount" method="post"><span class="cell-label">Reset password:</span>
                            <button class="sort-button">
                                <i class="fa-solid fa-arrow-rotate-right"></i>
                            </button>
                            <input type="hidden" name="ManageAccounts" value="reset_password"/>
                            <input type="hidden" name="accountID" value="${item.id}"}/>
                        </form>
                        <a class="product-cell remove" href="AdminAccount?ManageAccounts=remove&amp;accountID=<c:out value="${item.id}"/>" style="text-decoration: none;" class="product-cell remove"><span class="cell-label">Remove:</span><span class="sort-button">
                                <i class="fa-solid fa-trash"></i> 
                            </span></a>
                    </div>
                </c:if>
            </c:forEach>
            <%if (request.getAttribute("ManageAccounts") != null && request.getAttribute("ManageAccounts").equals("open_add")) { %>
            <form action="AdminAccount" method="post" class="products-row">
                <button class="cell-more-button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical"><circle cx="12" cy="12" r="1"/><circle cx="12" cy="5" r="1"/><circle cx="12" cy="19" r="1"/></svg>
                </button>
                <div class="product-cell image">
                    <span><input placeholder="Username..." type="text" name="username" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);"></span>
                </div>
                <div class="product-cell name"><span class="cell-label">Name:</span>
                    <input placeholder="Name..." type="text" name="name" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);">
                </div>
                <div class="product-cell email"><span class="cell-label">Email:</span>
                    <input placeholder="Email..." type="email" name="email" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);">
                </div>
                <div class="product-cell address"><span class="cell-label">Address:</span>
                    <input placeholder="Address..." type="text" name="address" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);">
                </div>
                <div class="product-cell phone"><span class="cell-label">Phone:</span>
                    <input placeholder="Phone..." type="text" name="phone" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);">
                </div>
                <div class="product-cell update" style="text-decoration: none;"><span class="cell-label">Confirm:</span><button class="sort-button">
                        CONFIRM
                    </button></div>
                <input type="hidden" name="ManageAccounts" value="add"/>
                <a class="product-cell remove" href="Admin.jsp" style="text-decoration: none;" class="product-cell remove"><span class="cell-label">Remove:</span><span class="sort-button">
                        <i class="fa-solid fa-trash"></i> 
                    </span></a>
            </form>
            <% }%>
        </div>
    </div>
</html>
