/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MobileStore.data;

import java.io.Serializable;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author DELL
 */
@Entity
public class Cart implements Serializable {

    @Id
    @GeneratedValue( strategy=GenerationType.AUTO )
    private Long cartID;
    
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<LineItem> lslineItems;
    
    @ManyToOne
    private User customer;
    
    private Float totalPrice;

    public Cart() {
    }

    public Long getCartID() {
        return cartID;
    }

    public void setCartID(Long cartID) {
        this.cartID = cartID;
    }

    public List<LineItem> getLslineItems() {
        return lslineItems;
    }

    public void setLslineItems(List<LineItem> lslineItems) {
        this.lslineItems = lslineItems;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public Float getTotalPrice() {
        return this.totalPrice;
    }

    public void calculateTotalPrice() {
        float total = 0;
        for (LineItem lineItem : lslineItems) {
            total += lineItem.getItem().getPrice() * lineItem.getQuanlity();
        }
        this.totalPrice = total;
    }
    
    public Cart(Long cartID, List<LineItem> lslineItems, User customer) {
        this.cartID = cartID;
        this.lslineItems = lslineItems;
        this.customer = customer;
        this.calculateTotalPrice();
    }

    public Cart(User customer) {
        this.customer = customer;
        this.lslineItems = new ArrayList<>();
        this.totalPrice = Float.valueOf(0);
    }
}
