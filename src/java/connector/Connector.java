/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connector;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

/**
 *
 * @author ADMIN chay chua day/
 */
public class Connector {

    private static final String DRIVER_CLASS_NAME = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=Tivi";
    private static final String DB_USER = "User"; // Username để kết nối database
    private static final String DB_PASSWORD = "Password";  // password kết nối database

    private static final int CONN_POOL_INIT_SIZE = 10;
    private static final int CONN_POOL_MAX_SIZE = 50;

    private final BasicDataSource basicDataSource = new BasicDataSource();
    private static final Connector INSTANCE = new Connector();

    private Connector() {
        init();
    }

    private void init() {
        basicDataSource.setDriverClassName(DRIVER_CLASS_NAME);
        basicDataSource.setUrl(DB_URL);
        basicDataSource.setUsername(DB_USER);
        basicDataSource.setPassword(DB_PASSWORD);
        basicDataSource.setInitialSize(CONN_POOL_INIT_SIZE);
        basicDataSource.setMaxIdle(CONN_POOL_MAX_SIZE);
    }

    private static Connector getInstance() {
        return INSTANCE;
    }

    private static BasicDataSource getBasicDataSource() {
        return getInstance().basicDataSource;
    }

    public static Connection getConnection() {
        Connection connection = null;
        try {
            connection = Connector.getBasicDataSource().getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(Connector.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connection;
    }

    public static void close(Connection connection) {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException ex) {
        }
    }

}
