/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MobileStore.data;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author DELL
 */
@Entity
public class Discount implements Serializable {
    @Id
    @GeneratedValue( strategy=GenerationType.AUTO )
    private Long discountID;
    
    private String name;
    
    private int discount;
    
    @Temporal(TemporalType.DATE)
    private Date dateStart;
    
    @Temporal(TemporalType.DATE)
    private Date dateEnd;

    public Discount() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getDiscountID() {
        return discountID;
    }

    public void setDiscountID(Long discountID) {
        this.discountID = discountID;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public Discount(String name, int discount, Date dateStart, Date dateEnd) {
        this.name = name;
        this.discount = discount;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
    }

    public Discount(Long discountID, int discount, Date dateStart, Date dateEnd) {
        this.discountID = discountID;
        this.discount = discount;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
    }

    public Discount(Long discountID, String name, int discount, Date dateStart, Date dateEnd) {
        this.discountID = discountID;
        this.name = name;
        this.discount = discount;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
    }
    
    
}
