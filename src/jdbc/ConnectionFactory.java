package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by dinis on 30/11/16.
 */
public class ConnectionFactory {

    public Connection getConnection() {
        try {
            return DriverManager.getConnection("jdbc:mysql://localhost/festivall", "root", "password");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}