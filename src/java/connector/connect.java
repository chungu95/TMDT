/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class connect {

    private Connection con;

    public connect() {
        init();
    }

    public Connection getCon() {
        return con;
    }

    private void init() {
        try {
            String Username = "sa";
            String password = "DEADLINE";
            String DBName = "Tivi";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=" + DBName + ";";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            this.con = DriverManager.getConnection(url, Username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }

    public void closeCon() {
        try {
            this.con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}
