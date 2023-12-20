/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package MobileStore.Servlet.Customer;

import MobileStore.DB.DiscountDB;
import MobileStore.data.Discount;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class CustomerDiscountServlet extends HttpServlet {

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
        String url = "/customer_Home.jsp";
        HttpSession session = request.getSession();
        //User user = (User)session.getAttribute("user");
        Discount discount_save = (Discount) session.getAttribute("discount_save");
        String done = request.getParameter("done");
        if (done != null && done.equals("change_discount")) {
            String discountID = request.getParameter("discountID");
            discount_save = DiscountDB.selectIDDiscount(discountID);
        }
        session.setAttribute("discount_save", discount_save);
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}
