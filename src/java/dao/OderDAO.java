/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connector.Connector;
import function.RandomKey;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Oders;

/**
 *
 * @author ADMIN
 */
public class OderDAO {

    public static boolean insertOder(Oders oder) {
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "INSERT into Oders "
                + "(OderID, CustomerID, OderDate, ShipDate, OderPrice, PaymentMethod, DeliveryAddress, Status, EmployeeID, DeliveryPhone) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?)";
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, oder.getOderID());
            pr.setString(2, oder.getCustomerID());
            pr.setDate(3, oder.getOderDate());
            pr.setDate(4, oder.getShipDate());
            pr.setInt(5, oder.getOderPrice());
            pr.setString(6, oder.getPaymentMethod());
            pr.setString(7, oder.getDeliveryAddress());
            pr.setString(8, oder.getStatus());
            pr.setString(9, oder.getEmployeeID());
            pr.setString(10, oder.getDeliveryPhone());
            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        if (result != 0) {
//            oder.getOderDetailsList().forEach((item -> {
//                if (!OderDetailDAO.insertOderDetail(item)) {
//                    deleteOder(item.getOderID());
//                }
//            }));
      for(int i=0; i<oder.getOderDetailsList().size();i++){
          if (!OderDetailDAO.insertOderDetail(oder.getOderDetailsList().get(i))) {
                  deleteOder(oder.getOderDetailsList().get(i).getOderID());
               } 
      }
        }
        return (result != 0);
    }

    public static boolean deleteOder(String oderID) {
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "DELETE FROM Oders WHERE OderID = ?";
        try (PreparedStatement pr = con.prepareCall(sql)) {
            pr.setString(1, oderID);
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return (result != 0);
    }

    public static ArrayList<Oders> getAllOders() {
        ArrayList<Oders> oders = new ArrayList<>();
        Connection con = Connector.getConnection();
        String sql = "Select * from Oders;";
        try (PreparedStatement pr = con.prepareCall(sql);
                ResultSet rs = pr.executeQuery()) {
            while (rs.next()) {
                String oderID = rs.getString("OderID");
                String customerID = rs.getString("CustomerID");
                Date oderDate = rs.getDate("OderDate");
                Date shipDate = rs.getDate("ShipDate");
                int oderPrice = rs.getInt("OderPrice");
                String paymentMethod = rs.getString("PaymentMethod");
                String deliveryAddress = rs.getString("DeliveryAddress");
                String deliveryPhone = rs.getString("DeliveryPhone");
                String status = rs.getString("Status");
                String employeeID = rs.getString("EmployeeID");
                oders.add(new Oders(oderID, oderDate, shipDate, oderPrice, paymentMethod, deliveryAddress, deliveryPhone, status, customerID, employeeID));
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return oders;
    }
    
    public static void main(String[] args) {
        
    }
    
}
