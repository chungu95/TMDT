/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connector;

import java.sql.Connection;
import java.sql.SQLException;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;


/**
 *
 * @author ADMIN chay chua day/
 */
public class Connector {

    private static final String DRIVER_CLASS_NAME = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=Tivi";
    private static final String DB_USER = "sa";
    private static final String DB_PASSWORD = "DEADLINE"; 
    private static final int CONN_POOL_INIT_SIZE = 10;
    private static final int CONN_POOL_MAX_SIZE = 50;

    private static BasicDataSource basicDataSource = new BasicDataSource();

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

    private static class ConnectorHolder {

        private static final Connector INSTANCE = new Connector();
    }

    public static Connector getInstance() {
        return ConnectorHolder.INSTANCE;
    }

    public static BasicDataSource getBasicDataSource() {
        return getInstance().basicDataSource;
    }

    public static Connection getConnection() {
        Connection connection = null;
        try {
            connection = Connector.getBasicDataSource().getConnection();
        } catch (SQLException ex) {
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
