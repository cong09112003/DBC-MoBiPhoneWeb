/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MobileStore.data;

import java.util.Date;

/**
 *
 * @author DELL
 */
public class Statistic {
    private String statisticDate;
    private float totalSales;
    private int totalProduct;

    public String getStatisticDate() {
        return statisticDate;
    }

    public void setStatisticDate(String statisticDate) {
        this.statisticDate = statisticDate;
    }

    public float getTotalSales() {
        return totalSales;
    }

    public void setTotalSales(float total) {
        this.totalSales = total;
    }

    public int getTotalProduct() {
        return totalProduct;
    }

    public void setTotalProduct(int totalProduct) {
        this.totalProduct = totalProduct;
    }

    public Statistic(String statisticDate, float totalSales) {
        this.statisticDate = statisticDate;
        this.totalSales = totalSales;
    }

    public Statistic(String statisticDate, float totalSales, int totalProduct) {
        this.statisticDate = statisticDate;
        this.totalSales = totalSales;
        this.totalProduct = totalProduct;
    }

    public Statistic(String statisticDate) {
        this.statisticDate = statisticDate;
        this.totalSales = 0;
        this.totalProduct = 0;
    }
    
}
