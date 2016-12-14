package rinte.dao;

import rinte.model.Band;
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
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO events(type, name, date, city, local) VALUES(?, ?, ?, ?, ? )");
            preparedStatement.setShort(1, evt.getType());
            preparedStatement.setString(2, evt.getName());
            preparedStatement.setDate(3, new java.sql.Date(evt.getDate().getTime()));
            preparedStatement.setString(4, evt.getCity());
            preparedStatement.setString(5, evt.getLocal());
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

    public void addEventBand(int eventID, int bandID) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO events_bands(e_id, b_id) VALUES(?, ?)");
            ps.setInt(1, eventID);
            ps.setInt(2, bandID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeEventBand(int eventID, int bandID) {
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM events_bands WHERE e_id=? AND b_id=?");
            ps.setInt(1, eventID);
            ps.setInt(2, bandID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Event> getAllEvents() {
        List<Event> events = new ArrayList<>();

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

                event.setEvent_bands(getBandsInEvent(rs.getInt("e_id")));

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

                event.setEvent_bands(getBandsInEvent(rs.getInt("e_id")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return event;
    }

    public List<Band> getBandsInEvent(int eventID) {
        List<Band> bandsInEvent = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement("SELECT name, b_id FROM bands WHERE EXISTS ( SELECT * FROM events_bands WHERE bands.b_id = events_bands.b_id AND events_bands.e_id = ? ) AND bands.isdeleted = 0");
            ps.setInt(1, eventID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Band band = new Band();

                band.setB_id(rs.getInt("b_id"));
                band.setName(rs.getString("name"));

                bandsInEvent.add(band);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bandsInEvent;
    }

    public List<Band> getBandsNotInEvent(int eventID) {
        List<Band> bandsNotInEvent = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement("SELECT b_id, name FROM bands WHERE NOT EXISTS( SELECT * FROM events_bands WHERE bands.b_id = events_bands.b_id AND events_bands.e_id = ? ) AND bands.isdeleted = 0");
            ps.setInt(1, eventID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Band band = new Band();

                band.setB_id(rs.getInt("b_id"));
                band.setName(rs.getString("name"));

                bandsNotInEvent.add(band);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bandsNotInEvent;
    }
}
