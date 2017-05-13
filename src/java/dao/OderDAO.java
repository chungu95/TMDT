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
import model.OderDetails;
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
            pr.setString(5, oder.getOderPrice() + "");
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
            for (int i = 0; i < oder.getOderDetailsList().size(); i++) {
                if (!OderDetailDAO.insertOderDetail(oder.getOderDetailsList().get(i))) {
                    deleteOder(oder.getOderDetailsList().get(i).getOderID());
                }
            }
        }
        return (result != 0);
    }

    @SuppressWarnings("null")
    public static Oders getOrderByID(String OrderID) {
        Oders order = null;
        Connection conn = Connector.getConnection();
        String sql = "SELECT * FROM Oders WHERE OderID =?";
        try (PreparedStatement pr = conn.prepareStatement(sql)) {
            pr.setString(1, OrderID);
            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                    order = new Oders(OrderID);
                    order.setOderID(rs.getString("OderID"));
                    order.setCustomerID(rs.getString("CustomerID"));
                    order.setOderDate(rs.getDate("OderDate"));
                    order.setShipDate(rs.getDate("ShipDate"));
                    order.setPrice(rs.getInt("OderPrice"));
                    order.setPaymentMethod(rs.getString("PaymentMethod"));
                    order.setDeliveryAddress(rs.getString("DeliveryAddress"));
                    order.setStatus(rs.getString("Status"));
                    order.setEmployeeID(rs.getString("EmployeeID"));
                    order.setDeliveryPhone(rs.getString("DeliveryPhone"));
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(conn);
        }
        order.setOderDetail(OderDetailDAO.getOderDetail(OrderID));
        return order;
    }

    public static boolean updateOrder(String orderID, String employeeID, String status) {
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "UPDATE Oders SET EmployeeID = ?, Status = ? WHERE OderID = ? ;";
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, employeeID);
            pr.setString(2, status);
            pr.setString(3, orderID);
            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return (result != 0);
    }

    public static boolean updateOrder(String orderID, String status) {
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "UPDATE Oders SET Status = ? WHERE OderID = ? ;";
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, status);
            pr.setString(2, orderID);
            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
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
                ArrayList<OderDetails> oderDetail = OderDetailDAO.getOderDetailByID(oderID);
                oders.add(new Oders(oderID, oderDate, shipDate, oderPrice, paymentMethod, deliveryAddress, deliveryPhone, status, customerID, employeeID, oderDetail));
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return oders;
    }

    public static ArrayList<Oders> getAllOrderByCustomerID(String id) {
        ArrayList<Oders> oders = new ArrayList<>();
        Connection con = Connector.getConnection();
        String sql = "Select * from Oders WHERE CustomerID = '" + id + "' ORDER BY Status;";
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
                ArrayList<OderDetails> oderDetail = OderDetailDAO.getOderDetailByID(oderID);
                oders.add(new Oders(oderID, oderDate, shipDate, oderPrice, paymentMethod, deliveryAddress, deliveryPhone, status, customerID, employeeID, oderDetail));
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return oders;
    }

}
