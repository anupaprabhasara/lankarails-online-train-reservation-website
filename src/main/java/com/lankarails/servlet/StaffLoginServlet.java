package com.lankarails.servlet;

import com.lankarails.model.Staff;
import com.lankarails.service.StaffService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/staff/login")
public class StaffLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final StaffService staffService = new StaffService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usernameOrEmail = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("staff") != null) {
            response.sendRedirect(request.getContextPath() + "/staff/manage");
            return;
        }

        // Authenticate staff
        Staff staff = authenticateStaff(usernameOrEmail, password);

        if (staff != null) {
            session = request.getSession(true);
            session.setAttribute("staff", staff);
            session.setAttribute("staffId", staff.getStaffId());
            session.setAttribute("username", staff.getUsername());
            session.setAttribute("email", staff.getEmail());
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            response.sendRedirect(request.getContextPath() + "/staff/manage");
        } else {
            request.setAttribute("error", "Incorrect username/email or password!");
            request.getRequestDispatcher("/staff/login.jsp").forward(request, response);
        }
    }

    private Staff authenticateStaff(String usernameOrEmail, String password) {
        List<Staff> staffList = staffService.getAllStaff();
        for (Staff staff : staffList) {
            if ((staff.getUsername().equalsIgnoreCase(usernameOrEmail)
                    || staff.getEmail().equalsIgnoreCase(usernameOrEmail))
                    && staff.getPassword().equals(password)) {
                return staff;
            }
        }
        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("staff") != null) {
            response.sendRedirect(request.getContextPath() + "/staff/manage");
        } else {
            request.getRequestDispatcher("/staff/login.jsp").forward(request, response);
        }
    }
}