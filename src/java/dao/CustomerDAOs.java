/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connector.Connector;
import function.DateConverter;
import function.MD5;
import model.Customers;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class CustomerDAOs {

    public static Customers checkLogin(String username, String password) {
        Connection con = Connector.getConnection();
        Customers customer = null;
        String sql = "SELECT * FROM Customers WHERE Username = ? AND Password = ?;";
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, username);
            pr.setString(2, MD5.encryptMD5(password));
            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                    customer = new Customers();
                    customer.setCustomerID(rs.getString("CustomerID"));
                    customer.setCustomerName(rs.getString("CustomerName"));
                    customer.setDoB(rs.getDate("DoB"));
                    customer.setAddress(rs.getString("Address"));
                    customer.setEmail(rs.getString("Email"));
                    customer.setPhoneNumber(rs.getString("PhoneNumber"));
                    customer.setAccumulatedScore(rs.getInt("AccumulatedScore"));
                    customer.setUsername(rs.getString("Username"));
                    customer.setPassword(rs.getString("Password"));
                    customer.setGender(rs.getString("Gender"));
                    customer.setStatus(rs.getString("Status")); 
                }
            }
        } catch (SQLException ex) {
        } finally {
            Connector.close(con);
        }
        return customer;
    }

    public static boolean insertCustomer(Customers customer) {
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "INSERT into Customers "
                + "(CustomerID, CustomerName, DoB, Address, Email, "
                + "PhoneNumber, Gender, Username, Password) "
                + "VALUES (?,?,?,?,?,?,?,?,?)";
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, customer.getCustomerID());
            pr.setString(2, customer.getCustomerName());
            pr.setDate(3, customer.getDoB());
            pr.setString(4, customer.getAddress());
            pr.setString(5, customer.getEmail());
            pr.setString(6, customer.getPhoneNumber());
            pr.setString(7, customer.getGender());
            pr.setString(8, customer.getUsername());
            pr.setString(9, MD5.encryptMD5(customer.getPassword()));
            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
            System.out.println(customer.getGender());
        } finally {
            Connector.close(con);
        }
        return (result != 0);
    }

    public static boolean updatePassword(String customerID, String password) {
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "UPDATE Customers SET Password = ? WHERE CustomerID= ?; ";
        try (PreparedStatement pr = con.prepareCall(sql)) {
            pr.setString(1, MD5.encryptMD5(password));
            pr.setString(2, customerID);
            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return (result != 0);
    }
    
    public static boolean activeAccount(String customerID){
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "UPDATE Customers SET Status = ? WHERE CustomerID= ?; ";
        try (PreparedStatement pr = con.prepareCall(sql)) {
            pr.setString(1, "Activated");  
            pr.setString(2, customerID);
            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return (result != 0);
    }

    public static boolean updateCustomer(Customers customer) {
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "UPDATE Customers SET CustomerName = ?, DoB = ?,"
                + " Address = ?, Email = ?, PhoneNumber = ?, Gender = ? WHERE CustomerID = ?;";
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, customer.getCustomerName());
            pr.setDate(2, customer.getDoB());
            pr.setString(3, customer.getAddress());
            pr.setString(4, customer.getEmail());
            pr.setString(5, customer.getPhoneNumber());
            pr.setString(6, customer.getGender());
            pr.setString(7, customer.getCustomerID());
            result = pr.executeUpdate();
            if (result != 0) {
                System.out.println("thànhcoong");
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return (result != 0);
    }

    public static boolean deleteCustomer(String customerID) {
        Connection con = Connector.getConnection();
        String sql = "DELETE FROM Customers WHERE CustomerID = ?;";
        int result = 0;
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, customerID);

            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return (result != 0);
    }

    public static Customers getCustomer(String input) {
        Customers customer = null;
        Connection conn = Connector.getConnection();
        //String sql="";
        String sql = "SELECT * FROM Customers WHERE CustomerID = '" + input + "' OR Username = '" + input + "';";
        try (PreparedStatement pr = conn.prepareStatement(sql);
                ResultSet rs = pr.executeQuery()) {
            while (rs.next()) {
                customer = new Customers();
                customer.setCustomerID(rs.getString("CustomerID"));
                customer.setCustomerName(rs.getString("CustomerName"));
                customer.setDoB(rs.getDate("DoB"));
                customer.setAddress(rs.getString("Address"));
                customer.setEmail(rs.getString("Email"));
                customer.setPhoneNumber(rs.getString("PhoneNumber"));
                customer.setAccumulatedScore(rs.getInt("AccumulatedScore"));
                customer.setUsername(rs.getString("Username"));
                customer.setGender(rs.getString("Gender"));
            }
        } catch (SQLException ex) {
        } finally {
            Connector.close(conn);
        }
        return customer;
    }

    public static ArrayList<Customers> getCustomers(String sql) {
        ArrayList<Customers> custommers = new ArrayList<>();
        Connection con = Connector.getConnection();
        try (PreparedStatement pr = con.prepareStatement(sql);
                ResultSet rs = pr.executeQuery()) {
            while (rs.next()) {
                String customerID = rs.getString("CustomerID");
                String customerName = rs.getString("CustomerName");
                Date customerDoB = rs.getDate("DoB");             
                String customerAdd = rs.getString("Address");
                String customerEmail = rs.getString("Email");
                String customerPhone = rs.getString("PhoneNumber");
                int customerScore = rs.getInt("AccumulatedScore");
                String customerUsername = rs.getString("Username");
                String gender=rs.getString("gender");
                custommers.add(new Customers(customerID, customerName, (java.sql.Date) customerDoB, customerAdd, customerEmail, customerPhone, customerScore, customerUsername,gender));
            }
        } catch (Exception ex) {
        } finally {
            Connector.close(con);
        }
        return custommers;
    }

    public static void main(String[] args) {
        Customers customers = new Customers();
        customers.setCustomerID("KMW001KL");
        customers.setCustomerName("chungcoi");
        customers.setAddress("hcmc");
        customers.setDoB(DateConverter.date("10-02-1994"));
        customers.setEmail("aaa@gmail.com");
        customers.setGender("nữ");
        if (CustomerDAOs.updateCustomer(customers)) {
            System.out.println("thànhcoong");
        } else {
            System.out.println("thất bại");
        }
    }

}
