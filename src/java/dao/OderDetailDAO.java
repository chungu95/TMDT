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

/**
 *
 * @author ADMIN
 */
public class OderDetailDAO {

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

    public static void main(String[] args) {
        ArrayList<OderDetails> oder = OderDetailDAO.getOderDetailByID("12345678");
        oder.forEach((item)->{
            System.out.println(item.getOderID()+" | "+item.getProductID()+ " | "+item.getQuantity()); 
        }); 
    }

}
