/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Products implements Serializable {

    private String productID;

    @Override
    public String toString() {
        return "Products{" + "productID=" + productID + ", productName=" + productName + ", price=" + price + ", description=" + description + ", quantity=" + quantity + ", productImg=" + productImg + ", commentList=" + commentList + ", productInfo=" + productInfo + ", produceID=" + produceID + ", productImagesList=" + productImagesList + ", oderDetailsList=" + oderDetailsList + ", productImage=" + productImage + '}'+"\n";
    }
    private String productName;
    private int price;
    private String description;
    private Integer quantity;
    private String productImg;
    private List<Comment> commentList;
    private ProductInfo productInfo;
    private String produceID;
    private List<ProductImages> productImagesList;
    private List<OderDetails> oderDetailsList;
    private String productImage;

    public Products() {
    }

    public Products(String productID) {
        this.productID = productID;
    }

    public Products(String productName, int price, String description, Integer quantity, String productImg, ProductInfo productInfo, String produceID) {
        this.productName = productName;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.productImg = productImg;
        this.productInfo = productInfo;
        this.produceID = produceID;
    }


    public Products(String productID, String productName, int price, String description, Integer quantity, ProductInfo productInfo, String produceID) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.productInfo = productInfo;
        this.produceID = produceID;
    }
        
    public Products(String productID, String productName, int price, String description, Integer quantity, String productImg, ProductInfo productInfo, String produceID) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.productImg = productImg;
        this.productInfo = productInfo;
        this.produceID = produceID;
    }
    
    

    public Products(String productID, String productName, int price, String description, Integer quantity, String productImg, String produceID) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.productImg = productImg;
        this.produceID = produceID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public ProductInfo getProductInfo() {
        return productInfo;
    }

    public void setProductInfo(ProductInfo productInfo) {
        this.productInfo = productInfo;
    }

    public String getProduceID() {
        return produceID;
    }

    public void setProduceID(String produceID) {
        this.produceID = produceID;
    }

    public List<ProductImages> getProductImagesList() {
        return productImagesList;
    }
    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }


    public void setProductImagesList(List<ProductImages> productImagesList) {
        this.productImagesList = productImagesList;
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
        hash += (productID != null ? productID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Products)) {
            return false;
        }
        Products other = (Products) object;
        if ((this.productID == null && other.productID != null) || (this.productID != null && !this.productID.equals(other.productID))) {
            return false;
        }
        return true;
    }

  

}
