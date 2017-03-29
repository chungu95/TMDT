/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 *
 * @author ADMIN
 */
public class OderDetails implements Serializable {

    private String oderID;
    private String productID;
    private Integer quantity;
    private int price;
    private Oders oders;
    private Products products;

    public OderDetails() {
    }

    public OderDetails(String oderID, String productID, Integer quantity, int price) {
        this.oderID = oderID;
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
    }

    public String getOderID() {
        return oderID;
    }

    public void setOderID(String oderID) {
        this.oderID = oderID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Oders getOders() {
        return oders;
    }

    public void setOders(Oders oders) {
        this.oders = oders;
    }

    public Products getProducts() {
        return products;
    }

    public void setProducts(Products products) {
        this.products = products;
    }

}
