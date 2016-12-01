/**
 * Created by dinis on 30/11/16.
 */
package jdbc.datamodel;

import jdbc.ConnectionFactory;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class Band implements Serializable {
    private int b_id = -1;
    private String name = null;
    private String image = null;
    private String artists = null;

    public Band() {
    }

    public int getID() {
        return b_id;
    }

    public void setID(int b_id) {
        this.b_id = b_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getArtists() {
        return artists;
    }

    public void setArtists(String artists) {
        this.artists = artists;
    }


    public void addBand() throws SQLException {
        Connection connection;
        connection = new ConnectionFactory().getConnection();

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
    }

    public List<Band> getBandsList() {
        List<Band> bands = new ArrayList<Band>();

        Connection connection;
        connection = new ConnectionFactory().getConnection();

        String sql = "SELECT * FROM bands WHERE isdeleted=0";
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(sql);
            System.out.println(sql);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                // criando o objeto
                Band band = new Band();
                band.setID(rs.getInt("b_id"));
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
    }

    public void deleteBand(HttpServletRequest request) {
        Band deleted = new Band();
        if(request.getParameter("b_id")!=null) {
            deleted.setID(Integer.parseInt(request.getParameter("b_id")));
        }

        Connection connection;
        connection = new ConnectionFactory().getConnection();

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
    }

    public void updateBand(HttpServletRequest request) {
        Band updated = new Band();
        if(request.getParameter("b_id")!=null) {
            updated.setID(Integer.parseInt(request.getParameter("b_id")));
        }
        if(request.getParameter("name")!=null) {
            updated.setName(request.getParameter("name"));
        }
        if(request.getParameter("artists")!=null) {
            updated.setArtists(request.getParameter("artists"));
        }

        Connection connection;
        connection = new ConnectionFactory().getConnection();

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
    }
}
