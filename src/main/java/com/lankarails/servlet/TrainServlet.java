package com.lankarails.servlet;

import com.lankarails.model.Train;
import com.lankarails.service.TrainService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/staff/train")
public class TrainServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TrainService trainService;

    @Override
    public void init() throws ServletException {
        trainService = new TrainService();
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
                request.setAttribute("trains", trainService.getAllTrains());
                request.getRequestDispatcher("/staff/trains/index.jsp").forward(request, response);

            } else if ("create".equals(action)) {
                request.getRequestDispatcher("/staff/trains/create.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Train train = trainService.getTrain(id);
                if (train != null) {
                    request.setAttribute("train", train);
                    request.getRequestDispatcher("/staff/trains/update.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Train not found.");
                }

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                trainService.deleteTrain(id);
                response.sendRedirect(request.getContextPath() + "/staff/train");

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

        // Session Check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            response.sendRedirect(request.getContextPath() + "/staff/login");
            return;
        }

        String action = request.getParameter("action");

        try {
            if ("create".equals(action)) {
                String trainNumber = request.getParameter("train_number");
                int totalSeats = Integer.parseInt(request.getParameter("total_seats"));

                Train train = new Train();
                train.setTrainNumber(trainNumber);
                train.setTotalSeats(totalSeats);

                if (trainService.createTrain(train)) {
                    response.sendRedirect(request.getContextPath() + "/staff/train");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create train.");
                }

            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String trainNumber = request.getParameter("train_number");
                int totalSeats = Integer.parseInt(request.getParameter("total_seats"));

                Train train = new Train();
                train.setTrainId(id);
                train.setTrainNumber(trainNumber);
                train.setTotalSeats(totalSeats);

                if (trainService.updateTrain(train)) {
                    response.sendRedirect(request.getContextPath() + "/staff/train");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update train.");
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