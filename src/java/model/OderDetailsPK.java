/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author ADMIN
 */
@Embeddable
public class OderDetailsPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "OderID")
    private String oderID;
    @Basic(optional = false)
    @Column(name = "ProductID")
    private String productID;

    public OderDetailsPK() {
    }

    public OderDetailsPK(String oderID, String productID) {
        this.oderID = oderID;
        this.productID = productID;
    }

    public String getOderID() {
        return oderID;
    }

    public void setOderID(String oderID) {
        this.oderID = oderID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (oderID != null ? oderID.hashCode() : 0);
        hash += (productID != null ? productID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OderDetailsPK)) {
            return false;
        }
        OderDetailsPK other = (OderDetailsPK) object;
        if ((this.oderID == null && other.oderID != null) || (this.oderID != null && !this.oderID.equals(other.oderID))) {
            return false;
        }
        if ((this.productID == null && other.productID != null) || (this.productID != null && !this.productID.equals(other.productID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.OderDetailsPK[ oderID=" + oderID + ", productID=" + productID + " ]";
    }
    
}
