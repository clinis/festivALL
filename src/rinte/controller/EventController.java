package rinte.controller;

import rinte.dao.BandDAO;
import rinte.dao.EventDAO;
import rinte.model.Event;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class EventController extends HttpServlet {
    private static String FORM_INSERT_OR_EDIT = "/event.jsp";
    private static String LIST_EVENTS = "/listevents.jsp";
    private static String MANAGE_EVENTS = "/manageevents.jsp";
    private EventDAO dao;
    private BandDAO daoB;

    public EventController() {
        super();
        dao = new EventDAO();
        daoB = new BandDAO();
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

        request.setAttribute("events", dao.getAllEvents());
        String forward = LIST_EVENTS;

        int eventID;
        int bandID;
        Event event;

        switch (action.toLowerCase()){
            case "delete":
                eventID = Integer.parseInt(request.getParameter("e_id"));
                dao.deleteEvent(eventID);

                forward = LIST_EVENTS;
                request.setAttribute("events", dao.getAllEvents());
                break;

            case "edit":
                forward = FORM_INSERT_OR_EDIT;

                eventID = Integer.parseInt(request.getParameter("e_id"));
                event = dao.getEventByID(eventID);

                request.setAttribute("action", "edit");
                request.setAttribute("event", event);
                request.setAttribute("eventB", dao.getBandsInEvent(eventID));
                request.setAttribute("eventNB", dao.getBandsNotInEvent(eventID));
                break;

            case "edited":
                event = new Event();
                event.setE_id(Integer.parseInt(request.getParameter("e_id")));
                event.setType(Short.parseShort(request.getParameter("type")));
                event.setName(request.getParameter("name"));
                try {
                    Date d = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("date"));
                    System.out.println("eddd:"+d);
                    event.setDate(d);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                event.setCity(request.getParameter("city"));
                event.setLocal(request.getParameter("local"));

                dao.updateEvent(event);

                request.setAttribute("events", dao.getAllEvents());
                forward = LIST_EVENTS;
                break;

            case "addeventband":
                eventID = Integer.parseInt(request.getParameter("e_id"));
                bandID = Integer.parseInt(request.getParameter("eventNotBands"));

                dao.addEventBand(eventID, bandID);

                event = dao.getEventByID(eventID);
                request.setAttribute("event", event);

                request.setAttribute("eventB", dao.getBandsInEvent(eventID));
                request.setAttribute("eventNB", dao.getBandsNotInEvent(eventID));

                request.setAttribute("action","");
                request.setAttribute("action", "edit");
                forward = FORM_INSERT_OR_EDIT;
                break;

            case "removeeventband":
                eventID = Integer.parseInt(request.getParameter("e_id"));
                bandID = Integer.parseInt(request.getParameter("b_id"));

                dao.removeEventBand(eventID, bandID);

                event = dao.getEventByID(eventID);
                request.setAttribute("event", event);

                request.setAttribute("eventB", dao.getBandsInEvent(eventID));
                request.setAttribute("eventNB", dao.getBandsNotInEvent(eventID));

                request.setAttribute("action", "edit");
                forward = FORM_INSERT_OR_EDIT;
                break;

            case "added":
                event = new Event();
                event.setName(request.getParameter("name"));
                event.setType(Short.parseShort(request.getParameter("type")));

                try {
                    Date reg = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("date"));
                    System.out.println("add"+ reg);
                    event.setDate(reg);
                } catch (ParseException e) {
                    e.printStackTrace();
                }

                event.setCity(request.getParameter("city"));
                event.setLocal(request.getParameter("local"));

                dao.addEvent(event);

                request.setAttribute("events", dao.getAllEvents());
                forward = LIST_EVENTS;
                break;

            case "insert":
                request.setAttribute("action", "insert");
                request.setAttribute("bands", daoB.getAllBands());
                forward = FORM_INSERT_OR_EDIT;
                break;

            case "manageevents":
                request.setAttribute("bands", dao.getAllEvents());
                forward = MANAGE_EVENTS;
                break;

            default:
                request.setAttribute("events", dao.getAllEvents());
                forward = LIST_EVENTS;
                break;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
}
