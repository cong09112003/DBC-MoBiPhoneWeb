/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package MobileStore.Servlet.Admin;

import MobileStore.DB.AccountDB;
import MobileStore.DB.CommentDB;
import MobileStore.DB.DiscountDB;
import MobileStore.DB.InvoiceDB;
import MobileStore.DB.ProductDB;
import MobileStore.data.Account;
import MobileStore.data.Comment;
import MobileStore.data.Discount;
import MobileStore.data.Invoice;
import MobileStore.data.LineItem;
import MobileStore.data.Product;
import MobileStore.data.Statistic;
import MobileStore.data.User;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class AdminServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = "/Admin.jsp";
        String sidebar_list = request.getParameter("sidebar-list");
        HttpSession session = request.getSession();
        session.setAttribute("sidebar-list", sidebar_list);
        User user = (User) session.getAttribute("user");
        if (user != null && user.getIsManager()) {
            if (sidebar_list.equals("Promotion")) {
                List<Discount> discounts = DiscountDB.selectAllDiscount();
                session.setAttribute("discounts", discounts);
            } else if (sidebar_list.equals("Products")) {
                List<Product> products = ProductDB.selectAllProduct();
                session.setAttribute("products", products);
            } else if (sidebar_list.equals("Account")) {
                List<Account> accounts = AccountDB.selectAllAccount();
                session.setAttribute("accounts", accounts);
            } else if (sidebar_list.equals("Comment")) {
                String productID = request.getParameter("productID");
                List<Comment> lsComment = CommentDB.selectComment(productID);
                session.setAttribute("comments", lsComment);
            } else if (sidebar_list.equals("Invoice")) {
                List<Invoice> invoices = InvoiceDB.selectAllInvoice();
                session.setAttribute("invoices", invoices);
            } else if (sidebar_list.equals("Sales")) {
                Date now = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String formattedDate = dateFormat.format(now);

                request.setAttribute("date_start", formattedDate);
                request.setAttribute("date_end", formattedDate);
                List<Invoice> invoices = InvoiceDB.selectAllInvoice();
                float totalSales = 0;
                int totalProduct = 0;
                for (Invoice in : invoices) {
                    if (dateFormat.format(in.getDateCreate()).equals(formattedDate)) {
                        totalSales = totalSales + in.getTotalInvoice();
                        for (LineItem li : in.getCart().getLslineItems()) {
                            totalProduct = totalProduct + li.getQuanlity();
                        }
                    }
                }
                List<Statistic> statistics = new ArrayList<>();
                statistics.add(new Statistic(formattedDate, totalSales, totalProduct));
                request.setAttribute("statistics", statistics);
            }
        } else{
            url = "/Login.jsp";
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
