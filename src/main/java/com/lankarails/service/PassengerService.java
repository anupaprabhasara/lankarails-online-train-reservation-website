package com.lankarails.service;

import com.lankarails.model.Passenger;
import com.lankarails.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PassengerService {

    // Create Passenger
    public boolean createPassenger(Passenger passenger) {
        String query = "INSERT INTO passengers (name, email, password, phone) VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, passenger.getName());
            ps.setString(2, passenger.getEmail());
            ps.setString(3, passenger.getPassword());
            ps.setString(4, passenger.getPhone());
            ps.executeUpdate();
            return true;
        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("Email already exists: " + e.getMessage());
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Email Check
    public boolean isEmailTaken(String email) {
        String query = "SELECT 1 FROM passengers WHERE email = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }

    // Get Passenger by ID
    public Passenger getPassenger(int id) {
        String query = "SELECT * FROM passengers WHERE passenger_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Passenger passenger = new Passenger();
                passenger.setPassengerId(rs.getInt("passenger_id"));
                passenger.setName(rs.getString("name"));
                passenger.setEmail(rs.getString("email"));
                passenger.setPhone(rs.getString("phone"));
                passenger.setPassword(rs.getString("password"));
                passenger.setCreatedAt(rs.getString("created_at"));
                return passenger;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Passengers
    public List<Passenger> getAllPassengers() {
        List<Passenger> passengers = new ArrayList<>();
        String query = "SELECT * FROM passengers ORDER BY passenger_id";
        try (Connection con = DBConnection.getConnection();
             Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Passenger passenger = new Passenger();
                passenger.setPassengerId(rs.getInt("passenger_id"));
                passenger.setName(rs.getString("name"));
                passenger.setEmail(rs.getString("email"));
                passenger.setPhone(rs.getString("phone"));
                passenger.setPassword(rs.getString("password"));
                passenger.setCreatedAt(rs.getString("created_at"));
                passengers.add(passenger);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return passengers;
    }

    // Update Passenger
    public boolean updatePassenger(Passenger passenger) {
        String query = "UPDATE passengers SET name = ?, email = ?, phone = ?, password = ? WHERE passenger_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, passenger.getName());
            ps.setString(2, passenger.getEmail());
            ps.setString(3, passenger.getPhone());
            ps.setString(4, passenger.getPassword());
            ps.setInt(5, passenger.getPassengerId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Passenger
    public boolean deletePassenger(int id) {
        String query = "DELETE FROM passengers WHERE passenger_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}