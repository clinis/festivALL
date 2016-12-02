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

        } else if (action.equalsIgnoreCase("listEvent")){
            forward = LIST_EVENTS;

            request.setAttribute("events", dao.getAllEvents());

        } else {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Event event = new Event();
        event.setType(Short.parseShort(request.getParameter("type")));
        event.setName(request.getParameter("name"));
        try {
            Date d = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("date"));
            System.out.println(d);
            event.setDate(d);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        event.setCity(request.getParameter("city"));
        event.setLocal(request.getParameter("local"));
        try {
            Date dd = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("dob"));
            System.out.println("rrrrrrrrrrr"+ dd);
            event.setRegisteredon(dd);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        //String userid = request.getParameter("uname");
//        if(userid == null || userid.isEmpty())
//        {
//            dao.addUser(user);
//        }
//        else
//        {
        dao.checkEvent(event);
//        }
        RequestDispatcher view = request.getRequestDispatcher(LIST_EVENTS);
        request.setAttribute("users", dao.getAllEvents());
        view.forward(request, response);
    }
}
