<%-- 
    Document   : admin_products
    Created on : Oct 30, 2023, 10:47:05 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <div class="app-content">
        <div class="app-content-header">
            <h1 class="app-content-headerText"><i class="fa-solid fa-shekel-sign"></i> PRODUCTS <i class="fa-solid fa-mobile-screen-button"></i></h1>
            <form action="AdminProduct" method="post">
                <button class="app-content-headerButton">Add Product</button>
                <input type="hidden" name="ManageProducts" value="open_add"/>
            </form>
        </div>
        <div class="app-content-actions">
            <span style="color: yellow;">${message}</span>
            <div class="app-content-actions-wrapper">
                <div class="filter-button-wrapper">
                    <button class="action-button filter jsFilter"><span>Filter</span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-filter"><polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"/></svg></button>
                    <form action="AdminProduct" method="post" class="filter-menu">
                        <label>Category</label>
                        <select name="filter_Category">
                            <option value="all" ${filter_Category == 'all' ? 'selected' : ''}>All Categories</option>
                            <option value="Iphone" ${filter_Category == 'Iphone' ? 'selected' : ''}>Iphone</option>                     
                            <option value="Samsung" ${filter_Category == 'Samsung' ? 'selected' : ''}>Samsung</option>
                            <option value="Realme" ${filter_Category == 'Realme' ? 'selected' : ''}>Realme</option>
                            <option value="Xiaomi" ${filter_Category == 'Xiaomi' ? 'selected' : ''}>Xiaomi</option>
                        </select>
                        <label>Status</label>
                        <select name="filter_Status">
                            <option value="all" ${filter_Status == 'all' ? 'selected' : ''}>All Status</option>
                            <option value="Active" ${filter_Status == 'Active' ? 'selected' : ''}>Active</option>
                            <option value="Disabled" ${filter_Status == 'Disabled' ? 'selected' : ''}>Disabled</option>
                        </select>
                        <div class="filter-menu-buttons">
                            <a href="AdminProduct?ManageProducts=filter&amp;done=rest" class="filter-button reset" style="text-decoration: none;">
                                Reset
                            </a>
                            <button class="filter-button apply">
                                Apply
                            </button>
                            <input type="hidden" name="ManageProducts" value="filter"/>
                            <input type="hidden" name="done" value="apply"/>
                        </div>
                    </form>
                </div>
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
                <div class="product-cell category">Category<button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
                    </button></div>
                <div class="product-cell status-cell">Status<button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
                    </button></div>
                <div class="product-cell sales">Sales<button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
                    </button></div>
                <div class="product-cell stock">Stock<button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
                    </button></div>
                <div class="product-cell price">Price<button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="currentColor" d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/></svg>
                    </button></div>
                <div class="product-cell update">Update</div>
                <div class="product-cell comment">Comment</div>
                <div class="product-cell remove">Remove</div>
            </div>
            <c:forEach var="item" items="${products}">
                <form action="AdminProduct" method="post" enctype="multipart/form-data">
                    <div class="products-row" action="AdminProduct" method="post" style="width: calc(100% - 16px);">
                        <button class="cell-more-button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical"><circle cx="12" cy="12" r="1"/><circle cx="12" cy="5" r="1"/><circle cx="12" cy="19" r="1"/></svg>
                        </button>
                        <%if (request.getAttribute("ManageProducts") != null && request.getAttribute("ManageProducts").equals("open_update")) { %>
                        <div class="product-cell image">
                            <span><input placeholder="Name..." type="text" name="ProductName" value="${item.name}" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);"></span>
                        </div>
                        <div class="product-cell category"><span class="cell-label">Category:</span>
                            <select placeholder="Category..." name="ProductType" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);">
                                <option value="Iphone" ${item.type == 'Iphone' ? 'selected' : ''}>Iphone</option>
                                <option value="Xiaomi" ${item.type == 'Xiaomi' ? 'selected' : ''}>Xiaomi</option>
                                <option value="Realme" ${item.type == 'Realme' ? 'selected' : ''}>Realme</option>
                                <option value="Samsung" ${item.type == 'Samsung' ? 'selected' : ''}>Samsung</option>
                            </select>
                        </div>

                        <div class="product-cell category"><span class="cell-label">Status:</span>
                            <select placeholder="Status..." name="status" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);">
                                <option value="active" ${item.status == true ? 'selected' : ''}>Active</option>
                                <option value="disabled" ${item.status == false ? 'selected' : ''}>Disabled</option>
                            </select>
                        </div>   
                        <div class="product-cell sales"><span class="cell-label">Sales:</span><input pattern="\d+" min ='0' placeholder="Sales..." type="number" name="sales" value="${item.sale}" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);" required></div>
                        <div class="product-cell stock"><span class="cell-label">Stock:</span><input pattern="\d+" min ='0' placeholder="Stock..." type="number" name="stock" value="${item.stock}" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);" required></div>
                        <div class="product-cell price"><span class="cell-label">Price:</span>$<input pattern="\d+" min ='0' placeholder="Price..." type="number" name="price" value="${item.price}" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);" required></div>
                        <div class="product-cell update" style="text-decoration: none;"><span class="cell-label">Update:</span><button class="sort-button">
                                <i class="fa-solid fa-pen-to-square"></i> 
                            </button></div>
                        <input type="hidden" name="ManageProducts" value="update"/>
                        <a href="Admin?sidebar-list=Comment&amp;productID=<c:out value="${item.productID}"/>" class="product-cell comment" style="text-decoration: none;"><span class="cell-label">Comment:</span>
                            <span class="sort-button">
                                <i class="fa-solid fa-comment-dots"></i> 
                            </span></a>
                            <% } else {%>
                        <div class="product-cell image">
                            <img src="${item.image}" alt="product">
                            <span>${item.name}</span>
                        </div>
                        <div class="product-cell category"><span class="cell-label">Category:</span>${item.type}</div>
                        <div class="product-cell status-cell">
                            <span class="cell-label">Status:</span>
                            <span class="status ${item.status == true ? 'active' : 'disabled'}">${item.status == true ? 'Active' : 'Disabled'}</span>
                        </div>
                        <div class="product-cell sales"><span class="cell-label">Sales:</span>${item.sale}</div>
                        <div class="product-cell stock"><span class="cell-label">Stock:</span>${item.stock}</div>
                        <div class="product-cell price"><span class="cell-label">Price:</span>$${item.price}</div>
                        <input type="hidden" name="ManageProducts" value="open_update"/>
                        <div class="product-cell update" style="text-decoration: none;"><span class="cell-label">Update:</span><button class="sort-button">
                                <i class="fa-solid fa-pen-to-square"></i> 
                            </button></div>
                        <a href="Admin?sidebar-list=Comment&amp;productID=<c:out value="${item.productID}"/>" class="product-cell comment" style="text-decoration: none;"><span class="cell-label">Comment:</span>
                            <span class="sort-button">
                                <i class="fa-solid fa-comment-dots"></i> 
                            </span></a>
                            <% }%>        
                        <input type="hidden" name="productID" value="${item.productID}"/>
                        <a href="AdminProduct?ManageProducts=remove&amp;productID=<c:out value="${item.productID}"/>" class="product-cell remove" style="text-decoration: none;"><span class="cell-label">Remove:</span>
                            <span class="sort-button">
                                <i class="fa-solid fa-trash"></i> 
                            </span></a>    
                    </div>
                    <%if (request.getAttribute("ManageProducts") != null && request.getAttribute("ManageProducts").equals("open_update")) { %>
                    <div class="products-row" style="width: calc(100% - 16px);">
                        <span style="font-size: 14px; margin-left:16px; border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);">
                            <i class="fa-solid fa-arrow-right"></i>  Information:</span>
                        <input placeholder="Information..." type="text" name="information" value="${item.information}" style="font-size: 14px; width: 700px;margin-left:16px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);">
                        <span class="product-cell comment" style="text-decoration: none;"><span>Image:</span>
                            <input class="sort-button" type="file" name= "image">
                        </span>
                    </div>
                    <% } %>
                </form>
            </c:forEach>

            <%if (request.getAttribute("ManageProducts") != null && request.getAttribute("ManageProducts").equals("open_add")) { %>
            <form action="AdminProduct" method="post" enctype="multipart/form-data">
                <div class="products-row" style="width: calc(100% - 16px);">
                    <button class="cell-more-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical"><circle cx="12" cy="12" r="1"/><circle cx="12" cy="5" r="1"/><circle cx="12" cy="19" r="1"/></svg>
                    </button>
                    <div class="product-cell image">
                        <span><input placeholder="Name..." type="text" name="ProductName" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);"></span>
                    </div>
                    <div class="product-cell category"><span class="cell-label">Category:</span>
                        <select placeholder="Category..." name="ProductType" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);">
                            <option value="Iphone">Iphone</option>
                            <option value="Xiaomi">Xiaomi</option>
                            <option value="Realme">Realme</option>
                            <option value="Samsung">Samsung</option>
                        </select>
                    </div>

                    <div class="product-cell category"><span class="cell-label">Status:</span>
                        <select placeholder="Status..." name="status" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);">
                            <option value="active">Active</option>
                            <option value="disabled">Disabled</option>
                        </select>
                    </div>   
                    <div class="product-cell sales"><span class="cell-label">Sales:</span><input pattern="\d+" min='0' placeholder="Sales..." type="number" name="sales" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);" required></div>
                    <div class="product-cell stock"><span class="cell-label">Stock:</span><input pattern="\d+" min='0' placeholder="Stock..." type="number" name="stock" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);" required></div>
                    <div class="product-cell price"><span class="cell-label">Price:</span>$<input pattern="\d+" min='0' placeholder="Price..." type="number" name="price" style="width: 100px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);" required></div>
                    <div class="product-cell update"><span class="cell-label">Confirm:</span><button class="sort-button">
                            CONFIRM
                        </button></div>
                    <a href="#" class="product-cell comment" style="text-decoration: none;"><span class="cell-label">Comment:</span>
                        <span class="sort-button">
                            <i class="fa-solid fa-comment-dots"></i> 
                        </span></a>
                    <input type="hidden" name="ManageProducts" value="add"/>
                    <a href="Admin.jsp" class="product-cell remove" style="text-decoration: none;"><span class="cell-label">Remove:</span>
                        <span class="sort-button">
                            <i class="fa-solid fa-trash"></i> 
                        </span>
                    </a>
                </div>
                <div class="products-row" style="width: calc(100% - 16px);">
                    <span style="font-size: 14px; margin-left:16px; border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);">
                        <i class="fa-solid fa-arrow-right"></i>  Information:</span>
                    <input placeholder="Information..." type="text" name="information" style="font-size: 14px; width: 700px;margin-left:16px;background-color: var(--app-content-secondary-color); border: 1px solid var(--app-content-secondary-color); color: var(--app-content-main-color);">
                    <div class="product-cell comment" style="text-decoration: none;"><span>Image:</span>
                        <input class="sort-button" type="file" name= "image" >
                    </div>
                </div>
            </form>
            <% }%>
        </div>
    </div>
</html>
