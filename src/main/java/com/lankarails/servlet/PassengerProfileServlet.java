package com.lankarails.servlet;

import com.lankarails.model.Passenger;
import com.lankarails.service.PassengerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/profile")
public class PassengerProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PassengerService passengerService;

    @Override
    public void init() throws ServletException {
        passengerService = new PassengerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check if passenger is logged in
        if (session == null || session.getAttribute("user") == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int passengerId = (int) session.getAttribute("userId");

        // Fetch passenger details
        Passenger passenger = passengerService.getPassenger(passengerId);
        if (passenger == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Passenger not found.");
            return;
        }

        request.setAttribute("passenger", passenger);
        request.setAttribute("isLoggedIn", true);

        request.getRequestDispatcher("/client/profile.jsp").forward(request, response);
    }
}