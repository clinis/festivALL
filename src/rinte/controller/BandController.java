package rinte.controller;

import rinte.dao.BandDAO;
import rinte.model.Band;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BandController extends HttpServlet {
    public static final String INSERT_OR_EDIT = "/band.jsp";
    public static final String LIST_BANDS = "/listbands.jsp";
    private final BandDAO dao;

    public BandController() {
        super();
        dao = new BandDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")){
            int bandID = Integer.parseInt(request.getParameter("bandID"));
            dao.deleteBand(bandID);

            forward = LIST_BANDS;
            request.setAttribute("bands", dao.getAllBands());

        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;

            int bandID = Integer.parseInt(request.getParameter("bandID"));
            Band band = dao.getBandByID(bandID);

            request.setAttribute("band", band);

        } else if (action.equalsIgnoreCase("listBands")){
            forward = LIST_BANDS;

            request.setAttribute("bands", dao.getAllBands());

        } else {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("ac");

        if (action.equalsIgnoreCase("edit")) {
            Band band = new Band();
            band.setB_id(Integer.parseInt(request.getParameter("b_id")));
            band.setName(request.getParameter("name"));
            band.setImage(request.getParameter("image"));
            band.setArtists(request.getParameter("artists"));
            try {
                Date reg = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("dob"));
                System.out.println("rrrrrrrrrrr" + reg);
                band.setRegisteredon(reg);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            dao.updateBand(band);

            RequestDispatcher view = request.getRequestDispatcher(LIST_BANDS);
            request.setAttribute("bands", dao.getAllBands());
            view.forward(request, response);
        } else if (action.equalsIgnoreCase("add")){
            Band band = new Band();
            band.setName(request.getParameter("name"));
            band.setImage(request.getParameter("image"));
            band.setArtists(request.getParameter("artists"));
            try {
                Date reg = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("dob"));
                System.out.println("rrrrrrrrrrr" + reg);
                band.setRegisteredon(reg);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            dao.addBand(band);

            RequestDispatcher view = request.getRequestDispatcher(LIST_BANDS);
            request.setAttribute("bands", dao.getAllBands());
            view.forward(request, response);
        }
    }
}
