/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "OderDetails")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OderDetails.findAll", query = "SELECT o FROM OderDetails o")
    , @NamedQuery(name = "OderDetails.findByQuantity", query = "SELECT o FROM OderDetails o WHERE o.quantity = :quantity")
    , @NamedQuery(name = "OderDetails.findByPrice", query = "SELECT o FROM OderDetails o WHERE o.price = :price")
    , @NamedQuery(name = "OderDetails.findById", query = "SELECT o FROM OderDetails o WHERE o.id = :id")})
public class OderDetails implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "Quantity")
    private Integer quantity;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Price")
    private BigDecimal price;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @JoinColumn(name = "OderID", referencedColumnName = "OderID")
    @ManyToOne
    private Oders oderID;
    @JoinColumn(name = "ProductID", referencedColumnName = "ProductID")
    @ManyToOne
    private Products productID;

    public OderDetails() {
    }

    public OderDetails(Integer id) {
        this.id = id;
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Oders getOderID() {
        return oderID;
    }

    public void setOderID(Oders oderID) {
        this.oderID = oderID;
    }

    public Products getProductID() {
        return productID;
    }

    public void setProductID(Products productID) {
        this.productID = productID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OderDetails)) {
            return false;
        }
        OderDetails other = (OderDetails) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Models.OderDetails[ id=" + id + " ]";
    }
    
}
