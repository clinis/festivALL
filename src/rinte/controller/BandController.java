package rinte.controller;

import rinte.dao.BandDAO;
import rinte.model.Band;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BandController extends HttpServlet {
    public static final String FORM_INSERT_OR_EDIT = "/WEB-INF/views/band.jsp";
    public static final String LIST_BANDS = "/listbands.jsp";
    public static final String MANAGE_BANDS = "/WEB-INF/views/managebands.jsp";
    private final BandDAO dao;

    public BandController() {
        super();
        dao = new BandDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        System.out.println("Controller action: " + action);

        request.setAttribute("bands", dao.getAllBands());
        String forward = LIST_BANDS;

        int bandID;
        Band band;

        switch (action.toLowerCase()) {
            case "edit":
                bandID = Integer.parseInt(request.getParameter("b_id"));
                band = dao.getBandByID(bandID);
                request.setAttribute("band", band);
                request.setAttribute("action", "edit");
                forward = FORM_INSERT_OR_EDIT;
                break;

            case "edited":
                band = new Band();
                band.setB_id(Integer.parseInt(request.getParameter("b_id")));
                band.setName(request.getParameter("name"));
                band.setImage(request.getParameter("image"));
                band.setArtists(request.getParameter("artists"));

                dao.updateBand(band);

                request.setAttribute("bands", dao.getAllBands());
                forward = MANAGE_BANDS;
                break;

            case "added":
                band = new Band();
                band.setName(request.getParameter("name"));
                band.setImage(request.getParameter("image"));
                band.setArtists(request.getParameter("artists"));

                dao.addBand(band);

                request.setAttribute("bands", dao.getAllBands());
                forward = MANAGE_BANDS;
                break;

            case "delete":
                bandID = Integer.parseInt(request.getParameter("b_id"));

                dao.deleteBand(bandID);

                request.setAttribute("bands", dao.getAllBands());
                forward = MANAGE_BANDS;
                break;

            case "insert":
                request.setAttribute("action", "insert");
                forward = FORM_INSERT_OR_EDIT;
                break;

            case "managebands":
                request.setAttribute("bands", dao.getAllBands());
                forward = MANAGE_BANDS;
                break;

            default:
                request.setAttribute("bands", dao.getAllBands());
                forward = LIST_BANDS;
                break;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
}
