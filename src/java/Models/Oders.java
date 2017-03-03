/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "Oders")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Oders.findAll", query = "SELECT o FROM Oders o")
    , @NamedQuery(name = "Oders.findByOderID", query = "SELECT o FROM Oders o WHERE o.oderID = :oderID")
    , @NamedQuery(name = "Oders.findByOderDate", query = "SELECT o FROM Oders o WHERE o.oderDate = :oderDate")
    , @NamedQuery(name = "Oders.findByShipDate", query = "SELECT o FROM Oders o WHERE o.shipDate = :shipDate")
    , @NamedQuery(name = "Oders.findByOderPrice", query = "SELECT o FROM Oders o WHERE o.oderPrice = :oderPrice")
    , @NamedQuery(name = "Oders.findByPaymentMethod", query = "SELECT o FROM Oders o WHERE o.paymentMethod = :paymentMethod")
    , @NamedQuery(name = "Oders.findByDeliveryAddress", query = "SELECT o FROM Oders o WHERE o.deliveryAddress = :deliveryAddress")
    , @NamedQuery(name = "Oders.findByStatus", query = "SELECT o FROM Oders o WHERE o.status = :status")})
public class Oders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "OderID")
    private String oderID;
    @Column(name = "OderDate")
    @Temporal(TemporalType.DATE)
    private Date oderDate;
    @Column(name = "ShipDate")
    @Temporal(TemporalType.DATE)
    private Date shipDate;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "OderPrice")
    private BigDecimal oderPrice;
    @Column(name = "PaymentMethod")
    private String paymentMethod;
    @Column(name = "DeliveryAddress")
    private String deliveryAddress;
    @Column(name = "Status")
    private String status;
    @JoinColumn(name = "CustomerID", referencedColumnName = "CustomerID")
    @ManyToOne
    private Customers customerID;
    @JoinColumn(name = "EmployeeID", referencedColumnName = "EmployeeID")
    @ManyToOne
    private Employees employeeID;
    @OneToMany(mappedBy = "oderID")
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

    @XmlTransient
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
        return "Models.Oders[ oderID=" + oderID + " ]";
    }
    
}
