<%-- 
    Document   : admin_discount
    Created on : Nov 3, 2023, 2:45:14 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="app-content">
        <div class="app-content-header">
            <h1 class="app-content-headerText"><i class="fa-solid fa-bolt"></i> DISCOUNT <i class="fa-solid fa-tags"></i></h1>
            <form action="AdminDiscount" method="post">
                <button class="app-content-headerButton">Add Discount</button>
                <input type="hidden" name="ManageDiscounts" value="open_add"/>
            </form>
        </div>
        <div class="app-content-actions">
            <form action="AdminDiscount" method="post">
                <button class="app-content-headerButton">Update</button>
                <span style="color: yellow;">${message}</span>
                <input type="hidden" name="ManageDiscounts" value="open_update"/>
            </form>
            <div class="app-content-actions-wrapper jsFilter">
                <button class="action-button list active" title="List View">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list"><line x1="8" y1="6" x2="21" y2="6"/><line x1="8" y1="12" x2="21" y2="12"/><line x1="8" y1="18" x2="21" y2="18"/><line x1="3" y1="6" x2="3.01" y2="6"/><line x1="3" y1="12" x2="3.01" y2="12"/><line x1="3" y1="18" x2="3.01" y2="18"/></svg>
                </button>
                <button class="action-button grid" title="Grid View">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
                </button>
            </div>
        </div>
        <div class="products-area-wrapper tableView">
            <div class="products-header">
                <div class="product-cell image">
                    Items
                    <button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
                    </button>
                </div>
                <div class="product-cell sales">Discount<button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
                    </button></div>
                <div class="product-cell stock">Start Date<button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
                    </button></div>
                <div class="product-cell price">End Date<button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
                    </button></div>
                <div class="product-cell update">Update</div>
                <div class="product-cell remove">Remove</div>
            </div>

            <c:forEach var="item" items="${discounts}">
                <form class="products-row" action="AdminDiscount" method="post">
                    <button class="cell-more-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical"><circle cx="12" cy="12" r="1"/><circle cx="12" cy="5" r="1"/><circle cx="12" cy="19" r="1"/></svg>
                    </button>
                    <%if (request.getAttribute("ManageDiscounts") != null && request.getAttribute("ManageDiscounts").equals("open_update")) { %>
                    <div class="product-cell image">
                        <img src="img/discount.jpg" alt="Discount">
                        <span><input placeholder="Name..." type="text" name="DiscountName" value="${item.name}" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);"></span>
                    </div>
                    <div class="product-cell sales"><span class="cell-label">Discount:</span>
                        <select placeholder="Discount..." name="Discount" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);">

                            <option value="10" ${item.discount == 10 ? 'selected' : ''}>10%</option>
                            <option value="20" ${item.discount == 20 ? 'selected' : ''}>20%</option>
                            <option value="30" ${item.discount == 30 ? 'selected' : ''}>30%</option>
                            <option value="40" ${item.discount == 40 ? 'selected' : ''}>40%</option>
                            <option value="50" ${item.discount == 50 ? 'selected' : ''}>50%</option>
                        </select>
                    </div>
                    <div class="product-cell stock"><span class="cell-label">Start Date:</span><input placeholder="Start Date..." type="date" name="start_date" value="${item.dateStart}" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);"></div>
                    <div class="product-cell price"><span class="cell-label">End Date:</span><input placeholder="End Date..." type="date" name="end_date" value="${item.dateEnd}" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);"></div>
                    <div class="product-cell update">
                        <span class="cell-label">Update:</span>
                        <button class="sort-button"><i class="fa-solid fa-pen-to-square"></i></button>
                        <input type="hidden" name="ManageDiscounts" value="update"/>
                    </div>
                    <% } else {%>
                    <div class="product-cell image">
                        <img src="img/discount.jpg" alt="Discount">
                        <span>${item.name}</span>
                    </div>
                    <div class="product-cell sales"><span class="cell-label">Discount:</span>${item.discount}%</div>
                    <div class="product-cell stock"><span class="cell-label">Start Date:</span>${item.dateStart}</div>
                    <div class="product-cell price"><span class="cell-label">End Date:</span>${item.dateEnd}</div>
                    <div class="product-cell update">
                        <span class="cell-label">Update:</span>
                        <button class="sort-button"><i class="fa-solid fa-pen-to-square"></i></button>
                        <input type="hidden" name="ManageDiscounts" value="open_update"/>
                    </div>
                    <% }%>
                    <input type="hidden" name="discountID" value="${item.discountID}"/>
                    <a class="product-cell remove" href="AdminDiscount?ManageDiscounts=remove&amp;discountID=<c:out value="${item.discountID}"/>" style="text-decoration: none;" class="product-cell remove"><span class="cell-label">Remove:</span><span class="sort-button">
                            <i class="fa-solid fa-trash"></i> 
                        </span></a>
                </form>
            </c:forEach>
            <%if (request.getAttribute("ManageDiscounts") != null && request.getAttribute("ManageDiscounts").equals("open_add")) { %>
            <form action="AdminDiscount" method="post" class="products-row">
                <button class="cell-more-button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical"><circle cx="12" cy="12" r="1"/><circle cx="12" cy="5" r="1"/><circle cx="12" cy="19" r="1"/></svg>
                </button>
                <div class="product-cell image">
                    <span><input placeholder="Name..." type="text" name="DiscountName" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);"></span>
                </div>
                <div class="product-cell sales"><span class="cell-label">Discount:</span>
                    <select placeholder="Discount..." name="Discount" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);">
                        <option value="10">10%</option>
                        <option value="20">20%</option>
                        <option value="30">30%</option>
                        <option value="40">40%</option>
                        <option value="50">50%</option>
                    </select>
                </div>

                <div class="product-cell stock"><span class="cell-label">Start Date:</span><input placeholder="Start Date..." type="date" name="start_date" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);"></div>
                <div class="product-cell price"><span class="cell-label">End Date:</span><input placeholder="End Date..." type="date" name="end_date" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);"></div>
                <div class="product-cell update" style="text-decoration: none;"><span class="cell-label">Confirm:</span><button class="sort-button">
                        CONFIRM
                    </button></div>
                <input type="hidden" name="ManageDiscounts" value="add"/>
                <a class="product-cell remove" href="Admin.jsp" style="text-decoration: none;" class="product-cell remove"><span class="cell-label">Remove:</span><span class="sort-button">
                        <i class="fa-solid fa-trash"></i> 
                    </span></a>
            </form>
            <% }%>
        </div>
    </div>
</html>
