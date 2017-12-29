package rinte.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://localhost/festivall?useUnicode=yes&amp;characterEncoding=UTF-8";
            if(System.getenv("JDBC_URL") != null) { /* If Database URL specified in ENV, use it. Useful for Docker. */
                url = System.getenv("JDBC_URL");
            }
            String user = "root";
            String password = "password";

            return DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            System.out.println("Database.getConnection() Error:" + e.getMessage());
            throw new RuntimeException(e);
        }
    }

    public static void close(Connection con) {
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}