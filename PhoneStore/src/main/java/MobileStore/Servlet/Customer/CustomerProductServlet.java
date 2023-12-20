/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package MobileStore.Servlet.Customer;

import MobileStore.DB.CommentDB;
import MobileStore.DB.ProductDB;
import MobileStore.data.Comment;
import MobileStore.data.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class CustomerProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String url = "/customer_products.jsp";
        String done = request.getParameter("done");

        if (done!= null && done.equals("show_product")) {
            String typeProduct = request.getParameter("typeProduct");
            List<Product> lsproduct = null;
            List<Product> lsproductupdate = new ArrayList<>();
            if (typeProduct != null && typeProduct.equals("all")) {
                request.setAttribute("TypeProduct", "ALL PHONES");
                lsproduct = ProductDB.selectAllProduct();
                for (Product p : lsproduct) {
                    if (p.getStatus() && p.getStock()>0) {
                        lsproductupdate.add(p);
                    }
                }
            } else if (typeProduct != null && typeProduct.equals("xiaomi")) {
                request.setAttribute("TypeProduct", "XIAOMI");
                lsproduct = ProductDB.selectByType("Xiaomi");
                for (Product p : lsproduct) {
                    if (p.getStatus() && p.getStock()>0) {
                        lsproductupdate.add(p);
                    }
                }
            } else if (typeProduct != null && typeProduct.equals("realme")) {
                request.setAttribute("TypeProduct", "REALME");
                lsproduct = ProductDB.selectByType("Realme");
                for (Product p : lsproduct) {
                    if (p.getStatus() && p.getStock()>0) {
                        lsproductupdate.add(p);
                    }
                }
            } else if (typeProduct != null && typeProduct.equals("iphone")) {
                request.setAttribute("TypeProduct", "IPHONE");
                lsproduct = ProductDB.selectByType("Iphone");
                for (Product p : lsproduct) {
                    if (p.getStatus() && p.getStock()>0) {
                        lsproductupdate.add(p);
                    }
                }
            } else if (typeProduct != null && typeProduct.equals("samsung")) {
                request.setAttribute("TypeProduct", "SAMSUNG");
                lsproduct = ProductDB.selectByType("Samsung");

                for (Product p : lsproduct) {
                    if (p.getStatus() && p.getStock()>0) {
                        lsproductupdate.add(p);
                    }
                }
            }
            session.setAttribute("products", lsproductupdate);
        } else if (done!= null && done.equals("details")) {
            String productCode = request.getParameter("productCode");
            Product product = ProductDB.selectIDProduct(productCode);
            List<Comment> comments = CommentDB.selectComment(productCode);
            double rating = 0;
            int count = 0;
            for (Comment c : comments) {
                rating += c.getStar();
                count++;
            }
            if (count == 0) {
                count = 1;
            }
            rating = rating / count;
            // Tạo một mẫu DecimalFormat với một chữ số thập phân
            DecimalFormat df = new DecimalFormat("#.#");

            // Sử dụng mẫu để làm tròn số
            double roundedrating = Double.parseDouble(df.format(rating));
            session.setAttribute("rating", roundedrating);
            session.setAttribute("product", product);
            session.setAttribute("comments", comments);
            url = "/customer_product_details.jsp";
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}
