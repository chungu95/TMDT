/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "OderDetails")
@NamedQueries({
    @NamedQuery(name = "OderDetails.findAll", query = "SELECT o FROM OderDetails o")})
public class OderDetails implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected OderDetailsPK oderDetailsPK;
    @Column(name = "Quantity")
    private Integer quantity;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Price")
    private BigDecimal price;
    @JoinColumn(name = "OderID", referencedColumnName = "OderID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Oders oders;
    @JoinColumn(name = "ProductID", referencedColumnName = "ProductID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Products products;

    public OderDetails() {
    }

    public OderDetails(OderDetailsPK oderDetailsPK) {
        this.oderDetailsPK = oderDetailsPK;
    }

    public OderDetails(String oderID, String productID) {
        this.oderDetailsPK = new OderDetailsPK(oderID, productID);
    }

    public OderDetailsPK getOderDetailsPK() {
        return oderDetailsPK;
    }

    public void setOderDetailsPK(OderDetailsPK oderDetailsPK) {
        this.oderDetailsPK = oderDetailsPK;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (oderDetailsPK != null ? oderDetailsPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OderDetails)) {
            return false;
        }
        OderDetails other = (OderDetails) object;
        if ((this.oderDetailsPK == null && other.oderDetailsPK != null) || (this.oderDetailsPK != null && !this.oderDetailsPK.equals(other.oderDetailsPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.OderDetails[ oderDetailsPK=" + oderDetailsPK + " ]";
    }
    
}
