package rinte.controller;

import rinte.dao.UserDAO;
import rinte.model.User;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController extends HttpServlet {
    private UserDAO dao;

    public LoginController() {
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

        HttpSession session = request.getSession(true);

        switch (action.toLowerCase()) {
            case "login":
                try {
                    User user = new User();
                    user.setUsername(request.getParameter("un"));
                    user.setPassword(request.getParameter("pw"));

                    if (dao.login(user) == true) {
                        user = dao.getUserByUsername(user.getUsername());
                        session.setAttribute("currentSessionUser", user.getUsername());
                        session.setAttribute("currentSessionIsadmin", user.getIsadmin());

                        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/userLogged.jsp");
                        view.forward(request, response);
                    } else {
                        response.sendRedirect("index.jsp"); //error page
                    }

                    /*if (user.isValid()) {
                        HttpSession session = request.getSession(true);
                        session.setAttribute("currentSessionUser", user.getUsername());
                        session.setAttribute("currentSessionLevel", user.getLevel());
                        response.sendRedirect("userLogged.jsp"); //logged-in page
                    } else {
                        response.sendRedirect("index.jsp"); //error page
                    }*/
                } catch (Throwable theException) {
                    System.out.println(theException);
                }
                break;

            case "logout":
                session.invalidate();
                response.sendRedirect("index.jsp"); //error page
                break;

            case "signup":
                int uID;
                User user = new User();
                user.setUsername(request.getParameter("username"));
                user.setPassword(request.getParameter("password"));
                user.setName(request.getParameter("name"));
                try {
                    Date d = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("birthdate"));
                    System.out.println("bday:"+d);
                    user.setBirthdate(d);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                user.setCity(request.getParameter("city"));

                uID = dao.createUser(user);

                user = dao.getUserByID(uID);
                session.setAttribute("currentSessionUser", user.getUsername());
                session.setAttribute("currentSessionIsadmin", user.getIsadmin());

                RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/userLogged.jsp");
                view.forward(request, response);
                break;
        }
    }
}
