/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MobileStore.data;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author DELL
 */
@Entity
public class Invoice implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long invoiceID;

    @OneToOne
    private Cart cart;

    @ManyToOne(optional = true)
    private Discount discount;

    @Temporal(TemporalType.DATE)
    private Date dateCreate;

    private Float totalInvoice;

    @ManyToOne
    private PaymentMethod payMethod;

    private Boolean status;

    public Invoice() {
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public PaymentMethod getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(PaymentMethod payMethod) {
        this.payMethod = payMethod;
    }

    public Long getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(Long invoiceID) {
        this.invoiceID = invoiceID;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public Float getTotalInvoice() {
        return totalInvoice;
    }

    public void calculateTotalInvoice() {
        Float total = this.cart.getTotalPrice() - this.cart.getTotalPrice() * this.discount.getDiscount() / 100;
        this.totalInvoice = total;
    }

    public Invoice(Cart cart, Discount discount, PaymentMethod payMethod, Boolean status) {
        this.cart = cart;
        this.discount = discount;
        this.dateCreate = new Date();
        this.calculateTotalInvoice();
        this.payMethod = payMethod;
        this.status = status;
    }

    public Invoice(Cart cart, PaymentMethod payMethod, Boolean status) {
        this.cart = cart;
        this.dateCreate = new Date();
        this.totalInvoice = cart.getTotalPrice();
        this.payMethod = payMethod;
        this.status = status;
    }

    public Invoice(Long invoiceID, Cart cart, Discount discount, Date dateCreate, PaymentMethod payMethod, Boolean status) {
        this.invoiceID = invoiceID;
        this.cart = cart;
        this.discount = discount;
        this.dateCreate = dateCreate;
        this.payMethod = payMethod;
        this.status = status;
        this.calculateTotalInvoice();
    }
}
