package rinte.controller;

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
    private static String INSERT_OR_EDIT = "/event.jsp";
    private static String LIST_EVENTS = "/listevents.jsp";
    private EventDAO dao;

    public EventController() {
        super();
        dao = new EventDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")){
            int eventID = Integer.parseInt(request.getParameter("eventID"));
            dao.deleteEvent(eventID);

            forward = LIST_EVENTS;
            request.setAttribute("events", dao.getAllEvents());

        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;

            int eventID = Integer.parseInt(request.getParameter("eventID"));
            Event event = dao.getEventByID(eventID);

            request.setAttribute("event", event);

        } else if (action.equalsIgnoreCase("listEvents")){
            forward = LIST_EVENTS;

            request.setAttribute("events", dao.getAllEvents());

        } else {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("ac");

        if (action.equalsIgnoreCase("edit")) {
            Event event = new Event();
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

            RequestDispatcher view = request.getRequestDispatcher(LIST_EVENTS);
            request.setAttribute("events", dao.getAllEvents());
            view.forward(request, response);
        } else if (action.equalsIgnoreCase("add")) {
            Event event = new Event();
            event.setName(request.getParameter("name"));
            event.setType(Short.parseShort(request.getParameter("type")));

            try {
                Date reg = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("date"));
                System.out.println("rrrrrrrrrrr"+ reg);
                event.setDate(reg);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            //event.setDate(request.getParameter("date"));

            event.setCity(request.getParameter("city"));
            event.setLocal(request.getParameter("local"));

            dao.addEvent(event);

            RequestDispatcher view = request.getRequestDispatcher(LIST_EVENTS);
            request.setAttribute("events", dao.getAllEvents());
            view.forward(request, response);
        }
    }
}
