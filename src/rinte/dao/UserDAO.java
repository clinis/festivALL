package rinte.dao;

import rinte.model.User;
import rinte.util.Database;

import java.text.*;
import java.util.*;
import java.sql.*;

public class UserDAO {
    private static Connection connection;

    public UserDAO() {
        connection = Database.getConnection();
    }


    /*public static User login(User usr) {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM users2 WHERE username = ? AND password = ?");
            ps.setString(1, usr.getUsername());
            ps.setString(2, usr.getPassword());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) { // found
                System.out.println("Welcome "+ usr.getUsername());
                usr.setValid(true);
            } else {
                System.out.println("Sorry, you are not a registered user! Please sign up first");
                usr.setValid(false);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usr;
    }*/

    public boolean login(User usr) {
        boolean r = false;
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM users2 WHERE username = ? AND password = ?");
            ps.setString(1, usr.getUsername());
            ps.setString(2, usr.getPassword());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) { // found
                System.out.println("Welcome "+ usr.getUsername());
                r = true;
            } else {
                System.out.println("Sorry, you are not a registered user! Please sign up first");
                r = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public User getUserByUsername(String uname){
        User user = new User();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM users2 WHERE username=?");
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user.setU_id(rs.getInt("u_id"));
                user.setUsername(rs.getString("username"));
                user.setLevel(rs.getShort("level"));
                user.setRegisteredon(rs.getDate("registeredon"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
}
