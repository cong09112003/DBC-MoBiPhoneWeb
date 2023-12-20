/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package MobileStore.Servlet.Customer;

import MobileStore.DB.CartDB;
import MobileStore.DB.InvoiceDB;
import MobileStore.DB.PaymentMethodDB;
import MobileStore.data.Cart;
import MobileStore.data.Discount;
import MobileStore.data.Invoice;
import MobileStore.data.LineItem;
import MobileStore.data.PaymentMethod;
import MobileStore.data.Product;
import MobileStore.data.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class CustomerCheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = "/customer_thanks.jsp";
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Invoice invoice = (Invoice) session.getAttribute("invoice");
        if (invoice != null && user!=null) {
            try {
                InvoiceDB.insert(invoice);
                List<Product>  lsProduct_cmt = (List<Product>) session.getAttribute("lsProduct_cmt");
                if(lsProduct_cmt == null)
                    lsProduct_cmt = new ArrayList<>();
                for(LineItem ln : invoice.getCart().getLslineItems()){
                    if(!lsProduct_cmt.contains(ln.getItem())){
                       lsProduct_cmt.add(ln.getItem()); 
                    }
                }
                Cart cart = new Cart(user);
                CartDB.insert(cart);
                session.setAttribute("cart", cart);
                session.setAttribute("lsProduct_cmt", lsProduct_cmt);
            } catch (SQLException ex) {
                Logger.getLogger(CustomerCheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if(user==null){
            url = "/Login.jsp";
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = "/customer_invoice.jsp";
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");
        Discount discount = (Discount) session.getAttribute("discount_save");
        String method = request.getParameter("method");
        if (cart != null && user != null && method != null) {
            Invoice invoice;
            if (discount != null) {
                invoice = new Invoice(cart, discount, PaymentMethodDB.getMethodById(Long.parseLong(method)), Boolean.FALSE);
            } else {
                invoice = new Invoice(cart, PaymentMethodDB.getMethodById(Long.parseLong(method)), Boolean.FALSE);
            }
            session.setAttribute("invoice", invoice);
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}
