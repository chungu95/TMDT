/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connector.Connector;
import function.MD5;
import function.RandomKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Employees;

/**
 *
 * @author ADMIN
 */
public class EmployeeDAO {

    @SuppressWarnings("null")
    public static Employees getEmployeeByID(String employeeID) {
        Employees employee = null;
        Connection conn = Connector.getConnection();
        String sql = "SELECT * FROM Employees WHERE EmployeeID = ? ";
        try (PreparedStatement pr = conn.prepareStatement(sql)) {
            pr.setString(1, employeeID);
            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                    employee.setEmployeeID(employeeID);
                    employee.setUsername(rs.getString("Username"));
                    employee.setPassword(rs.getString("Password"));
                    employee.setRole(rs.getString("Role"));
                    employee.setName(rs.getString("Name"));
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(conn);
        }
        return employee;
    }
    
    public static ArrayList<Employees> getAllEmployeesSale() {
        ArrayList<Employees> employees = new ArrayList<>();
        Connection con = Connector.getConnection();
        String sql = "SELECT * FROM Employees WHERE Role ='sale' AND NOT Note like 'đã xóa';";
        try (PreparedStatement pr = con.prepareStatement(sql);
                ResultSet rs = pr.executeQuery()) {
            while (rs.next()) {
                String employeeID = rs.getString("EmployeeID");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                String Role = rs.getString("Role");
                String Name = rs.getString("Name");
                employees.add(new Employees(employeeID, Username, Password, Role, Name));
            }
        } catch (Exception ex) {
        } finally {
            Connector.close(con);
        }
        return employees;
    }
    
    public static ArrayList<Employees> getAllEmployees() {
        ArrayList<Employees> employees = new ArrayList<>();
        Connection con = Connector.getConnection();
        String sql = "SELECT * FROM Employees where Note != 'đã xóa' ORDER BY Role;";
        try (PreparedStatement pr = con.prepareStatement(sql);
                ResultSet rs = pr.executeQuery()) {
            while (rs.next()) {
                String employeeID = rs.getString("EmployeeID");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                String Role = rs.getString("Role");
                String Name = rs.getString("Name");
                employees.add(new Employees(employeeID, Username, Password, Role, Name));
            }
        } catch (Exception ex) {
        } finally {
            Connector.close(con);
        }
        return employees;
    }

    public static boolean updatePass(String employeeID, String password) {
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "UPDATE Employees SET Password = ? WHERE EmployeeID= ?; ";
        try (PreparedStatement pr = con.prepareCall(sql)) {
            pr.setString(1, MD5.encryptMD5(password));
            pr.setString(2, employeeID);
            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return (result != 0);
    }

    public static boolean updateEmployee(Employees employee) {
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "UPDATE Employees SET Role = ?, Name = ?, Username = ? WHERE EmployeeID = ?;";
        employee.setPassword(MD5.encryptMD5(employee.getPassword()));
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, employee.getRole());
            pr.setString(2, employee.getName());
            pr.setString(3, employee.getUsername());
//            pr.setString(4, employee.getPassword());
            pr.setString(4, employee.getEmployeeID());
            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return (result != 0);
    }

    public static Employees getEmployees(String input) {
        Employees emp = null;
        Connection conn = Connector.getConnection();
        String sql = "SELECT * FROM Employees WHERE EmployeeID= '" + input + "' OR Username = '" + input + "';";
        try (PreparedStatement pr = conn.prepareStatement(sql);
                ResultSet rs = pr.executeQuery()) {
            while (rs.next()) {
                emp = new Employees();
                emp.setEmployeeID(rs.getString("EmployeeID"));
                emp.setUsername(rs.getString("Username"));
                emp.setRole(rs.getString("Role"));
                emp.setName(rs.getString("Name"));
            }
        } catch (SQLException ex) {
        } finally {
            Connector.close(conn);
        }
        return emp;
    }

    public static boolean insertEmployee(Employees employee) {
        int result = 0;
        Connection con = Connector.getConnection();
        String sql = "INSERT into Employees "
                + "(EmployeeID, Username, Password, Role, Name) "
                + "VALUES (?,?,?,?,?)";
        employee.setEmployeeID(RandomKey.randomKey());
        employee.setPassword(MD5.encryptMD5(employee.getPassword()));
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, employee.getEmployeeID());
            pr.setString(2, employee.getUsername());
            pr.setString(3, employee.getPassword());
            pr.setString(4, employee.getRole());
            pr.setString(5, employee.getName());
            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return (result != 0);
    }

    public static boolean deleteEmployee(String employeeID) {
          int result = 0;
        Connection con = Connector.getConnection();
        String sql ="UPDATE Employees SET Note= ? WHERE EmployeeID = ?;";
       
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1,"đã xóa");
            pr.setString(2, employeeID);          
            result = pr.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return (result != 0);
    }

    public static Employees checkLoginEmployee(String username, String password) {
        Employees employee = null;
        Connection con = Connector.getConnection();
        String sql = "SELECT EmployeeID, Role, Name FROM Employees WHERE Username = ? AND Password = ?;";
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, username);
            pr.setString(2, MD5.encryptMD5(password));
            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                    employee = new Employees();
                    employee.setEmployeeID(rs.getString("EmployeeID"));
                    employee.setRole(rs.getString("Role"));
                    employee.setName(rs.getString("Name"));
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            Connector.close(con);
        }
        return employee;
    }

    public static void main(String[] args) {
//        if (deleteEmployee("3T1MUGIX")) {
//            System.out.println("thành công!");
//        } else {
//            System.out.println("Thất bại!");
//        }
for (Employees v : new EmployeeDAO().getAllEmployees()) {
            System.out.println(v.getEmployeeID() + "- " + v.getName());
        }

    }

}
