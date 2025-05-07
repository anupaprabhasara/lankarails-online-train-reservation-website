package com.lankarails.servlet;

import com.lankarails.model.Journey;
import com.lankarails.service.JourneyService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/staff/journey")
public class JourneyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private JourneyService journeyService;

    @Override
    public void init() throws ServletException {
        journeyService = new JourneyService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Session check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            response.sendRedirect(request.getContextPath() + "/staff/login");
            return;
        }

        String action = request.getParameter("action");

        try {
            if (action == null) {
                // List all journeys
                request.setAttribute("journeys", journeyService.getAllJourneys());
                request.getRequestDispatcher("/staff/journeys/index.jsp").forward(request, response);

            } else if ("create".equals(action)) {
                // Show create form
                request.getRequestDispatcher("/staff/journeys/create.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Journey journey = journeyService.getJourney(id);
                if (journey != null) {
                    request.setAttribute("journey", journey);
                    request.getRequestDispatcher("/staff/journeys/update.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Journey not found.");
                }

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                journeyService.deleteJourney(id);
                response.sendRedirect(request.getContextPath() + "/staff/journey");

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
        // Session check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            response.sendRedirect(request.getContextPath() + "/staff/login");
            return;
        }

        String action = request.getParameter("action");

        try {
            if ("create".equals(action)) {
                String startStation = request.getParameter("start_station");
                String endStation = request.getParameter("end_station");
                double ticketPrice = Double.parseDouble(request.getParameter("ticket_price"));

                Journey journey = new Journey();
                journey.setStartStation(startStation);
                journey.setEndStation(endStation);
                journey.setTicketPrice(ticketPrice);

                if (journeyService.createJourney(journey)) {
                    response.sendRedirect(request.getContextPath() + "/staff/journey");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create journey.");
                }

            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String startStation = request.getParameter("start_station");
                String endStation = request.getParameter("end_station");
                double ticketPrice = Double.parseDouble(request.getParameter("ticket_price"));

                Journey journey = new Journey();
                journey.setJourneyId(id);
                journey.setStartStation(startStation);
                journey.setEndStation(endStation);
                journey.setTicketPrice(ticketPrice);

                if (journeyService.updateJourney(journey)) {
                    response.sendRedirect(request.getContextPath() + "/staff/journey");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update journey.");
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