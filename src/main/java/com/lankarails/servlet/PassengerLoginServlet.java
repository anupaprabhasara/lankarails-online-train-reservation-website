package com.lankarails.servlet;

import com.lankarails.model.Passenger;
import com.lankarails.service.PassengerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class PassengerLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final PassengerService passengerService = new PassengerService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check if session already exists
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        // Authenticate passenger
        Passenger passenger = authenticatePassenger(email, password);

        if (passenger != null) {
            // Create new session and set passenger attributes
            session = request.getSession(true);
            session.setAttribute("user", passenger);
            session.setAttribute("userId", passenger.getPassengerId());
            session.setAttribute("name", passenger.getName());
            session.setAttribute("email", passenger.getEmail());
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            response.sendRedirect(request.getContextPath() + "/");
        } else {
            request.setAttribute("error", "Incorrect email or password!");
            request.getRequestDispatcher("/client/login.jsp").forward(request, response);
        }
    }

    private Passenger authenticatePassenger(String email, String password) {
        for (Passenger p : passengerService.getAllPassengers()) {
            if (p.getEmail().equalsIgnoreCase(email) && p.getPassword().equals(password)) {
                return p;
            }
        }
        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            request.getRequestDispatcher("/client/login.jsp").forward(request, response);
        }
    }
}