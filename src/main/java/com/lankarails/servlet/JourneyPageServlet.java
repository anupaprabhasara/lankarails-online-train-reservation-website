package com.lankarails.servlet;

import com.lankarails.model.Journey;
import com.lankarails.service.JourneyService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/journeys")
public class JourneyPageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private JourneyService journeyService;

    @Override
    public void init() throws ServletException {
        journeyService = new JourneyService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Load all journeys
        List<Journey> journeys = journeyService.getAllJourneys();
        request.setAttribute("journeys", journeys);

        // 2. Check login status for passengers
        HttpSession session = request.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
        request.setAttribute("isLoggedIn", isLoggedIn);

        // 3. Forward to journeys.jsp
        request.getRequestDispatcher("/client/journeys.jsp").forward(request, response);
    }
}