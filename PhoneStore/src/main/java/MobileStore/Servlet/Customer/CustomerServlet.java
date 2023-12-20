/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package MobileStore.Servlet.Customer;

import MobileStore.DB.CartDB;
import MobileStore.DB.DiscountDB;
import MobileStore.DB.InvoiceDB;
import MobileStore.DB.UserDB;
import MobileStore.data.Cart;
import MobileStore.data.Discount;
import MobileStore.data.User;
import java.io.IOException;
import java.io.PrintWriter;
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
public class CustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = "/customer_Home.jsp";
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user != null) {
            Cart cart = null;
            List<Cart> carts = CartDB.selectCart(user.getID());
            for (Cart c : carts) {
                if (!InvoiceDB.cartExists(c)) {
                    cart = c;
                    break;
                }
            }
            if (cart == null) {
                cart = new Cart(user);
                CartDB.insert(cart);
            }
            session.setAttribute("cart", cart);
            List<Discount> discounts = DiscountDB.selectAllDiscount();
            List<Discount> discountsUpdate = new ArrayList<>();
            for (Discount d : discounts) {
                Date now = new Date();
                if (now.compareTo(d.getDateStart()) >= 0 && now.compareTo(d.getDateEnd()) <= 0) {
                    discountsUpdate.add(d);
                }
            }
            session.setAttribute("discounts", discountsUpdate);
        }else{
            url = "/Login.jsp";
        }

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
