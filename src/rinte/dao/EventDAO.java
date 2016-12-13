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

        try {
            int eid = -1;
            PreparedStatement preparedStatement1 = connection.prepareStatement("SELECT MAX(e_id) FROM events");
            ResultSet rs = preparedStatement1.executeQuery();
            if (rs.next()) {
                eid = rs.getInt(1);
                System.out.println("max id events: "+eid);
            }

            String[] b = evt.getEvent_bands();
            for ( String be : b ) {
                System.out.println("sql event id ("+eid+") and band id "+be);
                PreparedStatement preparedStatement2 = connection.prepareStatement("INSERT INTO events_bands(e_id, b_id) VALUES(?, ?)");
                preparedStatement2.setInt(1, eid);
                preparedStatement2.setInt(2, Integer.parseInt(be));
                preparedStatement2.execute();
            }
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

                List resultListEventBands = new ArrayList();
                PreparedStatement ps2 = connection.prepareStatement("SELECT * FROM bands INNER JOIN events_bands ON events_bands.b_id=bands.b_id AND events_bands.e_id=? ");
                ps2.setInt(1, event.getE_id());
                ResultSet rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    resultListEventBands.add(rs2.getString("name"));
                }
                event.setEvent_bands((String[]) resultListEventBands.toArray(new String[resultListEventBands.size()]));

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

                List resultListEventBands = new ArrayList();
                PreparedStatement ps2 = connection.prepareStatement("SELECT * FROM bands INNER JOIN events_bands ON events_bands.b_id=bands.b_id AND events_bands.e_id=? ");
                ps2.setInt(1, eventID);
                ResultSet rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    resultListEventBands.add(rs2.getString("name"));
                }
                event.setEvent_bands((String[]) resultListEventBands.toArray(new String[resultListEventBands.size()]));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return event;
    }
}
