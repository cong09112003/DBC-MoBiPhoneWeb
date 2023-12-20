/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package MobileStore.Servlet.Admin;

import MobileStore.DB.CartDB;
import MobileStore.DB.InvoiceDB;
import MobileStore.data.Invoice;
import MobileStore.data.LineItem;
import MobileStore.data.User;
import MobileStore.util.MailUtilGmail;
import java.io.IOException;
import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class AdminInvoiceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String url = "/Admin.jsp";
        String ManageInvoices = request.getParameter("ManageInvoices");
        User user = (User) session.getAttribute("user");
        if (user != null && user.getIsManager() && ManageInvoices != null && ManageInvoices.equals("sent")) {
            String invoiceID = request.getParameter("invoiceID");
            Invoice invoice = InvoiceDB.selectIDInvoice(invoiceID);
            // send email to user
            String to = invoice.getCart().getCustomer().getEmail();
            String from = "nguyenthanhloi260303@gmail.com";
            String subject = "Confirm Invoice of you";
            String detail = "";
            detail += "Customer: " + invoice.getCart().getCustomer().getName() + "\n";
            detail += "Location: " + invoice.getCart().getCustomer().getAddress() + "\n\n";
            for (LineItem li : invoice.getCart().getLslineItems()) {
                detail += "Product: " + li.getItem().getName() + "\n";
                detail += "Quanlity: " + li.getQuanlity() + "\n";
                detail += "Price: $" + li.getItem().getPrice() + "\n";
            }
            if (invoice.getDiscount() != null) {
                detail += "\nDiscount: " + invoice.getDiscount().getDiscount() + "%\n";
            }
            detail += "Amount: $" + invoice.getTotalInvoice() + "\n";
            detail += "Payment Method: " + invoice.getPayMethod().getMethod() + "\n";

            String body = "Dear " + invoice.getCart().getCustomer().getName() + ",\n\n"
                    + "Your invoice has been confirmed by us, below are your invoice details:" + "\n"
                    + detail
                    + "Thank you customers for trusting and purchasing our products." + "\n"
                    + "Thanh Loi\n"
                    + "Mobile Store";
            boolean isBodyHTML = false;
            try {
                MailUtilGmail.sendMail(to, from, subject, body, isBodyHTML);
                invoice.setStatus(true);
                InvoiceDB.update(invoice);
            } catch (MessagingException e) {
                String errorMessage
                        = "ERROR: Unable to send email. "
                        + "Check Tomcat logs for details.<br>"
                        + "ERROR MESSAGE: " + e.getMessage();
                request.setAttribute("message", errorMessage);
                this.log(
                        "Unable to send email. \n"
                        + "Here is the email you tried to send: \n"
                        + "=====================================\n"
                        + "TO: " + invoice.getCart().getCustomer().getEmail() + "\n"
                        + "FROM: " + from + "\n"
                        + "SUBJECT: " + subject + "\n\n"
                        + body + "\n\n");
            }
            List<Invoice> invoices = InvoiceDB.selectAllInvoice();
            session.setAttribute("invoices", invoices);
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
        String ManageInvoices = request.getParameter("ManageInvoices");
        if (ManageInvoices != null && ManageInvoices.equals("remove")) {
            String invoiceID = request.getParameter("invoiceID");
            Invoice invoice = InvoiceDB.selectIDInvoice(invoiceID);
            InvoiceDB.delete(invoice);
            CartDB.delete(invoice.getCart());
            List<Invoice> invoices = InvoiceDB.selectAllInvoice();
            session.setAttribute("invoices", invoices);
        }

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

}
