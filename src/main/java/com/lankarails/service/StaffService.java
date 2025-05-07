package com.lankarails.service;

import com.lankarails.model.Staff;
import com.lankarails.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StaffService {

    // Create Staff
    public boolean createStaff(Staff staff) {
        String query = "INSERT INTO staff (username, email, password, created_at) VALUES (?, ?, ?, NOW())";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, staff.getUsername());
            stmt.setString(2, staff.getEmail());
            stmt.setString(3, staff.getPassword());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Staff by ID
    public Staff getStaff(int id) {
        String query = "SELECT * FROM staff WHERE staff_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Staff staff = new Staff();
                staff.setStaffId(rs.getInt("staff_id"));
                staff.setUsername(rs.getString("username"));
                staff.setEmail(rs.getString("email"));
                staff.setPassword(rs.getString("password"));
                staff.setCreatedAt(rs.getString("created_at"));
                return staff;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Staff
    public List<Staff> getAllStaff() {
        List<Staff> staffList = new ArrayList<>();
        String query = "SELECT * FROM staff ORDER BY staff_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Staff staff = new Staff();
                staff.setStaffId(rs.getInt("staff_id"));
                staff.setUsername(rs.getString("username"));
                staff.setEmail(rs.getString("email"));
                staff.setPassword(rs.getString("password"));
                staff.setCreatedAt(rs.getString("created_at"));
                staffList.add(staff);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffList;
    }

    // Update Staff
    public boolean updateStaff(Staff staff) {
        String query = "UPDATE staff SET username = ?, email = ?, password = ? WHERE staff_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, staff.getUsername());
            stmt.setString(2, staff.getEmail());
            stmt.setString(3, staff.getPassword());
            stmt.setInt(4, staff.getStaffId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Staff
    public boolean deleteStaff(int id) {
        String query = "DELETE FROM staff WHERE staff_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Staff by Username (for Login Authentication)
    public Staff getStaffByUsername(String username) {
        String query = "SELECT * FROM staff WHERE username = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Staff staff = new Staff();
                staff.setStaffId(rs.getInt("staff_id"));
                staff.setUsername(rs.getString("username"));
                staff.setEmail(rs.getString("email"));
                staff.setPassword(rs.getString("password"));
                staff.setCreatedAt(rs.getString("created_at"));
                return staff;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}