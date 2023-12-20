/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MobileStore.data;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author DELL
 */
@Entity
public class PaymentMethod implements Serializable {
    @Id
    @GeneratedValue( strategy=GenerationType.AUTO )
    private Long methodID;
    
    private String method;
    private String information;

    public PaymentMethod() {
    }

    public Long getMethodID() {
        return methodID;
    }

    public void setMethodID(Long methodID) {
        this.methodID = methodID;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public PaymentMethod(Long methodID, String method, String information) {
        this.methodID = methodID;
        this.method = method;
        this.information = information;
    }
    
}
