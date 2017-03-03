/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
@Table(name = "Customers")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Customers.findAll", query = "SELECT c FROM Customers c")
    , @NamedQuery(name = "Customers.findByCustomerID", query = "SELECT c FROM Customers c WHERE c.customerID = :customerID")
    , @NamedQuery(name = "Customers.findByCustomerName", query = "SELECT c FROM Customers c WHERE c.customerName = :customerName")
    , @NamedQuery(name = "Customers.findByDoB", query = "SELECT c FROM Customers c WHERE c.doB = :doB")
    , @NamedQuery(name = "Customers.findByAddress", query = "SELECT c FROM Customers c WHERE c.address = :address")
    , @NamedQuery(name = "Customers.findByEmail", query = "SELECT c FROM Customers c WHERE c.email = :email")
    , @NamedQuery(name = "Customers.findByPhoneNumber", query = "SELECT c FROM Customers c WHERE c.phoneNumber = :phoneNumber")
    , @NamedQuery(name = "Customers.findByAccumulatedScore", query = "SELECT c FROM Customers c WHERE c.accumulatedScore = :accumulatedScore")
    , @NamedQuery(name = "Customers.findByUsername", query = "SELECT c FROM Customers c WHERE c.username = :username")
    , @NamedQuery(name = "Customers.findByPassword", query = "SELECT c FROM Customers c WHERE c.password = :password")})
public class Customers implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "CustomerID")
    private String customerID;
    @Column(name = "CustomerName")
    private String customerName;
    @Column(name = "DoB")
    @Temporal(TemporalType.DATE)
    private Date doB;
    @Column(name = "Address")
    private String address;
    @Column(name = "Email")
    private String email;
    @Column(name = "PhoneNumber")
    private String phoneNumber;
    @Column(name = "AccumulatedScore")
    private String accumulatedScore;
    @Column(name = "Username")
    private String username;
    @Column(name = "Password")
    private String password;
    @OneToMany(mappedBy = "username")
    private List<Comment> commentList;
    @OneToMany(mappedBy = "customerID")
    private List<Oders> odersList;

    public Customers() {
    }

    public Customers(String customerID) {
        this.customerID = customerID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Date getDoB() {
        return doB;
    }

    public void setDoB(Date doB) {
        this.doB = doB;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAccumulatedScore() {
        return accumulatedScore;
    }

    public void setAccumulatedScore(String accumulatedScore) {
        this.accumulatedScore = accumulatedScore;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @XmlTransient
    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    @XmlTransient
    public List<Oders> getOdersList() {
        return odersList;
    }

    public void setOdersList(List<Oders> odersList) {
        this.odersList = odersList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (customerID != null ? customerID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customers)) {
            return false;
        }
        Customers other = (Customers) object;
        if ((this.customerID == null && other.customerID != null) || (this.customerID != null && !this.customerID.equals(other.customerID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Models.Customers[ customerID=" + customerID + " ]";
    }
    
    
    
}
