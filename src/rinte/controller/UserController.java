package rinte.controller;

import rinte.dao.UserDAO;
import rinte.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class UserController extends HttpServlet {
    private static String USER_HOME = "/WEB-INF/views/userHome.jsp";
    private static String FORM = "/WEB-INF/views/userFom.jsp";
    private UserDAO dao;

    public UserController() {
        super();
        dao = new UserDAO();
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

        String forward = null;

        HttpSession session = request.getSession(true);

        int userID;
        int bandID;
        int eventID;
        User usr;

        if (page != null) {
            System.out.println("UController page: " + page);

            switch (page.toLowerCase()) {
                case "edituser":
                    userID = Integer.parseInt(request.getParameter("u_id"));

                    request.setAttribute("user", dao.getUserByID(userID));
                    request.setAttribute("userB", dao.getBandsInUser(userID));
                    request.setAttribute("userNB", dao.getBandsNotInUser(userID));
                    request.setAttribute("userE", dao.getEventsInUser(userID));
                    request.setAttribute("userNE", dao.getEventsNotInUser(userID));

                    forward = FORM;
                    break;

                default:
                    request.setAttribute("user", dao.getUserByID((Integer) request.getSession(false).getAttribute("currentSessionUser")));

                    request.setAttribute("userB", dao.getBandsInUser((Integer) request.getSession(false).getAttribute("currentSessionUser")));

                    request.setAttribute("userE", dao.getEventsInUser((Integer) request.getSession(false).getAttribute("currentSessionUser")));

                    forward = USER_HOME;
                    break;
            }
        }

        if (action != null) {
            System.out.println("UController action: " + action);

            switch (action.toLowerCase()){
                case "edited":
                    usr = new User();

                    usr.setU_id(Integer.parseInt(request.getParameter("u_id")));
                    usr.setEmail(request.getParameter("email"));
                    usr.setName(request.getParameter("name"));
                    try {
                        Date d = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("birthdate"));
                        System.out.println("eddd:"+d);
                        usr.setBirthdate(d);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    usr.setCity(request.getParameter("city"));

                    dao.updateUser(usr);

                    request.setAttribute("user", dao.getUserByID(Integer.parseInt(request.getParameter("u_id"))));
                    request.setAttribute("userB", dao.getBandsInUser(Integer.parseInt(request.getParameter("u_id"))));
                    request.setAttribute("userNB", dao.getBandsNotInUser(Integer.parseInt(request.getParameter("u_id"))));
                    request.setAttribute("userE", dao.getEventsInUser(Integer.parseInt(request.getParameter("u_id"))));
                    request.setAttribute("userNE", dao.getEventsNotInUser(Integer.parseInt(request.getParameter("u_id"))));

                    forward = USER_HOME;
                    break;

                case "adduserband":
                    userID = Integer.parseInt(request.getParameter("u_id"));
                    bandID = Integer.parseInt(request.getParameter("userNotBands"));

                    dao.addUserBand(userID, bandID);

                    request.setAttribute("user", dao.getUserByID(userID));
                    request.setAttribute("userB", dao.getBandsInUser(userID));
                    request.setAttribute("userNB", dao.getBandsNotInUser(userID));
                    request.setAttribute("userE", dao.getEventsInUser(userID));
                    request.setAttribute("userNE", dao.getEventsNotInUser(userID));

                    forward = FORM;
                    break;

                case "removeuserband":
                    userID = Integer.parseInt(request.getParameter("u_id"));
                    bandID = Integer.parseInt(request.getParameter("b_id"));

                    dao.removeUserBand(userID, bandID);

                    request.setAttribute("user", dao.getUserByID(userID));
                    request.setAttribute("userB", dao.getBandsInUser(userID));
                    request.setAttribute("userNB", dao.getBandsNotInUser(userID));
                    request.setAttribute("userE", dao.getEventsInUser(userID));
                    request.setAttribute("userNE", dao.getEventsNotInUser(userID));

                    forward = FORM;
                    break;

                case "adduserevent":
                    userID = Integer.parseInt(request.getParameter("u_id"));
                    eventID = Integer.parseInt(request.getParameter("userNotEvents"));

                    dao.addUserEvent(userID, eventID);

                    request.setAttribute("user", dao.getUserByID(userID));
                    request.setAttribute("userB", dao.getBandsInUser(userID));
                    request.setAttribute("userNB", dao.getBandsNotInUser(userID));
                    request.setAttribute("userE", dao.getEventsInUser(userID));
                    request.setAttribute("userNE", dao.getEventsNotInUser(userID));

                    forward = FORM;
                    break;

                case "removeuserevent":
                    userID = Integer.parseInt(request.getParameter("u_id"));
                    eventID = Integer.parseInt(request.getParameter("e_id"));

                    dao.removeUserEvent(userID, eventID);

                    request.setAttribute("user", dao.getUserByID(userID));
                    request.setAttribute("userB", dao.getBandsInUser(userID));
                    request.setAttribute("userNB", dao.getBandsNotInUser(userID));
                    request.setAttribute("userE", dao.getEventsInUser(userID));
                    request.setAttribute("userNE", dao.getEventsNotInUser(userID));

                    forward = FORM;
                    break;
            }
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
}
