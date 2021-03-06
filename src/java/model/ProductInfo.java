/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author ADMIN
 */
public class ProductInfo implements Serializable {

    private String productID;
    private String productType;
    private String resolution;
    private String hdmi;
    private String usb;
    private String Model;
    private String size;
    private String warranty;
    private Products products;

    public ProductInfo() {
    }

    public ProductInfo(String productID, String productType, String resolution, String hdmi, String usb, String Model, String size, String warranty) {
        this.productID = productID;
        this.productType = productType;
        this.resolution = resolution;
        this.hdmi = hdmi;
        this.usb = usb;
        this.Model = Model;
        this.size = size;
        this.warranty = warranty;
    }

    public ProductInfo(String productType, String resolution, String hdmi, String usb, String Model, String size, String warranty) {
        this.productType = productType;
        this.resolution = resolution;
        this.hdmi = hdmi;
        this.usb = usb;
        this.Model = Model;
        this.size = size;
        this.warranty = warranty;
    }

    public ProductInfo(String productID) {
        this.productID = productID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }

    public String getHdmi() {
        return hdmi;
    }

    public void setHdmi(String hdmi) {
        this.hdmi = hdmi;
    }

    public String getUsb() {
        return usb;
    }

    public void setUsb(String usb) {
        this.usb = usb;
    }

    public String getModel() {
        return Model;
    }

    public void setModel(String Model) {
        this.Model = Model;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getWarranty() {
        return warranty;
    }

    public void setWarranty(String warranty) {
        this.warranty = warranty;
    }

    public Products getProducts() {
        return products;
    }

    public void setProducts(Products products) {
        this.products = products;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productID != null ? productID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductInfo)) {
            return false;
        }
        ProductInfo other = (ProductInfo) object;
        if ((this.productID == null && other.productID != null) || (this.productID != null && !this.productID.equals(other.productID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.ProductInfo[ productID=" + productID + " ]";
    }

}
