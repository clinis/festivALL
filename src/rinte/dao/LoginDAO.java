package rinte.dao;

import rinte.model.Login;
import rinte.util.Database;
import java.sql.*;

public class LoginDAO {
    private static Connection connection;

    public LoginDAO() {
        connection = Database.getConnection();
    }


    public int login(Login usr) {
        int uID = -1;
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
            ps.setString(1, usr.getUsername());
            ps.setString(2, usr.getPassword());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) { // found
                System.out.println("Welcome "+ usr.getUsername());
                uID = rs.getInt("u_id");
            } else {
                System.out.println("Sorry, you are not a registered user! Please sign up first");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return uID;
    }

    public Login getUserByID(int uID){
        Login user = new Login();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM users WHERE u_id=?");
            ps.setInt(1, uID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user.setU_id(rs.getInt("u_id"));
                user.setIsadmin(rs.getShort("isadmin"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
