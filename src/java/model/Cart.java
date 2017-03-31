/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class Cart {

    private ArrayList<Products> listProduct;
    private int totalPrice = 0;
    private int totalQuantity = 0;

    public Cart() {
        listProduct = new ArrayList<>();
    }

    public ArrayList<Products> getListProduct() {
        return listProduct;
    }

    public void setListProduct(ArrayList<Products> listProduct) {
        this.listProduct = listProduct;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public void updateTotalPrice() {
        this.totalPrice = 0;
        this.listProduct.forEach((product) -> {
            totalPrice += (product.getQuantity() * product.getPrice());
        });
    }

    public void updateTotalQuantity() {
        this.totalQuantity = 0;
        this.listProduct.forEach((product) -> {
            totalQuantity += product.getQuantity(); 
        }); 
    }

}
