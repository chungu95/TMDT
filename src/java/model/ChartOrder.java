/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author DELL
 */
public class ChartOrder {
    private int value;
    private String orderStatus;

    public ChartOrder() {
    }

    public ChartOrder(int value, String orderStatus) {
        this.value = value;
        this.orderStatus = orderStatus;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    @Override
    public String toString() {
        return  orderStatus;
    }
    
}
