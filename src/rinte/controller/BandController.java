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
    private static final String FORM_INSERT_OR_EDIT = "/WEB-INF/views/bandForm.jsp";
    private static final String LIST_BANDS = "/WEB-INF/views/listbands.jsp";
    private static final String MANAGE_BANDS = "/WEB-INF/views/managebands.jsp";
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
        String page = request.getParameter("page");

        request.setAttribute("bands", dao.getAllBands());
        String forward = LIST_BANDS;

        int bandID;
        Band band;

        if (page != null){
            System.out.println("BController page: " + page);

            switch (page.toLowerCase()) {
                case "addband":
                    request.setAttribute("action", "insert");
                    forward = FORM_INSERT_OR_EDIT;
                    break;

                case "managebands":
                    request.setAttribute("bands", dao.getAllBands());
                    forward = MANAGE_BANDS;
                    break;

                case "editband":
                    bandID = Integer.parseInt(request.getParameter("b_id"));
                    band = dao.getBandByID(bandID);
                    request.setAttribute("band", band);
                    request.setAttribute("action", "edit");
                    forward = FORM_INSERT_OR_EDIT;
                    break;

                default:
                    request.setAttribute("bands", dao.getAllBands());
                    forward = LIST_BANDS;
                    break;
            }
        }

        if (action != null) {
            System.out.println("BController action: " + action);

            switch (action.toLowerCase()) {
                case "edited":
                    band = new Band();
                    band.setB_id(Integer.parseInt(request.getParameter("b_id")));
                    band.setName(request.getParameter("name"));
                    band.setArtists(request.getParameter("artists"));

                    dao.updateBand(band);

                    request.setAttribute("bands", dao.getAllBands());
                    forward = MANAGE_BANDS;
                    break;

                case "added":
                    band = new Band();
                    band.setName(request.getParameter("name"));
                    band.setArtists(request.getParameter("artists"));

                    dao.addBand(band);

                    request.setAttribute("bands", dao.getAllBands());
                    forward = MANAGE_BANDS;
                    break;

                case "deleteband":
                    bandID = Integer.parseInt(request.getParameter("b_id"));

                    dao.deleteBand(bandID);

                    request.setAttribute("bands", dao.getAllBands());
                    forward = MANAGE_BANDS;
                    break;
            }
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
}
