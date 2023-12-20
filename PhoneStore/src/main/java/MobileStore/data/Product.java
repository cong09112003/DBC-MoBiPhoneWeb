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
public class Product implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long productID;

    private String name;
    private Boolean status;

    private String type;

    private int sale;
    private int stock;
    private String information;
    private Float price;
    private String image;

    public Product() {
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Long getProductID() {
        return productID;
    }

    public void setProductID(Long productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Product(Long productID, String name, Boolean status, String type, int sale, int stock, String information, Float price, String image) {
        this.productID = productID;
        this.name = name;
        this.status = status;
        this.type = type;
        this.sale = sale;
        this.stock = stock;
        this.information = information;
        this.price = price;
        this.image = image;
    }

    public Product(String name, Boolean status, String type, int sale, int stock, String information, Float price, String image) {
        this.name = name;
        this.status = status;
        this.type = type;
        this.sale = sale;
        this.stock = stock;
        this.information = information;
        this.price = price;
        this.image = image;
    }

    public Product(String name, Boolean status, String type, int sale, int stock, String information, Float price) {
        this.name = name;
        this.status = status;
        this.type = type;
        this.sale = sale;
        this.stock = stock;
        this.information = information;
        this.price = price;
    }
}
