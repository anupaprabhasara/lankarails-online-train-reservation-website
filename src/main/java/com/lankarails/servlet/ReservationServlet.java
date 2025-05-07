package com.lankarails.servlet;

import com.lankarails.model.Reservation;
import com.lankarails.service.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/staff/reservation")
public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ReservationService reservationService;

    @Override
    public void init() throws ServletException {
        reservationService = new ReservationService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            response.sendRedirect(request.getContextPath() + "/staff/login");
            return;
        }

        try {
            List<Reservation> reservations = reservationService.getAllReservations();
            request.setAttribute("reservations", reservations);
            request.getRequestDispatcher("/staff/reservations/index.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to load reservations.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            response.sendRedirect(request.getContextPath() + "/staff/login");
            return;
        }

        String action = request.getParameter("action");

        if ("update".equals(action)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String status = request.getParameter("status");

                boolean success = reservationService.updateReservationStatus(id, status);
                if (success) {
                    response.sendRedirect(request.getContextPath() + "/staff/reservation");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update reservation.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing update.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
        }
    }
}