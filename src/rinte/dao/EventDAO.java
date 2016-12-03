package rinte.dao;

import rinte.model.Event;
import rinte.util.Database;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventDAO {
    private Connection connection;

    public EventDAO() {
        connection = Database.getConnection();
    }


    public void checkEvent(Event evt) {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT name FROM events WHERE e_id = ?");
            ps.setInt(1, evt.getE_id());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) { // found
                updateEvent(evt);
            } else {
                addEvent(evt);
            }
        } catch (Exception ex) {
            System.out.println("Error in check() :" + ex.getMessage());
        }
    }
    public void addEvent(Event evt) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO events(type, name, date, city, local) values (?, ?, ?, ?, ? )");
            preparedStatement.setShort(1, evt.getType());
            preparedStatement.setString(2, evt.getName());
            preparedStatement.setDate(3, new java.sql.Date(evt.getDate().getTime()));
            preparedStatement.setString(4, evt.getCity());
            preparedStatement.setString(5, evt.getLocal());
            //preparedStatement.setDate(6, new java.sql.Date(evt.getRegisteredon().getTime()));
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteEvent(int eventID) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE events SET isdeleted=1 WHERE e_id=?");
            preparedStatement.setInt(1, eventID);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateEvent(Event evt) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE events SET type=?, name=?, date=?, city=?, local=? WHERE e_id=?");
            preparedStatement.setShort(1, evt.getType());
            preparedStatement.setString(2, evt.getName());
            preparedStatement.setDate(3, new java.sql.Date(evt.getDate().getTime()));
            preparedStatement.setString(4, evt.getCity());
            preparedStatement.setString(5, evt.getLocal());
            preparedStatement.setInt(6, evt.getE_id());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Event> getAllEvents() {
        List<Event> events = new ArrayList<Event>();
        try {
            Statement ps = connection.createStatement();
            ResultSet rs = ps.executeQuery("SELECT * FROM events WHERE isdeleted=0");
            while (rs.next()) {
                Event event = new Event();
                event.setE_id(rs.getInt("e_id"));
                event.setType(rs.getShort("type"));
                event.setName(rs.getString("name"));
                event.setDate(rs.getDate("date"));
                event.setCity(rs.getString("city"));
                event.setLocal(rs.getString("local"));
                event.setRegisteredon(rs.getDate("registeredon"));
                events.add(event);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }

    public Event getEventByID(int eventID) {
        Event event = new Event();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM events WHERE e_id=?");
            ps.setInt(1, eventID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                event.setE_id(rs.getInt("e_id"));
                event.setType(rs.getShort("type"));
                event.setName(rs.getString("name"));
                event.setDate(rs.getDate("date"));
                event.setCity(rs.getString("city"));
                event.setLocal(rs.getString("local"));
                event.setRegisteredon(rs.getDate("registeredon"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return event;
    }
}
