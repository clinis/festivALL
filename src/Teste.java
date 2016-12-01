import jdbc.ConnectionFactory;
import jdbc.datamodel.Event;
import jdbc.datamodel.Band;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

/**
 * Created by dinis on 30/11/16.
 */
public class Teste {

    public static void main1(String[] args) throws SQLException {
        Connection connection = new ConnectionFactory().getConnection();
        System.out.println("Connection openned!");
        connection.close();
    }

    public static void main2(String[] args) throws SQLException {
        // conectando
        Connection con = new ConnectionFactory().getConnection();

        // cria um preparedStatement
        String sql = "insert into bands (name,artists) values (?,?)";
        PreparedStatement stmt = con.prepareStatement(sql);

        // preenche os valores
        stmt.setString(1, "Caelum2");
        stmt.setString(2, "oo e e e   cvs ");

        // executa
        stmt.execute();
        stmt.close();

        System.out.println("Gravado!");

        con.close();
    }

    public static void criarBandas() throws SQLException {
        // pronto para gravar
        Band contato = new Band();
        contato.setName("Queens");
        contato.setArtists("Joshe");

        // método elegante
        contato.addBand();

        System.out.println("Gravado!");
    }

    public static void listagemBandas0() throws SQLException {
        // pega a conexão e o Statement
        Connection con = new ConnectionFactory().getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM bands");

        // executa um select
        ResultSet rs = stmt.executeQuery();

        // itera no ResultSet
        while (rs.next()) {
            String nome = rs.getString("name");
            String email = rs.getString("artists");

            System.out.println(nome + " :: " + email);
        }

        stmt.close();
        con.close();
    }

    public static void listagemBandas() {
        Band dao = new Band();

        List<Band> contatos = dao.getBandsList();

        for (Band contato : contatos) {
            System.out.println("ID: " + contato.getID());
            System.out.println("Nome: " + contato.getName());
            System.out.println("Artitas: " + contato.getArtists());
            System.out.println("--");
        }
    }

    /*public static void criarEvento() throws SQLException {
        // pronto para gravar
        Event e = new Event();
        e.setType((short) 0);
        e.setName("Dinis");
        Calendar cl = Calendar.getInstance();
        cl.set(1994,5,18);
        e.setDate(cl);
        e.setCity("Fão");
        e.setLocal("junto ao rio!!!!!!");

        // grave nessa conexão!!!
        Event dao = new Event();

        // método elegante
        e.addEvent();

        System.out.println("Gravado!");
    }*/

    /*public static void listagemEventos() {
        Event dao = new Event();

        List<Event> es = dao.getEventsList();

        for (Event e : es) {
            System.out.println("ID: " + e.getID());
            System.out.println("Type: " + e.getType());
            System.out.println("Name: " + e.getName());
            System.out.println("City: " + e.getCity() + " (" + e.getLocal() + ")");
            System.out.println("--");
        }
    }*/

    public static void main(String[] args) {

    }
}
