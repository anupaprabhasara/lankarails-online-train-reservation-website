package com.lankarails.servlet;

import com.lankarails.model.Reservation;
import com.lankarails.model.Passenger;
import com.lankarails.service.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/reservations")
public class MyReservationsServlet extends HttpServlet {
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
        Passenger passenger = (session != null) ? (Passenger) session.getAttribute("user") : null;

        if (passenger == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int passengerId = passenger.getPassengerId();
        List<Reservation> reservations = reservationService.getReservationsByPassengerId(passengerId);

        request.setAttribute("reservations", reservations);
        request.setAttribute("isLoggedIn", true);
        request.getRequestDispatcher("/client/reservations.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Passenger passenger = (session != null) ? (Passenger) session.getAttribute("user") : null;

        if (passenger == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String reservationIdStr = request.getParameter("reservationId");
        if (reservationIdStr != null && !reservationIdStr.isEmpty()) {
            int reservationId = Integer.parseInt(reservationIdStr);
            reservationService.deleteReservation(reservationId);
        }

        response.sendRedirect(request.getContextPath() + "/reservations");
    }
}