/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "Produce")
@NamedQueries({
    @NamedQuery(name = "Produce.findAll", query = "SELECT p FROM Produce p")})
public class Produce implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ProduceID")
    private String produceID;
    @Column(name = "ProduceName")
    private String produceName;
    @OneToMany(mappedBy = "produceID")
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
