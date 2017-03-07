/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connector.Connector;
import model.Customers;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.commons.dbcp2.PoolableConnection;

/**
 *
 * @author ADMIN
 */
public class CustomerDAOs {

    public static Customers getCustomer(String customerID) {
        Customers customer = new Customers();
        Connection conn = Connector.getConnec();
        String sql = "SELECT * FROM Customers WHERE CustomerID = '" + customerID + "';";
        try (PreparedStatement pr = conn.prepareStatement(sql);
                ResultSet rs = pr.executeQuery()) {
            while (rs.next()) {
                customer.setCustomerID(customerID);
                customer.setCustomerName(rs.getString("CustomerName"));
                customer.setDoB(rs.getDate("DoB"));
                customer.setAddress(rs.getString("Address"));
                customer.setEmail(rs.getString("Email"));
                customer.setPhoneNumber(rs.getString("PhoneNumber"));
                customer.setAccumulatedScore("AccumulatedScore");
                customer.setUsername("Username");
            }
        } catch (SQLException ex) {
        } finally {
            Connector.close(conn);
        }
        return customer;
    }

    public static void main(String args[]) {

        new Thread(() -> {
            for (int i = 0; i < 300000; i++) {
                Customers cus = CustomerDAOs.getCustomer("1234");
                System.out.println(cus.getCustomerName() + (i + 23));
            }
        }).start();

        new Thread(() -> {
            for (int i = 0; i < 300000; i++) {
                Customers cus = CustomerDAOs.getCustomer("1234");
                System.out.println(cus.getCustomerName() + i);
            }
        }).start();

        new Thread(() -> {
            for (int i = 0; i < 300000; i++) {
                Customers cus = CustomerDAOs.getCustomer("1234");
                System.out.println(cus.getCustomerName() + "134");
            }
        }).start();

        new Thread(() -> {
            for (int i = 0; i < 100000; i++) {
                Customers cus = CustomerDAOs.getCustomer("1234");
                System.out.println(cus.getCustomerName() + i + "abc");
            }
        }).start();
    }

}
