package rinte.dao;

import rinte.model.Band;
import rinte.model.Event;
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
            PreparedStatement ps = connection.prepareStatement("INSERT INTO users(username, email, password, name, birthdate, city) values(?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, usr.getUsername());
            ps.setString(2, usr.getEmail());
            ps.setString(3, usr.getPassword());
            ps.setString(4, usr.getName());
            ps.setDate(5, new java.sql.Date(usr.getBirthdate().getTime()));
            ps.setString(6, usr.getCity());
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

    public void updateUser(User usr) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE users SET name=?, email=?, birthdate=?, city=?  WHERE u_id=?");
            preparedStatement.setString(1, usr.getName());
            preparedStatement.setString(2, usr.getEmail());
            preparedStatement.setDate(3, new java.sql.Date(usr.getBirthdate().getTime()));
            preparedStatement.setString(4, usr.getCity());
            preparedStatement.setInt(5, usr.getU_id());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addUserBand(int userID, int bandID) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO user_bands(u_id, b_id) VALUES(?, ?)");
            ps.setInt(1, userID);
            ps.setInt(2, bandID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeUserBand(int userID, int bandID) {
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM user_bands WHERE u_id=? AND b_id=?");
            ps.setInt(1, userID);
            ps.setInt(2, bandID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addUserEvent(int userID, int eventID) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO user_events(u_id, e_id) VALUES(?, ?)");
            ps.setInt(1, userID);
            ps.setInt(2, eventID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeUserEvent(int userID, int eventID) {
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM user_events WHERE u_id=? AND e_id=?");
            ps.setInt(1, userID);
            ps.setInt(2, eventID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
                user.setEmail(rs.getString("email"));
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

    public List<Band> getBandsInUser(int userID) {
        List<Band> bandsInUser = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement("SELECT name, b_id, artists FROM bands WHERE EXISTS ( SELECT * FROM user_bands WHERE bands.b_id = user_bands.b_id AND user_bands.u_id = ? ) AND bands.isdeleted = 0");
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Band band = new Band();

                band.setB_id(rs.getInt("b_id"));
                band.setName(rs.getString("name"));
                band.setArtists(rs.getString("artists"));

                bandsInUser.add(band);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bandsInUser;
    }

    public List<Band> getBandsNotInUser(int userID) {
        List<Band> bandsNotInUser = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement("SELECT b_id, name FROM bands WHERE NOT EXISTS( SELECT * FROM user_bands WHERE bands.b_id = user_bands.b_id AND user_bands.u_id = ? ) AND bands.isdeleted = 0");
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Band band = new Band();

                band.setB_id(rs.getInt("b_id"));
                band.setName(rs.getString("name"));

                bandsNotInUser.add(band);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bandsNotInUser;
    }

    public List<Event> getEventsInUser(int userID) {
        List<Event> eventsInUser = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement("SELECT e_id, name, date, place FROM events WHERE EXISTS ( SELECT * FROM user_events WHERE events.e_id = user_events.e_id AND user_events.u_id = ? )");
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Event event = new Event();

                event.setE_id(rs.getInt("e_id"));
                event.setName(rs.getString("name"));
                event.setDate(rs.getDate("date"));
                event.setPlace(rs.getString("place"));

                eventsInUser.add(event);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return eventsInUser;
    }

    public List<Event> getEventsNotInUser(int userID) {
        List<Event> eventsNotInUser = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement("SELECT e_id, name FROM events WHERE NOT EXISTS( SELECT * FROM user_events WHERE events.e_id = user_events.e_id AND user_events.u_id = ? )");
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Event event = new Event();

                event.setE_id(rs.getInt("e_id"));
                event.setName(rs.getString("name"));

                eventsNotInUser.add(event);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return eventsNotInUser;
    }
}
