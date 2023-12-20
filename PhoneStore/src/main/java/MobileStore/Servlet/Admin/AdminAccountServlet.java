/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package MobileStore.Servlet.Admin;

import MobileStore.DB.AccountDB;
import MobileStore.DB.UserDB;
import MobileStore.data.Account;
import MobileStore.data.User;
import MobileStore.util.MailUtilGmail;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class AdminAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String url = "/Admin.jsp";
        String ManageAccounts = request.getParameter("ManageAccounts");
        User user = (User) session.getAttribute("user");
        if (user != null && user.getIsManager() && ManageAccounts != null && ManageAccounts.equals("remove")) {
            String IDAccount = request.getParameter("accountID");
            Account account = AccountDB.selectIDAccount(IDAccount);
            if (account != null) {
                AccountDB.delete(account);

                // send email to user
                String to = account.getUser().getEmail();
                String from = "huynhnguyenanhtri2003@gmail.com";
                String subject = "Notification of deleting your account";
                String body = "Dear " + account.getUser().getName() + ",\n\n"
                        + "Your account has been deleted by us. " + "\n"
                        + "If you need to log in, please register a new account before logging in" + "\n\n"
                        + "Thank you;\n"
                        + "Thanh Loi\n"
                        + "Mobile Store";
                boolean isBodyHTML = false;
                try {
                    MailUtilGmail.sendMail(to, from, subject, body, isBodyHTML);
                    String message = "Successful delete account of username: " + account.getUsername() + " !";
                    request.setAttribute("message", message);
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
                            + "TO: " + account.getUser().getEmail() + "\n"
                            + "FROM: " + from + "\n"
                            + "SUBJECT: " + subject + "\n\n"
                            + body + "\n\n");
                }
                List<Account> accounts = AccountDB.selectAllAccount();
                session.setAttribute("accounts", accounts);
            }
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String url = "/Admin.jsp";
        String ManageAccounts = request.getParameter("ManageAccounts");
        request.setAttribute("ManageAccounts", ManageAccounts);
        if (ManageAccounts != null && ManageAccounts.equals("reset_password")) {
            String IDAccount = request.getParameter("accountID");
            Account account = AccountDB.selectIDAccount(IDAccount);
            try {
                account.setPassword("123456789");
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(AdminAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            AccountDB.update(account);
            // send email to user
            String to = account.getUser().getEmail();
            String from = "nguyenthanhloi260303@gmail.com";
            String subject = "Reset password of you";
            String body = "Dear " + account.getUser().getName() + ",\n\n"
                    + "Your password has been reset by us. " + "\n"
                    + "Username: " + account.getUsername() + "\n"
                    + "Password: 123456789\n\n"
                    + "Thanh Loi\n"
                    + "Mobile Store";
            boolean isBodyHTML = false;
            try {
                MailUtilGmail.sendMail(to, from, subject, body, isBodyHTML);
                String message = "Successful reset password of username: " + account.getUsername() + " !";
                request.setAttribute("message", message);
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
                        + "TO: " + account.getUser().getEmail() + "\n"
                        + "FROM: " + from + "\n"
                        + "SUBJECT: " + subject + "\n\n"
                        + body + "\n\n");
            }
        } else if (ManageAccounts != null && ManageAccounts.equals("add")) {
            String username = request.getParameter("username");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            User user = new User(name, email, address, phone, Boolean.FALSE);
            if (UserDB.emailExists(user.getEmail()) == false) {
                try {
                    UserDB.insert(user);
                } catch (SQLException ex) {
                    Logger.getLogger(AdminAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                User u = UserDB.selectMailUser(user.getEmail());
                user.setID(u.getID());
                UserDB.update(user);
            }
            try {
                Account account = new Account(username, "123456789", user);
                AccountDB.insert(account);
                // send email to user
                String to = account.getUser().getEmail();
                String from = "huynhnguyenanhtri2003@gmail.com";
                String subject = "Account of you";
                String body = "Dear " + account.getUser().getName() + ",\n\n"
                        + "Your account has been created by Admin. " + "\n"
                        + "Username: " + account.getUsername() + "\n"
                        + "Password: 123456789\n\n"
                        + "AnhTri\n"
                        + "Mobile Store";
                boolean isBodyHTML = false;
                try {
                    MailUtilGmail.sendMail(to, from, subject, body, isBodyHTML);
                    String message = "Successful create account have username: " + account.getUsername() + " !";
                    request.setAttribute("message", message);
                } catch (MessagingException e) {
                    String errorMessage = "ERROR: Unable to send email. "
                            + "Check Tomcat logs for details.<br>"
                            + "ERROR MESSAGE: " + e.getMessage();
                    request.setAttribute("message", errorMessage);
                    this.log(
                            "Unable to send email. \n"
                            + "Here is the email you tried to send: \n"
                            + "=====================================\n"
                            + "TO: " + account.getUser().getEmail() + "\n"
                            + "FROM: " + from + "\n"
                            + "SUBJECT: " + subject + "\n\n"
                            + body + "\n\n");
                }
            } catch (NoSuchAlgorithmException | SQLException ex) {
                Logger.getLogger(AdminAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            List<Account> accounts = AccountDB.selectAllAccount();
            session.setAttribute("accounts", accounts);
        }

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

}
