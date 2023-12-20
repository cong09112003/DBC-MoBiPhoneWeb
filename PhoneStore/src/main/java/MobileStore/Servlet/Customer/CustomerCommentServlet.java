/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package MobileStore.Servlet.Customer;

import MobileStore.DB.CommentDB;
import MobileStore.DB.ProductDB;
import MobileStore.data.Cart;
import MobileStore.data.Comment;
import MobileStore.data.Product;
import MobileStore.data.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class CustomerCommentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = "/customer_comment.jsp";
        HttpSession session = request.getSession();
        String add_comment = request.getParameter("add_comment");
        User user = (User) session.getAttribute("user");
        if(add_comment != null && add_comment.equals("add")){
            String productID = request.getParameter("productID");
            String cmt = request.getParameter("comment");
            String rate = request.getParameter("rate");
            Product product = ProductDB.selectIDProduct(productID);
            Comment comment = new Comment(product, Float.valueOf(rate), cmt, user);
            try {
                CommentDB.insert(comment);
                List<Product>  lsProduct_cmt = (List<Product>) session.getAttribute("lsProduct_cmt");
                for(Product p : lsProduct_cmt){
                    if(p.getProductID().equals(product.getProductID())){
                        lsProduct_cmt.remove(p);
                        break;
                    }
                }
                session.setAttribute("lsProduct_cmt", lsProduct_cmt);
            } catch (SQLException ex) {
                Logger.getLogger(CustomerCommentServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}
