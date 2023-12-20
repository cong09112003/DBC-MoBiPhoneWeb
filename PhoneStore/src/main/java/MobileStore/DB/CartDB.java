/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MobileStore.DB;

import MobileStore.data.Cart;
import MobileStore.data.Product;
import MobileStore.util.DBUtil;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

/**
 *
 * @author DELL
 */
public class CartDB {

    public static List<Cart> selectByProduct(Product product) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT c FROM Cart c "
                + "JOIN c.lslineItems li "
                + "WHERE li.item = :product";
        TypedQuery<Cart> q = em.createQuery(qString, Cart.class);
        q.setParameter("product", product);
        try {
            List<Cart> lsCart = q.getResultList();
            return lsCart;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static void delete(Cart cart) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            Cart managedCart = em.merge(cart); // Tái kết nối đối tượng đã tách
            em.remove(managedCart); // Xóa đối tượng đã tái kết nối
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static List<Cart> selectCart(long userID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT c FROM Cart c WHERE c.customer.id = :userID";
        TypedQuery<Cart> q = em.createQuery(qString, Cart.class);
        q.setParameter("userID", userID);
        try {
            List<Cart> carts = q.getResultList();
            return carts;
        } catch (NoResultException e) {
            System.out.println(e);
            return null;
        } finally {
            em.close();
        }
    }
    
    public static Cart selectIDCart(String id) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT c FROM Cart c "
                + "WHERE c.cartID = :id";
        TypedQuery<Cart> q = em.createQuery(qString, Cart.class);
        q.setParameter("id", Long.valueOf(id));
        try {
            Cart cart = q.getSingleResult();
            return cart;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static void insert(Cart cart) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(cart);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void update(Cart cart) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(cart);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }
}
