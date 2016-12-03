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


    public void checkBand(Band bnd) {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT b_id FROM bands WHERE b_id = ?");
            ps.setInt(1, bnd.getB_id());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) { // found
                updateBand(bnd);
            } else {
                addBand(bnd);
            }
        } catch (Exception ex) {
            System.out.println("Error in check() :" + ex.getMessage());
        }
    }

    public void addBand(Band bnd) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO bands(name, image, artists) values (?, ?, ? )");
            preparedStatement.setString(1, bnd.getName());
            preparedStatement.setString(2, bnd.getImage());
            preparedStatement.setString(3, bnd.getArtists());
            //preparedStatement.setDate(4, new java.sql.Date(bnd.getRegisteredon().getTime()));
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteBand(int bandID) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE bands SET isdeleted=1 WHERE b_id=?");
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
            ResultSet rs = ps.executeQuery("SELECT * FROM bands WHERE isdeleted=0");
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

    public Band getBandByName(String bname){
        Band band = new Band();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM bands WHERE name=?");
            ps.setString(1, bname);
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


    /* ------------------------------------------------------ */
  /*  public void addBand() throws SQLException {
        Connection connection;
        connection = new Database().getConnection();

        String sql = "INSERT INTO bands (name,artists) VALUES (?,?)";

        try {
            // prepared statement
            PreparedStatement stmt = connection.prepareStatement(sql);

            // setting the values
            stmt.setString(1, name);
            stmt.setString(2, artists);

            // executing
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }*/

    /*public List<Band> getBandsList() {
        List<Band> bands = new ArrayList<Band>();

        Connection connection;
        connection = new Database().getConnection();

        String sql = "SELECT * FROM bands WHERE isdeleted=0";
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(sql);
            System.out.println(sql);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                // criando o objeto
                Band band = new Band();
                band.setBid(rs.getInt("b_id"));
                band.setName(rs.getString("name"));
                band.setArtists(rs.getString("artists"));

                // adicionando o objeto à lista
                bands.add(band);
            }

            rs.close();
            stmt.close();

            return bands;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }*/

    /*public void deleteBand(HttpServletRequest request) {
        Band deleted = new Band();
        if(request.getParameter("b_id")!=null) {
            deleted.setBid(Integer.parseInt(request.getParameter("b_id")));
        }

        Connection connection;
        connection = new Database().getConnection();

        String sql = "UPDATE bands SET isdeleted=1 WHERE b_id ='" + deleted.b_id + "';";
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(sql);
            System.out.println(sql);
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }*/

    /*public void updateBand(HttpServletRequest request) {
        Band updated = new Band();
        if(request.getParameter("b_id")!=null) {
            updated.setBid(Integer.parseInt(request.getParameter("b_id")));
        }
        if(request.getParameter("name")!=null) {
            updated.setName(request.getParameter("name"));
        }
        if(request.getParameter("artists")!=null) {
            updated.setArtists(request.getParameter("artists"));
        }

        Connection connection;
        connection = new Database().getConnection();

        String sql = "UPDATE bands (name, artists) SET (?,?) WHERE b_id='" + updated.b_id +"';";
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, updated.getName());
            stmt.setString(2, updated.getArtists());
            System.out.println(sql);
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }*/
}
