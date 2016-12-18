package rinte.controller;

import rinte.dao.LoginDAO;
import rinte.dao.UserDAO;
import rinte.model.Login;
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
    private LoginDAO daoL;
    private UserDAO daoU;

    public LoginController() {
        super();
        daoL = new LoginDAO();
        daoU = new UserDAO();
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
        System.out.println("LController action: " + action);

        HttpSession session = request.getSession(true);
        RequestDispatcher view;

        switch (action.toLowerCase()) {
            case "login":
                try {
                    Login user = new Login();
                    user.setUsername(request.getParameter("un"));
                    user.setPassword(request.getParameter("pw"));

                    int uID = daoL.login(user);
                    if (uID > 0) {
                        user = daoL.getUserByID(uID);
                        session.setAttribute("currentSessionUser", user.getU_id());
                        session.setAttribute("currentSessionLevel", user.getIsadmin());

                        view = request.getRequestDispatcher("UserController?page=default");
                        view.forward(request, response);
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                } catch (Throwable theException) {
                    System.out.println(theException);
                }
                break;

            case "logout":
                session.invalidate();
                response.sendRedirect("index.jsp");
                break;

            case "signup":
                int uID;
                User user = new User();
                user.setUsername(request.getParameter("username"));
                user.setEmail(request.getParameter("email"));
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

                uID = daoU.createUser(user);

                Login usr = daoL.getUserByID(uID);
                session.setAttribute("currentSessionUser", usr.getU_id());
                session.setAttribute("currentSessionLevel", usr.getIsadmin());

                view = request.getRequestDispatcher("UserController?page=default");
                view.forward(request, response);
                break;
        }
    }
}
