package com.lankarails.servlet;

import com.lankarails.model.Staff;
import com.lankarails.service.StaffService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/staff/manage")
public class StaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffService staffService;

    @Override
    public void init() throws ServletException {
        staffService = new StaffService();
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
                // List all staff
                request.setAttribute("staffList", staffService.getAllStaff());
                request.getRequestDispatcher("/staff/staffs/index.jsp").forward(request, response);

            } else if ("create".equals(action)) {
                request.getRequestDispatcher("/staff/staffs/create.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Staff staff = staffService.getStaff(id);
                if (staff != null) {
                    request.setAttribute("staff", staff);
                    request.getRequestDispatcher("/staff/staffs/update.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Staff not found.");
                }

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                staffService.deleteStaff(id);
                response.sendRedirect(request.getContextPath() + "/staff/manage");

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

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("staff") == null) {
            response.sendRedirect(request.getContextPath() + "/staff/login");
            return;
        }

        String action = request.getParameter("action");

        try {
            if ("create".equals(action)) {
                Staff staff = new Staff();
                staff.setUsername(request.getParameter("username"));
                staff.setEmail(request.getParameter("email"));
                staff.setPassword(request.getParameter("password"));

                if (staffService.createStaff(staff)) {
                    response.sendRedirect(request.getContextPath() + "/staff/manage");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create staff.");
                }

            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Staff staff = new Staff();
                staff.setStaffId(id);
                staff.setUsername(request.getParameter("username"));
                staff.setEmail(request.getParameter("email"));
                staff.setPassword(request.getParameter("password"));

                if (staffService.updateStaff(staff)) {
                    response.sendRedirect(request.getContextPath() + "/staff/manage");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update staff.");
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