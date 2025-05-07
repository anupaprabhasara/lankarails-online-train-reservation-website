package com.lankarails.servlet;

import com.lankarails.service.PassengerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/staff/passenger")
public class PassengerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PassengerService passengerService;

    @Override
    public void init() throws ServletException {
        passengerService = new PassengerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Session Check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            response.sendRedirect(request.getContextPath() + "/staff/login");
            return;
        }

        String action = request.getParameter("action");

        try {
            if (action == null) {
                // List all passengers
                request.setAttribute("passengers", passengerService.getAllPassengers());
                request.getRequestDispatcher("/staff/passengers/index.jsp").forward(request, response);

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                passengerService.deletePassenger(id);
                response.sendRedirect(request.getContextPath() + "/staff/passenger");

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "POST is not supported.");
    }
}