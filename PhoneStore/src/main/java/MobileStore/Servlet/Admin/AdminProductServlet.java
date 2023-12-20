/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package MobileStore.Servlet.Admin;

import MobileStore.DB.CartDB;
import MobileStore.DB.InvoiceDB;
import MobileStore.DB.LineItemDB;
import MobileStore.DB.ProductDB;
import MobileStore.data.Cart;
import MobileStore.data.Invoice;
import MobileStore.data.Product;
import MobileStore.data.User;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author DELL
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50)
public class AdminProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String url = "/Admin.jsp";
        HttpSession session = request.getSession();
        String ManageProducts = request.getParameter("ManageProducts");
        System.out.println(ManageProducts);
        User user = (User) session.getAttribute("user");
        if (user != null && user.getIsManager() && ManageProducts != null && ManageProducts.equals("remove")) {
            request.setAttribute("ManageProducts", ManageProducts);
            String IDUpdate = request.getParameter("productID");
            Product product = ProductDB.selectIDProduct(IDUpdate);

            List<Cart> lsCart = CartDB.selectByProduct(product);
            if (lsCart == null || lsCart.isEmpty()) {
                ProductDB.delete(product);
            } else {
                String strInvoices = "";
                for (Cart cart : lsCart) {
                    Invoice invoice = InvoiceDB.selectByCart(cart);
                    if (invoice != null) {
                        strInvoices += " Invoice " + invoice.getInvoiceID() + ", ";
                    }
                }

                if (strInvoices.equals("")) {
                    String message = "Currently the product cannot be deleted, please disable the product - " + product.getName();
                    request.setAttribute("message", message);
                } else {
                    String message = "Please disable product or delete " + strInvoices + "before deleting this product - " + product.getName();
                    request.setAttribute("message", message);
                }
            }

            List<Product> products = ProductDB.selectAllProduct();
            session.setAttribute("products", products);
        } else if (ManageProducts != null && ManageProducts.equals("filter")) {
            request.setAttribute("ManageProducts", ManageProducts);
            String done = request.getParameter("done");
            if (done.equals("rest")) {
                request.setAttribute("filter_Category", "all");
                request.setAttribute("filter_Status", "all");
                List<Product> products = ProductDB.selectAllProduct();
                session.setAttribute("products", products);
            }
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String url = "/Admin.jsp";
        HttpSession session = request.getSession();
        String ManageProducts = request.getParameter("ManageProducts");
        if (ManageProducts != null) {
            request.setAttribute("ManageProducts", ManageProducts);
            if (ManageProducts.equals("update") || ManageProducts.equals("add")) {
                String IDUpdate = request.getParameter("productID");
                String name = request.getParameter("ProductName");
                String type = request.getParameter("ProductType");
                String status_str = request.getParameter("status");
                Boolean status = false;
                if (status_str.equals("active")) {
                    status = true;
                }
                String sales = request.getParameter("sales");
                String stock = request.getParameter("stock");
                String price = request.getParameter("price");
                String information = request.getParameter("information");
                Part part = request.getPart("image");
                String realPath = request.getServletContext().getRealPath("/img");
                String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
                Product product;

                if (!Files.exists(Path.of(realPath))) {
                    Files.createDirectories(Path.of(realPath));
                }
                if (filename != null && !filename.trim().isEmpty()) {
                    part.write(realPath + "/" + filename);
                    filename = "img/" + filename;
                } else {
                    if (ManageProducts.equals("update")) {
                        Product p = ProductDB.selectIDProduct(IDUpdate);
                        filename = p.getImage();
                    } else if (ManageProducts.equals("add")) {
                        filename = "img/phone.jpg";
                    }
                }

                if (ManageProducts.equals("update")) {
                    product = new Product(Long.valueOf(IDUpdate), name, status, type, Integer.parseInt(sales), Integer.parseInt(stock), information, Float.valueOf(price), filename);
                    ProductDB.update(product);
                } else {
                    try {
                        product = new Product(name, status, type, Integer.parseInt(sales), Integer.parseInt(stock), information, Float.valueOf(price), filename);
                        ProductDB.insert(product);
                    } catch (SQLException ex) {
                        Logger.getLogger(AdminDiscountServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                List<Product> products = ProductDB.selectAllProduct();
                session.setAttribute("products", products);
                System.out.println(request.getParameter("image"));
            } else if (ManageProducts.equals("filter")) {
                String done = request.getParameter("done");
                if (done.equals("apply")) {
                    String filter_Category = request.getParameter("filter_Category");
                    String filter_Status = request.getParameter("filter_Status");
                    Boolean status = null;
                    if (filter_Status.equals("Active")) {
                        status = true;
                    } else if (filter_Status.equals("Disabled")) {
                        status = false;
                    }
                    List<Product> products = ProductDB.selectAllProduct();
                    List<Product> products_update = new ArrayList<>();
                    if (status != null && !filter_Category.equals("all")) {
                        for (Product p : products) {
                            if (Objects.equals(p.getStatus(), status) && p.getType().equals(filter_Category)) {
                                products_update.add(p);
                            }
                        }
                    } else if (status != null) {
                        for (Product p : products) {
                            if (Objects.equals(p.getStatus(), status)) {
                                products_update.add(p);
                            }
                        }
                    } else if (!filter_Category.equals("all")) {
                        for (Product p : products) {
                            if (p.getType().equals(filter_Category)) {
                                products_update.add(p);
                            }
                        }
                    }else{
                        products_update = products;
                    }
                    request.setAttribute("filter_Category", filter_Category);
                    request.setAttribute("filter_Status", filter_Status);
                    session.setAttribute("products", products_update);
                }
            }

        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}
