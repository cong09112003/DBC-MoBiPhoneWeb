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
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class RegisterController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public RegisterController() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String url = "/Login.jsp";

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        String phoneNumber = request.getParameter("phonenumber");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmpassword");
        String name = request.getParameter("name");

        // Kiểm tra xem password có null không trước khi sử dụng equals
        if (!password.isEmpty() && !confirmPassword.isEmpty() && !username.isEmpty()
                && !email.isEmpty() && !address.isEmpty() && !phoneNumber.isEmpty() && !name.isEmpty()) {
            if (password.equals(confirmPassword)) {
                try {
                    List<Account> lsAccount = AccountDB.selectAllAccount();
                    User user = new User(name, email, address, phoneNumber, Boolean.FALSE);
                    if (UserDB.emailExists(user.getEmail()) == false) {
                        UserDB.insert(user);
                    }
                    Account account = new Account(username, password, user);
                    boolean exist = false;
                    for (Account a : lsAccount) {
                        if (a.getUsername().equals(account.getUsername())) {
                            request.setAttribute("message", "Register : Username already exists !!");
                            exist = true;
                            break;
                        }
                    }
                    if (exist == false) {
                        AccountDB.insert(account);
                        lsAccount = AccountDB.selectAllAccount();
                        for (Account acc : lsAccount) {
                            if (acc.getUsername().equals(account.getUsername()) && acc.getPassword().equals(account.getPassword())) {
                                session.setAttribute("user", acc.getUser());
                                if (acc.getUser().getIsManager()) {
                                    response.sendRedirect("/PhoneStore/Admin?sidebar-list=Products");
                                } else {
                                    session.setAttribute("lsProduct_cmt", null);
                                    response.sendRedirect("/CustomerServlet");
                                }
                                return;
                            }
                        }
                        request.setAttribute("message", "Register: Add account failure !!");
                    }

                } catch (UnsupportedEncodingException | NoSuchAlgorithmException | SQLException e) {
                    System.out.println(e.getMessage());
                }
            } else {
                request.setAttribute("message", "Register : Password and Confirm Password mismatch !!");
            }

        } else {
            // Xử lý lỗi, ví dụ: redirect hoặc hiển thị thông báo lỗi
            request.setAttribute("message", "Please fill in the information !!");
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}
