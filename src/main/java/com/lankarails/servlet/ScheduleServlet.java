package com.lankarails.servlet;

import com.lankarails.model.Schedule;
import com.lankarails.model.Train;
import com.lankarails.model.Journey;
import com.lankarails.service.ScheduleService;
import com.lankarails.service.TrainService;
import com.lankarails.service.JourneyService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@SuppressWarnings("unused")
@WebServlet("/staff/schedule")
public class ScheduleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ScheduleService scheduleService;
    private TrainService trainService;
    private JourneyService journeyService;

    @Override
    public void init() throws ServletException {
        scheduleService = new ScheduleService();
        trainService = new TrainService();
        journeyService = new JourneyService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            response.sendRedirect(request.getContextPath() + "/staff/login");
            return;
        }

        String action = request.getParameter("action");

        try {
            if (action == null) {
                request.setAttribute("schedules", scheduleService.getAllSchedules());
                request.getRequestDispatcher("/staff/schedules/index.jsp").forward(request, response);

            } else if ("create".equals(action)) {
                request.setAttribute("trains", trainService.getAllTrains());
                request.setAttribute("journeys", journeyService.getAllJourneys());
                request.getRequestDispatcher("/staff/schedules/create.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Schedule schedule = scheduleService.getScheduleById(id);
                if (schedule != null) {
                    request.setAttribute("schedule", schedule);
                    request.setAttribute("trains", trainService.getAllTrains());
                    request.setAttribute("journeys", journeyService.getAllJourneys());
                    request.getRequestDispatcher("/staff/schedules/update.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Schedule not found.");
                }

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                scheduleService.deleteSchedule(id);
                response.sendRedirect(request.getContextPath() + "/staff/schedule");

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing request.");
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

        try {
            int trainId = Integer.parseInt(request.getParameter("train_id"));
            int journeyId = Integer.parseInt(request.getParameter("journey_id"));
            String departureTime = request.getParameter("departure_time");
            String arrivalTime = request.getParameter("arrival_time");

            Schedule schedule = new Schedule();
            schedule.setTrainId(trainId);
            schedule.setJourneyId(journeyId);
            schedule.setDepartureTime(departureTime);
            schedule.setArrivalTime(arrivalTime);

            if ("create".equals(action)) {
                if (scheduleService.createSchedule(schedule)) {
                    response.sendRedirect(request.getContextPath() + "/staff/schedule");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create schedule.");
                }

            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                schedule.setScheduleId(id);
                if (scheduleService.updateSchedule(schedule)) {
                    response.sendRedirect(request.getContextPath() + "/staff/schedule");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update schedule.");
                }

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
    }
}