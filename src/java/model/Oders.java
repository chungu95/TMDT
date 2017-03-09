/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ADMIN
 */

public class Oders implements Serializable {

    private String oderID;
    private Date oderDate;
    private Date shipDate;
    private BigDecimal oderPrice;
    private String paymentMethod;
    private String deliveryAddress;
    private String status;
    private Customers customerID;
    private Employees employeeID;
    private List<OderDetails> oderDetailsList;

    public Oders() {
    }

    public Oders(String oderID) {
        this.oderID = oderID;
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

    public BigDecimal getOderPrice() {
        return oderPrice;
    }

    public void setOderPrice(BigDecimal oderPrice) {
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

    public Customers getCustomerID() {
        return customerID;
    }

    public void setCustomerID(Customers customerID) {
        this.customerID = customerID;
    }

    public Employees getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(Employees employeeID) {
        this.employeeID = employeeID;
    }

    public List<OderDetails> getOderDetailsList() {
        return oderDetailsList;
    }

    public void setOderDetailsList(List<OderDetails> oderDetailsList) {
        this.oderDetailsList = oderDetailsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (oderID != null ? oderID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Oders)) {
            return false;
        }
        Oders other = (Oders) object;
        if ((this.oderID == null && other.oderID != null) || (this.oderID != null && !this.oderID.equals(other.oderID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Oders[ oderID=" + oderID + " ]";
    }
    
}
