package com.lankarails.servlet;

import com.lankarails.model.Passenger;
import com.lankarails.service.PassengerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/settings")
public class PassengerSettingsServlet extends HttpServlet {
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

        if (session == null || session.getAttribute("user") == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int passengerId = (int) session.getAttribute("userId");
        Passenger passenger = passengerService.getPassenger(passengerId);

        request.setAttribute("passenger", passenger);
        request.setAttribute("isLoggedIn", true);
        request.getRequestDispatcher("/client/settings.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int passengerId = (int) session.getAttribute("userId");
        Passenger passenger = passengerService.getPassenger(passengerId);

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String newPassword = request.getParameter("new_password");
        String currentPassword = request.getParameter("current_password");

        if (!passenger.getPassword().equals(currentPassword)) {
            request.setAttribute("passenger", passenger);
            request.setAttribute("error", "Incorrect current password.");
            request.getRequestDispatcher("/client/settings.jsp").forward(request, response);
            return;
        }

        passenger.setName(name);
        passenger.setEmail(email);
        passenger.setPhone(phone);

        if (newPassword != null && !newPassword.trim().isEmpty()) {
            passenger.setPassword(newPassword);
        }

        boolean updated = passengerService.updatePassenger(passenger);
        if (updated) {
            session.setAttribute("name", passenger.getName());
            request.setAttribute("passenger", passenger);
            request.setAttribute("success", "Profile updated successfully.");
        } else {
            request.setAttribute("error", "Failed to update profile.");
        }

        request.getRequestDispatcher("/client/settings.jsp").forward(request, response);
    }
}