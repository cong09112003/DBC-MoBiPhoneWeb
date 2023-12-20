/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package MobileStore.Servlet.Admin;

import MobileStore.DB.DiscountDB;
import MobileStore.DB.InvoiceDB;
import MobileStore.data.Discount;
import MobileStore.data.Invoice;
import MobileStore.data.User;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author DELL
 */
public class AdminDiscountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String url = "/Admin.jsp";
        HttpSession session = request.getSession();
        String ManageDiscounts = request.getParameter("ManageDiscounts");
        System.out.println(ManageDiscounts);
        User user = (User) session.getAttribute("user");
        if (user != null && user.getIsManager() && ManageDiscounts != null && ManageDiscounts.equals("remove")) {
            request.setAttribute("ManageDiscounts", ManageDiscounts);
            String IDUpdate = request.getParameter("discountID");
            Discount discount = DiscountDB.selectIDDiscount(IDUpdate);
            System.out.println(discount.getName());
            List<Invoice> invoices = InvoiceDB.selectByDiscount(discount);
            if (invoices == null || invoices.isEmpty()) {
                DiscountDB.delete(discount);
            } else {
                String message = "Please delete ";
                for (Invoice i : invoices) {
                    message += "Invoice " + i.getInvoiceID() + ", ";
                }
                message += "before deleting this discount - " + discount.getName();
                request.setAttribute("message", message);
            }
            List<Discount> discounts = DiscountDB.selectAllDiscount();
            session.setAttribute("discounts", discounts);
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
        String ManageDiscounts = request.getParameter("ManageDiscounts");
        if (ManageDiscounts != null) {
            request.setAttribute("ManageDiscounts", ManageDiscounts);
            if (ManageDiscounts.equals("update") || ManageDiscounts.equals("add")) {
                String IDUpdate = request.getParameter("discountID");
                String name = request.getParameter("DiscountName");
                String dis = request.getParameter("Discount");
                String date_start = request.getParameter("start_date");
                String end_date = request.getParameter("end_date");
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    Date start = dateFormat.parse(date_start);
                    Date end = dateFormat.parse(end_date);
                    if (date_start == null || end_date == null || date_start.isEmpty() || end_date.isEmpty() || end.compareTo(start) < 0) {
                        start = new Date();
                        end = new Date();
                    }
                    Discount discount = null;
                    System.out.println(IDUpdate + " " + name + " " + dis + " " + date_start + " " + end_date);
                    if (ManageDiscounts.equals("update")) {
                        discount = new Discount(Long.valueOf(IDUpdate), name, Integer.parseInt(dis), start, end);
                        DiscountDB.update(discount);
                    } else {
                        try {
                            discount = new Discount(name, Integer.parseInt(dis), start, end);
                            DiscountDB.insert(discount);
                        } catch (SQLException ex) {
                            Logger.getLogger(AdminDiscountServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                } catch (ParseException ex) {
                    Logger.getLogger(AdminDiscountServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            List<Discount> discounts = DiscountDB.selectAllDiscount();
            session.setAttribute("discounts", discounts);
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

}
