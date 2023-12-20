/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MobileStore.DB;

import MobileStore.data.Account;
import MobileStore.util.DBUtil;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import java.sql.SQLException;
import javax.persistence.TypedQuery;
import javax.persistence.EntityTransaction;

/**
 *
 * @author DELL
 */
public class AccountDB {

    public static void insert(Account account) throws SQLException {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(account);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static List<Account> selectAllAccount() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT a FROM Account a ";
        TypedQuery<Account> q = em.createQuery(qString, Account.class);

        try {
            List<Account> lsAccount = q.getResultList();
            return lsAccount;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static Account selectIDAccount(String id) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT a FROM Account a "
                + "WHERE a.id = :id";
        TypedQuery<Account> q = em.createQuery(qString, Account.class);
        q.setParameter("id", Long.valueOf(id));
        try {
            Account account = q.getSingleResult();
            return account;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static void update(Account account) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(account);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void delete(Account account) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            Account managedAccount = em.merge(account); // Tái kết nối đối tượng đã tách
            em.remove(managedAccount); // Xóa đối tượng đã tái kết nối
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }
}
