/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MobileStore.DB;

import MobileStore.data.PaymentMethod;
import MobileStore.util.DBUtil;
import javax.persistence.EntityManager;

/**
 *
 * @author DELL
 */
public class PaymentMethodDB {

    public static PaymentMethod getMethodById(long MethodId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            PaymentMethod method = em.find(PaymentMethod.class, MethodId);
            return method;
        } finally {
            em.close();
        }
    }

}
