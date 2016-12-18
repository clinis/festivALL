package rinte.dao;

import rinte.model.Band;
import rinte.util.Database;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BandDAO {

    private Connection connection;

    public BandDAO() {
        connection = Database.getConnection();
    }


    public void addBand(Band bnd) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO bands(name, image, artists) values (?, ?, ? )");
            preparedStatement.setString(1, bnd.getName());
            preparedStatement.setString(2, bnd.getImage());
            preparedStatement.setString(3, bnd.getArtists());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteBand(int bandID) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM bands WHERE b_id=?");
            preparedStatement.setInt(1, bandID);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateBand(Band bnd) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE bands SET name=?, image=?, artists=? WHERE b_id=?");
            preparedStatement.setString(1, bnd.getName());
            preparedStatement.setString(2, bnd.getImage());
            preparedStatement.setString(3, bnd.getArtists());
            preparedStatement.setInt(4, bnd.getB_id());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Band> getAllBands() {
        List<Band> bands = new ArrayList<Band>();
        try {
            Statement ps = connection.createStatement();
            ResultSet rs = ps.executeQuery("SELECT * FROM bands");
            while (rs.next()) {
                Band band = new Band();
                band.setB_id(rs.getInt("b_id"));
                band.setName(rs.getString("name"));
                band.setImage(rs.getString("image"));
                band.setArtists(rs.getString("artists"));
                band.setRegisteredon(rs.getDate("registeredon"));
                bands.add(band);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bands;
    }

    public Band getBandByID(int bandID) {
        Band band = new Band();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM bands WHERE b_id=?");
            ps.setInt(1, bandID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                band.setB_id(rs.getInt("b_id"));
                band.setName(rs.getString("name"));
                band.setImage(rs.getString("image"));
                band.setArtists(rs.getString("artists"));
                band.setRegisteredon(rs.getDate("registeredon"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return band;
    }
}
