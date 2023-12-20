/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package MobileStore.Servlet.Customer;

import MobileStore.DB.CartDB;
import MobileStore.DB.LineItemDB;
import MobileStore.DB.ProductDB;
import MobileStore.data.Cart;
import MobileStore.data.Invoice;
import MobileStore.data.LineItem;
import MobileStore.data.Product;
import MobileStore.data.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
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
public class CustomerCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = "/customer_cart.jsp";
        HttpSession session = request.getSession();
        String change_cart = request.getParameter("change_cart");
        Cart cart = (Cart) session.getAttribute("cart");
        if (change_cart!= null && change_cart.equals("remove")) {
            String lineItemID = request.getParameter("lineItemID");
            List<LineItem> lsln = cart.getLslineItems();
            LineItem ln_save = null;
            for (LineItem ln : lsln) {
                if (ln.getId().equals(Long.valueOf(lineItemID))) {
                    lsln.remove(ln);
                    ln_save = ln;
                    break;
                }
            }
            cart.setLslineItems(lsln);
            cart.calculateTotalPrice();
            CartDB.update(cart);
            LineItemDB.delete(ln_save);
            session.setAttribute("cart", cart);
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String change_cart = request.getParameter("change_cart");
        if (change_cart!= null && change_cart.equals("add")) {
            try {
                add_to_cart(request, response);
                return;
            } catch (SQLException ex) {
                Logger.getLogger(CustomerCartServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (change_cart!= null && change_cart.equals("update")) {
            update_cart(request, response);
            return;
        }
        getServletContext().getRequestDispatcher("/customer_cart.jsp").forward(request, response);
    }

    private void add_to_cart(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException, SQLException {
        String url = "/customer_cart.jsp";
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            Cart cart = (Cart) session.getAttribute("cart");
            String productCode = request.getParameter("productCode");
            Product product = ProductDB.selectIDProduct(productCode);
            boolean test_add = false;
            List<LineItem> lsln = cart.getLslineItems();
            List<LineItem> lslnUpdate = new ArrayList<>();
            for (LineItem ln : lsln) {
                if (Objects.equals(ln.getItem().getProductID(), product.getProductID())) {
                    ln.setQuanlity(ln.getQuanlity() + 1);
                    test_add = true;
                }
                lslnUpdate.add(ln);
            }
            System.out.println(product.getName() + " " + test_add);
            if (test_add == false) {
                LineItem ln = new LineItem(product, 1);
                lslnUpdate.add(ln);
                for (LineItem l : lslnUpdate) {
                    System.out.println(l.getItem().getName() + " " + l.getQuanlity());
                }
            }
            cart.setLslineItems(lslnUpdate);
            cart.calculateTotalPrice();
            CartDB.update(cart);
            cart = CartDB.selectIDCart(cart.getCartID().toString());
            session.setAttribute("cart", cart);
        }else{
            url = "/Login.jsp";
        }
        response.sendRedirect("" + url);
    }

    private void update_cart(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ServletException, IOException {
        String url = "/customer_cart.jsp";
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        LineItem ln_save = null;

        String lineItemID = request.getParameter("lineItemID");
        List<LineItem> lsln = cart.getLslineItems();
        String quanlity = request.getParameter("quanlity");

        if (Integer.parseInt(quanlity) != 0) {
            for (LineItem ln : lsln) {
                if (Objects.equals(ln.getId(), Long.valueOf(lineItemID))) {
                    ln.setQuanlity(Integer.parseInt(quanlity));
                    break;
                }
            }
            cart.setLslineItems(lsln);
        } else {
            for (LineItem ln : lsln) {
                if (Objects.equals(ln.getId(), Long.valueOf(lineItemID))) {
                    lsln.remove(ln);
                    ln_save = ln;
                    break;
                }
            }
            cart.setLslineItems(lsln);
        }
        cart.calculateTotalPrice();
        CartDB.update(cart);
        if (ln_save != null) {
            LineItemDB.delete(ln_save);
        }
        session.setAttribute("cart", cart);
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

}
