/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MobileStore.DB;

import MobileStore.data.LineItem;
import MobileStore.data.Product;
import MobileStore.util.DBUtil;
import java.sql.SQLException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author DELL
 */
public class LineItemDB {

//    public static LineItem insert(LineItem lineItem) throws SQLException {
//        EntityManager em = DBUtil.getEmFactory().createEntityManager();
//        EntityTransaction trans = em.getTransaction();
//        trans.begin();
//        LineItem insertedLineItem = null;
//        try {
//            insertedLineItem = em.merge(lineItem);
//            trans.commit();
//        } catch (Exception e) {
//            System.out.println(e);
//            trans.rollback();
//        } finally {
//            em.close();
//        }
//        return insertedLineItem;
//    }

    public static void delete(Product product) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            List<LineItem> lsLineItem = LineItemDB.selectByProduct(product);
            System.out.print("LINEITEM " + product.getName());
            for (LineItem li : lsLineItem) {
                System.out.print(li.getItem().getName());
                LineItem managedLineItem = em.merge(li);
                em.remove(managedLineItem);
            }
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void delete(LineItem lnItem) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            LineItem managedlnItem = em.find(LineItem.class, lnItem.getId()); // Tìm đối tượng LineItem trong cơ sở dữ liệu
            if (managedlnItem != null) {
                em.remove(managedlnItem); // Xóa đối tượng đã tìm thấy
            }
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static List<LineItem> selectByProduct(Product product) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT l FROM LineItem l "
                + "WHERE l.item = :product";
        TypedQuery<LineItem> q = em.createQuery(qString, LineItem.class);
        q.setParameter("product", product);
        try {
            List<LineItem> lsLineItem = q.getResultList();
            return lsLineItem;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

}
