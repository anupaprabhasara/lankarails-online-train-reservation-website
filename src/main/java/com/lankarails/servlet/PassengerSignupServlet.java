package com.lankarails.servlet;

import com.lankarails.model.Passenger;
import com.lankarails.service.PassengerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/signup")
public class PassengerSignupServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final PassengerService passengerService = new PassengerService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // Server-side password validation
        if (password.length() < 8 || 
            !password.matches(".*[A-Z].*") || 
            !password.matches(".*[a-z].*") || 
            !password.matches(".*\\d.*")) {
            request.setAttribute("error", "Password must be at least 8 characters long and contain uppercase, lowercase, and a number.");
            request.getRequestDispatcher("/client/signup.jsp").forward(request, response);
            return;
        }

        // Check if email already exists
        if (passengerService.isEmailTaken(email)) {
            request.setAttribute("error", "Registration failed. Email may already be in use.");
            request.getRequestDispatcher("/client/signup.jsp").forward(request, response);
            return;
        }

        // Create passenger object
        Passenger passenger = new Passenger();
        passenger.setName(fullName);
        passenger.setEmail(email);
        passenger.setPhone(phone);
        passenger.setPassword(password);

        // Create user
        boolean created = passengerService.createPassenger(passenger);

        if (created) {
            request.setAttribute("success", "Registration successful! Redirecting to login...");
            request.getRequestDispatcher("/client/signup.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Registration failed. Please try again.");
            request.getRequestDispatcher("/client/signup.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("passenger") != null) {
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            request.getRequestDispatcher("/client/signup.jsp").forward(request, response);
        }
    }
}