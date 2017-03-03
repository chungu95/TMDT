/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "Products")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Products.findAll", query = "SELECT p FROM Products p")
    , @NamedQuery(name = "Products.findByProductID", query = "SELECT p FROM Products p WHERE p.productID = :productID")
    , @NamedQuery(name = "Products.findByProductName", query = "SELECT p FROM Products p WHERE p.productName = :productName")
    , @NamedQuery(name = "Products.findByPrice", query = "SELECT p FROM Products p WHERE p.price = :price")
    , @NamedQuery(name = "Products.findByQuantity", query = "SELECT p FROM Products p WHERE p.quantity = :quantity")
    , @NamedQuery(name = "Products.findByProductImg", query = "SELECT p FROM Products p WHERE p.productImg = :productImg")})
public class Products implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ProductID")
    private String productID;
    @Column(name = "ProductName")
    private String productName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Price")
    private BigDecimal price;
    @Lob
    @Column(name = "Description")
    private String description;
    @Column(name = "Quantity")
    private Integer quantity;
    @Column(name = "ProductImg")
    private String productImg;
    @OneToMany(mappedBy = "productID")
    private List<Comment> commentList;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "products")
    private ProductInfo productInfo;
    @JoinColumn(name = "ProduceID", referencedColumnName = "ProduceID")
    @ManyToOne
    private Produce produceID;
    @OneToMany(mappedBy = "productID")
    private List<ProductImages> productImagesList;
    @OneToMany(mappedBy = "productID")
    private List<OderDetails> oderDetailsList;

    public Products() {
    }

    public Products(String productID, String productName, BigDecimal price, String description, Integer quantity, String productImg, List<Comment> commentList, ProductInfo productInfo, Produce produceID, List<ProductImages> productImagesList, List<OderDetails> oderDetailsList) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.productImg = productImg;
        this.commentList = commentList;
        this.productInfo = productInfo;
        this.produceID = produceID;
        this.productImagesList = productImagesList;
        this.oderDetailsList = oderDetailsList;
    }

    public Products(String productID) {
        this.productID = productID;
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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
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

    @XmlTransient
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

    public Produce getProduceID() {
        return produceID;
    }

    public void setProduceID(Produce produceID) {
        this.produceID = produceID;
    }

    @XmlTransient
    public List<ProductImages> getProductImagesList() {
        return productImagesList;
    }

    public void setProductImagesList(List<ProductImages> productImagesList) {
        this.productImagesList = productImagesList;
    }

    @XmlTransient
    public List<OderDetails> getOderDetailsList() {
        return oderDetailsList;
    }

    public void setOderDetailsList(List<OderDetails> oderDetailsList) {
        this.oderDetailsList = oderDetailsList;
    }

// ------------------------------------------------------------------------------------------------------------------//

    public ArrayList<Products> getProducts(String productID){
        ArrayList<Products> products = new ArrayList<>();
        
        return products;
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

    @Override
    public String toString() {
        return "Models.Products[ productID=" + productID + " ]";
    }

}
