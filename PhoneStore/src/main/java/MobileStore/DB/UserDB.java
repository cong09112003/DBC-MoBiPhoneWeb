/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MobileStore.DB;

import MobileStore.data.Account;
import java.sql.*;
import javax.persistence.*;
import MobileStore.data.User;
import MobileStore.util.DBUtil;

/**
 *
 * @author DELL
 */
public class UserDB {

    public static User getUserById(long userId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            User user = em.find(User.class, userId);
            return user;
        } finally {
            em.close();
        }
    }

    public static void insert(User user) throws SQLException {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(user);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void update(User user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(user);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static boolean emailExists(String email) {
        User u = selectMailUser(email);
        return u != null;
    }

    public static void delete(User user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            User managedUser = em.find(User.class, user.getID()); // Tìm đối tượng User trong cơ sở dữ liệu
            if (managedUser != null) {
                em.remove(managedUser); // Xóa đối tượng đã tìm thấy
            }
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static User selectMailUser(String email) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM User u "
                + "WHERE u.email = :email";
        TypedQuery<User> q = em.createQuery(qString, User.class);
        q.setParameter("email", email);
        try {
            User user = q.getSingleResult();
            return user;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static User selectIDUser(String id) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM User u "
                + "WHERE u.id = :id";
        TypedQuery<User> q = em.createQuery(qString, User.class);
        q.setParameter("id", id);
        try {
            User user = q.getSingleResult();
            return user;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static User selectManager() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM User u "
                + "WHERE u.isManager = :ismanager";
        TypedQuery<User> q = em.createQuery(qString, User.class);
        q.setParameter("ismanager", true);
        try {
            User user = q.getSingleResult();
            return user;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static boolean authenticateUser(String username, String password) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM Account u "
                + "WHERE u.username = :username AND u.password = :password";
        TypedQuery<Account> q = em.createQuery(qString, Account.class);
        q.setParameter("username", username);
        q.setParameter("password", password); // In production, use hashed passwords

        try {
            Account account = q.getSingleResult();
            return account != null; // Authentication successful if user is found
        } catch (NoResultException e) {
            return false; // Authentication failed if no user is found
        } finally {
            em.close();
        }
    }
//     public boolean addUser(User user) {
//        EntityManager em = DBUtil.getEmFactory().createEntityManager();
//        EntityTransaction trans = em.getTransaction();
//
//        try {
//            trans.begin();
//
//            // Thêm thông tin người dùng vào bảng User
//            em.persist(user);
//
//            // Tạo đối tượng Account và thêm mật khẩu vào bảng Account
//            Account account = new Account();
//            account.setUser(user);
//            account.setPassword();
//
//            em.persist(account);
//
//            trans.commit();
//            return true;
//        } catch (Exception e) {
//            if (trans.isActive()) {
//                trans.rollback();
//            }
//            e.printStackTrace();
//            return false;
//        } finally {
//            em.close();
//        }
//    }
}
