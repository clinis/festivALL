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
        System.out.println("Controller action: " + action);

        String forward;

        HttpSession session = request.getSession(true);

        int userID;
        int bandID;
        User usr;

        switch (action.toLowerCase()){
            case "edit":
                userID = Integer.parseInt(request.getParameter("u_id"));

                request.setAttribute("user", dao.getUserByID(userID));
                request.setAttribute("userB", dao.getBandsInUser(userID));
                request.setAttribute("userNB", dao.getBandsNotInUser(userID));

                forward = FORM;
                break;

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

                usr = dao.getUserByID(Integer.parseInt(request.getParameter("u_id")));
                session.setAttribute("currentSessionUser", usr);

                forward = USER_HOME;
                break;

            case "adduserband":
                userID = Integer.parseInt(request.getParameter("u_id"));
                bandID = Integer.parseInt(request.getParameter("userNotBands"));

                dao.addUserBand(userID, bandID);

                request.setAttribute("user", dao.getUserByID(userID));
                request.setAttribute("userB", dao.getBandsInUser(userID));
                request.setAttribute("userNB", dao.getBandsNotInUser(userID));

                forward = FORM;
                break;

            case "removeuserband":
                userID = Integer.parseInt(request.getParameter("u_id"));
                bandID = Integer.parseInt(request.getParameter("b_id"));

                dao.removeUserBand(userID, bandID);

                usr = dao.getUserByID(userID);
                request.setAttribute("event", usr);

                request.setAttribute("userB", dao.getBandsInUser(userID));
                request.setAttribute("userNB", dao.getBandsNotInUser(userID));

                forward = FORM;
                break;

            default:
                System.out.println(request.getSession(false).getAttribute("currentSessionUser.name"));
                
                forward = USER_HOME;
                break;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
}
