/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MobileStore.DB;

import MobileStore.data.Cart;
import MobileStore.data.Discount;
import MobileStore.data.Invoice;
import MobileStore.util.DBUtil;
import java.sql.SQLException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

/**
 *
 * @author DELL
 */
public class InvoiceDB {

    public static boolean cartExists(Cart cart) {
        Invoice c = selectByCart(cart);
        return c != null;
    }

    public static List<Invoice> selectAllInvoice() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT i FROM Invoice i ";
        TypedQuery<Invoice> q = em.createQuery(qString, Invoice.class);

        try {
            List<Invoice> lsInvoice = q.getResultList();
            return lsInvoice;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static Invoice selectByCart(Cart cart) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT i FROM Invoice i "
                + "WHERE i.cart = :cart";
        TypedQuery<Invoice> q = em.createQuery(qString, Invoice.class);
        q.setParameter("cart", cart);
        try {
            Invoice invoice = q.getSingleResult();
            return invoice;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static List<Invoice> selectByDiscount(Discount discount) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT i FROM Invoice i "
                + "WHERE i.discount = :discount";
        TypedQuery<Invoice> q = em.createQuery(qString, Invoice.class);
        q.setParameter("discount", discount);
        try {
            List<Invoice> invoices = q.getResultList();
            return invoices;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static void delete(Invoice invoice) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            Invoice managedInvoice = em.merge(invoice); // Tái kết nối đối tượng đã tách
            em.remove(managedInvoice); // Xóa đối tượng đã tái kết nối
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static Invoice selectIDInvoice(String id) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT i FROM Invoice i "
                + "WHERE i.invoiceID = :id";
        TypedQuery<Invoice> q = em.createQuery(qString, Invoice.class);
        q.setParameter("id", Long.valueOf(id));
        try {
            Invoice invoice = q.getSingleResult();
            return invoice;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static void update(Invoice invoice) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(invoice);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void insert(Invoice invoice) throws SQLException {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(invoice);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }
}
