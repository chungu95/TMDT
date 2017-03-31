/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connector.Connector;
import function.MD5;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Employees;

/**
 *
 * @author Hoang
 */
public class EmployeeDAOs {
    
public static Employees checkLoginAD(String username, String password) {
        Connection con = Connector.getConnection();
        Employees epl = null;
        String sql = "SELECT * FROM Employees WHERE Username = ? AND Password = ?;";
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, username);
            pr.setString(2, MD5.encryptMD5(password));
            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                    epl = new Employees();
                    epl.setEmployeeID(rs.getString("EmployeeID"));
                    epl.setUsername(rs.getString("Usermame"));
                    epl.setPassword(rs.getString("Password"));
                    epl.setRole(rs.getString("Role"));
                    epl.setName(rs.getString("Name"));                   
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex); 
        } finally {
            Connector.close(con);
        }
        return epl;
    }    
    


    
}
