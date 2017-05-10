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
import java.util.ArrayList;
import model.OderDetails;
import model.Oders;

/**
 *
 * @author ADMIN
 */
public class OderDetailDAO {
    
    public static boolean insertOderDetail(OderDetails oderDetail){
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "INSERT into OderDetails "
                + "(OderID, ProductID, Quantity, Price) "
                + "VALUES (?,?,?,?)";
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, oderDetail.getOderID());
            pr.setString(2, oderDetail.getProductID()); 
            pr.setInt(3, oderDetail.getQuantity());
            pr.setInt(4, oderDetail.getPrice()); 
            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return (result!=0);
    }

    public static ArrayList<OderDetails> getOderDetailByID(String id) {
        ArrayList<OderDetails> oderDetail = new ArrayList<>(); 
        Connection con = Connector.getConnection();
        String sql = "Select * from OderDetails Where OderID = ?";
        try (PreparedStatement pr = con.prepareCall(sql)) {
            pr.setString(1, id); 
            try(ResultSet rs = pr.executeQuery()){
                while(rs.next()){
                    String oderID = rs.getString("OderID");
                    String productID = rs.getString("ProductID");
                    int quantity = rs.getInt("Quantity");
                    int price = rs.getInt("Price");
                    oderDetail.add(new OderDetails(oderID, productID, quantity, price)); 
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return oderDetail;
    }
    public static OderDetails getOderDetail(String OderID){
        OderDetails oderDetail=null;
        Connection conn = Connector.getConnection();
        String sql= "SELECT * FROM OderDetails WHERE OderID = ? ";
         try (PreparedStatement pr = conn.prepareStatement(sql)) {
            pr.setString(1, OderID);
            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                     oderDetail = new OderDetails();
                     oderDetail.setOderID(OderID);
                   oderDetail.setProductID(rs.getString("ProductID"));
                    oderDetail.setQuantity(rs.getInt("Quantity"));
                    oderDetail.setPrice(rs.getInt("Price"));                   
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(conn);
        }
        return oderDetail;
    }
    public static void main(String[] args) {
        ArrayList<OderDetails> oder = OderDetailDAO.getOderDetailByID("12345678");
        oder.forEach((item)->{
            System.out.println(item.getOderID()+" | "+item.getProductID()+ " | "+item.getQuantity()); 
        }); 
    }

}
