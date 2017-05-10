/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connector.Connector;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Oders;
import function.DateConverter;

/**
 *
 * @author DELL
 */
public class OrderDAO {

    public static ArrayList<String> getOrderStatus() {
        ArrayList<String> oders = new ArrayList<>();
        Connection con = Connector.getConnection();
        String sql = "Select DISTINCT Status from Oders;";
        try (PreparedStatement pr = con.prepareCall(sql);
                ResultSet rs = pr.executeQuery()) {
            while (rs.next()) {
                String status = rs.getString("Status");
                oders.add(status);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return oders;
    }

    public static ArrayList<Oders> getOrderByStatus(String status) {
        ArrayList<Oders> order = new ArrayList<>();
        Connection con = Connector.getConnection();
        String sql = "SELECT * FROM Oders WHERE Status = ?;";
        try (PreparedStatement pr = con.prepareCall(sql)) {
            pr.setString(1, status);
            try (ResultSet rs = pr.executeQuery()) {
                while (rs.next()) {
                    String OderID = rs.getString("OderID");
                    String CustomerID = rs.getNString("CustomerID");
                    Date OderDate = rs.getDate("OderDate");
                    Date ShipDate = rs.getDate("ShipDate");
                    int Price = (rs.getInt("OderPrice"));
                    String PaymentMethod = rs.getString("PaymentMethod");
                    String DeliveryAddress = rs.getString("DeliveryAddress");
                    String Status = rs.getString("Status");
                    String employeeID = rs.getString("EmployeeID");
                    String deliveryPhone = rs.getString("DeliveryPhone");
                    order.add(new Oders(OderID, (java.sql.Date) OderDate, (java.sql.Date) ShipDate, Price, PaymentMethod, DeliveryAddress, deliveryPhone, Status, CustomerID, employeeID));
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return order;
    }

    public static ArrayList<Oders> getProductsByProduceID(String EmployeeID) {
        ArrayList<Oders> oder = new ArrayList<>();
        Connection con = Connector.getConnection();
        String sql = "SELECT * FROM Oders WHERE EmployeeID = ?";
        try (PreparedStatement pr = con.prepareCall(sql)) {
            pr.setString(1, EmployeeID);
            try (ResultSet rs = pr.executeQuery()) {
                while (rs.next()) {
                    String OderID = rs.getString("OderID");
                    String CustomerID = rs.getNString("CustomerID");
                    Date OderDate = rs.getDate("OderDate");
                    Date ShipDate = rs.getDate("ShipDate");
                    int Price = (rs.getInt("OderPrice"));
                    String PaymentMethod = rs.getString("PaymentMethod");
                    String DeliveryAddress = rs.getString("DeliveryAddress");
                    String Status = rs.getString("Status");
                    String employeeID = rs.getString("EmployeeID");
                    String deliveryPhone = rs.getString("DeliveryPhone");
                    oder.add(new Oders(OderID, (java.sql.Date) OderDate, (java.sql.Date) ShipDate, Price, PaymentMethod, DeliveryAddress, deliveryPhone, Status, CustomerID, employeeID));
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return oder;
    }

    public static void main(String[] args) {
        ArrayList<String> produce = OrderDAO.getOrderStatus();
        produce.forEach((item) -> {
            System.out.println(item.toString());
        });
    }
}
