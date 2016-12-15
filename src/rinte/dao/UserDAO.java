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


    public int createUser(User usr) {
        int uID = -1;
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO users(username, password, name, birthdate, city) values(?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, usr.getUsername());
            ps.setString(2, usr.getPassword());
            ps.setString(3, usr.getName());
            ps.setDate(4, new java.sql.Date(usr.getBirthdate().getTime()));
            ps.setString(5, usr.getCity());
            ps.executeUpdate();

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    uID = generatedKeys.getInt(1);
                    System.out.println(uID);
                } else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return uID;
    }

    public boolean login(User usr) {
        boolean r = false;
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
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

    public User getUserByID(int uID){
        User user = new User();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM users WHERE u_id=?");
            ps.setInt(1, uID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user.setU_id(rs.getInt("u_id"));
                user.setUsername(rs.getString("username"));
                user.setIsadmin(rs.getShort("isadmin"));
                user.setName(rs.getString("name"));
                user.setBirthdate(rs.getDate("birthdate"));
                user.setCity(rs.getString("city"));
                user.setRegisteredon(rs.getDate("registeredon"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public User getUserByUsername(String uname){
        User user = new User();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM users WHERE username=?");
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user.setU_id(rs.getInt("u_id"));
                user.setUsername(rs.getString("username"));
                user.setIsadmin(rs.getShort("isadmin"));
                user.setRegisteredon(rs.getDate("registeredon"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
