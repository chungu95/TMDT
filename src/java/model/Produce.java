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

public class Produce implements Serializable {

    private String produceID;
    private String produceName;
    private List<Products> productsList;

    public Produce() {
    }

    public Produce(String produceID) {
        this.produceID = produceID;
    }

    public String getProduceID() {
        return produceID;
    }

    public void setProduceID(String produceID) {
        this.produceID = produceID;
    }

    public String getProduceName() {
        return produceName;
    }

    public void setProduceName(String produceName) {
        this.produceName = produceName;
    }

    public List<Products> getProductsList() {
        return productsList;
    }

    public void setProductsList(List<Products> productsList) {
        this.productsList = productsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (produceID != null ? produceID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Produce)) {
            return false;
        }
        Produce other = (Produce) object;
        if ((this.produceID == null && other.produceID != null) || (this.produceID != null && !this.produceID.equals(other.produceID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Produce[ produceID=" + produceID + " ]";
    }
    
}
