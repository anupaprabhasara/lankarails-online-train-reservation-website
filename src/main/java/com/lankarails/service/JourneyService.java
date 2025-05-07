package com.lankarails.service;

import com.lankarails.model.Journey;
import com.lankarails.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JourneyService {

    // Create Journey
    public boolean createJourney(Journey journey) {
        String query = "INSERT INTO journeys (start_station, end_station, ticket_price) VALUES (?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, journey.getStartStation());
            stmt.setString(2, journey.getEndStation());
            stmt.setDouble(3, journey.getTicketPrice());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Journey by ID
    public Journey getJourney(int id) {
        String query = "SELECT * FROM journeys WHERE journey_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Journey journey = new Journey();
                journey.setJourneyId(rs.getInt("journey_id"));
                journey.setStartStation(rs.getString("start_station"));
                journey.setEndStation(rs.getString("end_station"));
                journey.setTicketPrice(rs.getDouble("ticket_price"));
                return journey;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get Top Journeys
    public List<Journey> getTopJourneys(int limit) {
        List<Journey> journeys = new ArrayList<>();
        String query = "SELECT * FROM journeys ORDER BY journey_id LIMIT ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, limit);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Journey journey = new Journey();
                journey.setJourneyId(rs.getInt("journey_id"));
                journey.setStartStation(rs.getString("start_station"));
                journey.setEndStation(rs.getString("end_station"));
                journey.setTicketPrice(rs.getDouble("ticket_price"));
                journeys.add(journey);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return journeys;
    }

    // Get All Journeys
    public List<Journey> getAllJourneys() {
        List<Journey> journeys = new ArrayList<>();
        String query = "SELECT * FROM journeys ORDER BY journey_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Journey journey = new Journey();
                journey.setJourneyId(rs.getInt("journey_id"));
                journey.setStartStation(rs.getString("start_station"));
                journey.setEndStation(rs.getString("end_station"));
                journey.setTicketPrice(rs.getDouble("ticket_price"));
                journeys.add(journey);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return journeys;
    }

    // Update Journey
    public boolean updateJourney(Journey journey) {
        String query = "UPDATE journeys SET start_station = ?, end_station = ?, ticket_price = ? WHERE journey_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, journey.getStartStation());
            stmt.setString(2, journey.getEndStation());
            stmt.setDouble(3, journey.getTicketPrice());
            stmt.setInt(4, journey.getJourneyId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Journey
    public boolean deleteJourney(int id) {
        String query = "DELETE FROM journeys WHERE journey_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}