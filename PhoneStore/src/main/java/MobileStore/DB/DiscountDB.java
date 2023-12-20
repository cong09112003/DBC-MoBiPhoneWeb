/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MobileStore.DB;

import MobileStore.data.Discount;
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
public class DiscountDB {

    public static void insert(Discount discount) throws SQLException {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(discount);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static List<Discount> selectAllDiscount() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT d FROM Discount d ";
        TypedQuery<Discount> q = em.createQuery(qString, Discount.class);

        try {
            List<Discount> lsDiscount = q.getResultList();
            return lsDiscount;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static void update(Discount discount) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(discount);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static Discount selectIDDiscount(String id) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT d FROM Discount d "
                + "WHERE d.discountID = :id";
        TypedQuery<Discount> q = em.createQuery(qString, Discount.class);
        q.setParameter("id", Long.valueOf(id));
        try {
            Discount discount = q.getSingleResult();
            return discount;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static void delete(Discount discount) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            Discount managedDiscount = em.merge(discount);
            em.remove(managedDiscount);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }
}
