/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class Connector {

    /**
     * Connect to database
     * 
     * @param args the command line arguments
     */
    
    private Connection con;
    
    private final String Username = "sa";
    private final String password = "DEADLINE";
    private final String DBName = "Tivi";

    public Connector() {
    }
    
    public void  openConnect(){
        try {
            String url = "jdbc:sqlserver://localhost:1433;databaseName=" + this.DBName + ";";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            this.con = DriverManager.getConnection(url, this.Username, this.password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
    
    public static void main(String[] args) {
    }
    
}
