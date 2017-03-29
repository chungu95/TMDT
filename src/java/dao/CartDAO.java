/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connector.Connector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;

/**
 *
 * @author seuti
 */
public class CartDAO {

    public static boolean InsertCart(String ProductID, String ProductName, int Price, int Quanity, String CustomerID) {
        Connection con = Connector.getConnection();
        String sql = "Insert into dbo.Cart values (?,?,?,?,?)";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, ProductID);
            ps.setString(2, ProductName);
            ps.setInt(3, Price);
            ps.setInt(4, Quanity);
            ps.setString(5, CustomerID);
            ps.execute();
            con.close();
            return true;
        } catch (SQLException ex) {
          
            return false;

        }

    }

    public static boolean DelCart(String ProductID, String CustomerID) {
        Connection con = Connector.getConnection();
        String sql = "Delete from dbo.Cart where ProductID=? and CustomerID=?";

        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, ProductID);
            ps.setString(2, CustomerID);
            ps.execute();
            con.close();
            return true;
        } catch (SQLException ex) {
            
            return false;
        }

    }

    public static ArrayList<Cart> getListCart(String CustomerID) {
        Connection con = Connector.getConnection();
        String sql = "SELECT* FROM dbo.Cart where CustomerID='" + CustomerID + "' ";

        ArrayList<Cart> arr = new ArrayList<>();
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart sp = new Cart();
                sp.setPrice(rs.getInt("Price"));
                sp.setProductID(rs.getString("ProductID"));
                sp.setQuantity(rs.getInt("Quantity"));
                sp.setCustomerID(rs.getString("CustomerID"));
                sp.setProductName(rs.getString("ProductName"));
                arr.add(sp);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
        
    }
    public static boolean DelCartall(String CustomerID){
                Connection con = Connector.getConnection();
                String sql = "DELETE  FROM dbo.Cart where CustomerID ='" + CustomerID + "'"; 
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.execute();
            con.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            return false;
        }
    }

    ;

  

}
