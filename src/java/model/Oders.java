/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Oders implements Serializable {

    private String oderID;
    private Date oderDate;
    private Date shipDate;
    private int oderPrice;
    private String paymentMethod;
    private String deliveryAddress;
    private String deliveryPhone;
    private String status;
    private String customerID;
    private String employeeID;
    private List<OderDetails> oderDetailsList;

    public Oders() {
    }

    public Oders(String oderID, Date oderDate, Date shipDate, int oderPrice, String paymentMethod, String deliveryAddress, String deliveryPhone, String status, String customerID, String employeeID) {
        this.oderID = oderID;
        this.oderDate = oderDate;
        this.shipDate = shipDate;
        this.oderPrice = oderPrice;
        this.paymentMethod = paymentMethod;
        this.deliveryAddress = deliveryAddress;
        this.status = status;
        this.customerID = customerID;
        this.employeeID = employeeID;
        this.deliveryPhone = deliveryPhone;
    }

    public Oders(String oderID) {
        this.oderID = oderID;
    }

    public int getPrice() {
        return oderPrice;
    }

    public void setPrice(int price) {
        this.oderPrice = price;
    }

    public String getOderID() {
        return oderID;
    }

    public void setOderID(String oderID) {
        this.oderID = oderID;
    }

    public Date getOderDate() {
        return oderDate;
    }

    public void setOderDate(Date oderDate) {
        this.oderDate = oderDate;
    }

    public Date getShipDate() {
        return shipDate;
    }

    public void setShipDate(Date shipDate) {
        this.shipDate = shipDate;
    }

    public int getOderPrice() {
        return oderPrice;
    }

    public void setOderPrice(int oderPrice) {
        this.oderPrice = oderPrice;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }

    public List<OderDetails> getOderDetailsList() {
        return oderDetailsList;
    }

    public void setOderDetailsList(List<OderDetails> oderDetailsList) {
        this.oderDetailsList = oderDetailsList;
    }

    public String getDeliveryPhone() {
        return deliveryPhone;
    }

    public void setDeliveryPhone(String deliveryPhone) {
        this.deliveryPhone = deliveryPhone;
    }
    
    

    public void updatePrice() {
        this.oderPrice = 0;
        this.oderDetailsList.forEach(item -> {
            this.oderPrice += item.getPrice();
        });
    }

}
