/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author seuti
 */
public class Cart {
    private String ProductID;
    private String ProductName;
    private int Price;
    private int Quantity;
    private String CustomerID;

    public Cart() {
    }

    public Cart(int ProductID, String ProductName, int Price, int Quantity, String CustomerID) {
       
        this.ProductName = ProductName;
        this.Price = Price;
        this.Quantity = Quantity;
        this.CustomerID = CustomerID;
    }

    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String ProductID) {
        this.ProductID = ProductID;
    }

    

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public String getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(String CustomerID) {
        this.CustomerID = CustomerID;
    }

    @Override
    public String toString() {
        return "Cart{" + "ProductID=" + ProductID + ", ProductName=" + ProductName + ", Price=" + Price + ", Quantity=" + Quantity + ", CustomerID=" + CustomerID + '}';
    }
    
    
}
