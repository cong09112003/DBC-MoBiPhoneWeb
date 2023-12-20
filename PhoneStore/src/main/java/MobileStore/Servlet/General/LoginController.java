/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MobileStore.Servlet.General;

import MobileStore.DB.AccountDB;
import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import MobileStore.data.Account;

import MobileStore.DB.UserDB;
import MobileStore.data.User;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginController() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, UnsupportedEncodingException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String url = "/Login.jsp";

        List<Account> accounts = AccountDB.selectAllAccount();
        String username = request.getParameter("txtUserName"); // Lấy giá trị username từ request
        String password = request.getParameter("txtPassword"); // Lấy giá trị password từ request
        try {
            Account account = new Account(username, password);
            for (Account acc : accounts) {
                if (acc.getUsername().equals(account.getUsername()) && acc.getPassword().equals(account.getPassword())) {
                    session.setAttribute("user", acc.getUser());
                    session.setAttribute("username_save", acc.getUsername());
                    session.setAttribute("password_save", password);
                    if (acc.getUser().getIsManager()) {
                        response.sendRedirect("/Admin?sidebar-list=Products");
                    } else {
                        session.setAttribute("lsProduct_cmt", null);
                        response.sendRedirect("/CustomerServlet");
                    }
                    return;
                }

            }
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Nếu đến đây, có nghĩa là không tìm thấy username và password đúng
        request.setAttribute("message", "Login: Incorrect username or password");
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
