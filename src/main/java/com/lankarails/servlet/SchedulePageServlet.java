package com.lankarails.servlet;

import com.lankarails.model.Schedule;
import com.lankarails.model.Reservation;
import com.lankarails.model.Passenger;
import com.lankarails.service.ScheduleService;
import com.lankarails.service.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/schedules")
public class SchedulePageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ScheduleService scheduleService;
    private ReservationService reservationService;

    @Override
    public void init() throws ServletException {
        scheduleService = new ScheduleService();
        reservationService = new ReservationService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Schedule> schedules = scheduleService.getAllSchedules();
        request.setAttribute("schedules", schedules);

        HttpSession session = request.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
        request.setAttribute("isLoggedIn", isLoggedIn);

        request.getRequestDispatcher("/client/schedule.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	HttpSession session = request.getSession(false);
    	if (session == null || session.getAttribute("user") == null) {
    	    response.sendRedirect(request.getContextPath() + "/login");
    	    return;
    	}

        try {
            int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
            String travelDate = request.getParameter("travelDate");
            int numberOfSeats = Integer.parseInt(request.getParameter("numberOfSeats"));
            int passengerId = ((Passenger) session.getAttribute("user")).getPassengerId();

            Reservation reservation = new Reservation();
            reservation.setPassengerId(passengerId);
            reservation.setScheduleId(scheduleId);
            reservation.setTravelDate(travelDate);
            reservation.setNumberOfSeats(numberOfSeats);
            reservation.setStatus("Pending");

            boolean reserved = reservationService.createReservation(reservation);
            if (reserved) {
                request.setAttribute("success", "Reservation successful!");
            } else {
                request.setAttribute("error", "Reservation failed. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid input or internal error.");
        }

        doGet(request, response);
    }
}