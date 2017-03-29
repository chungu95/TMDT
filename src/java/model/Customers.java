 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Customers implements Serializable {

    private String customerID;
    private String customerName;
    private Date doB;
    private String address;
    private String email;
    private String phoneNumber;
    private Integer accumulatedScore;
    private String username;
    private String password;
    private List<Comment> commentList;
    private List<Oders> odersList;
    private String gender;

    public Customers() {
    }

    public Customers(String customerID, String customerName, Date doB, String address, String email, String phoneNumber, String username, String password, String gender) {
        this.customerID = customerID;
        this.customerName = customerName;
        this.doB = doB;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.username = username;
        this.password = password;
        this.gender = gender;
    }

    public Customers(String customerID, String customerName, Date doB, String address, String email, String phoneNumber, String gender) {
        this.customerID = customerID;
        this.customerName = customerName;
        this.doB = doB;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
    }

    
    
    
    
     public Customers(String customerID, String customerName, Date doB, String address, String email, String phoneNumber, String username,  String gender) {
        this.customerID = customerID;
        this.customerName = customerName;
        this.doB = doB;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.username = username;
        
    }

    public Customers(String customerID, String customerName, Date doB, String address, String customerEmail, String phoneNumber, Integer accumulatedScore, String username) {
        this.customerID = customerID;
        this.customerName = customerName;
        this.doB = doB;
        this.address = address;
        this.email = customerEmail;
        this.phoneNumber = phoneNumber;
        this.accumulatedScore = accumulatedScore;
        this.username = username;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
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

    public Integer getAccumulatedScore() {
        return accumulatedScore;
    }

    public void setAccumulatedScore(Integer accumulatedScore) {
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

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

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
        return "model.Customers[ customerID=" + customerID + " ]";
    }

}
