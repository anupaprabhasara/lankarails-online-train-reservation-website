package com.lankarails.service;

import com.lankarails.model.Reservation;
import com.lankarails.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservationService {

    // Create Reservation
    public boolean createReservation(Reservation reservation) {
        String query = "INSERT INTO reservations (passenger_id, schedule_id, travel_date, number_of_seats, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, reservation.getPassengerId());
            stmt.setInt(2, reservation.getScheduleId());
            stmt.setString(3, reservation.getTravelDate());
            stmt.setInt(4, reservation.getNumberOfSeats());
            stmt.setString(5, reservation.getStatus());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Reservations by Passenger ID (from view)
    public List<Reservation> getReservationsByPassengerId(int passengerId) {
        List<Reservation> reservations = new ArrayList<>();
        String query = "SELECT * FROM reservations_view WHERE passenger_id = ? ORDER BY reservation_time DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, passengerId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                reservations.add(extractReservation(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservations;
    }

    // Get All Reservations (from view)
    public List<Reservation> getAllReservations() {
        List<Reservation> reservations = new ArrayList<>();
        String query = "SELECT * FROM reservations_view ORDER BY reservation_id";

        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                reservations.add(extractReservation(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservations;
    }

    // Get Reservation by ID (from view)
    public Reservation getReservationById(int id) {
        String query = "SELECT * FROM reservations_view WHERE reservation_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return extractReservation(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update Reservation Status
    public boolean updateReservationStatus(int reservationId, String status) {
        String query = "UPDATE reservations SET status = ? WHERE reservation_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, status);
            stmt.setInt(2, reservationId);

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Reservation
    public boolean deleteReservation(int id) {
        String query = "DELETE FROM reservations WHERE reservation_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Extract reservation from ResultSet
    private Reservation extractReservation(ResultSet rs) throws SQLException {
        Reservation reservation = new Reservation();
        reservation.setReservationId(rs.getInt("reservation_id"));
        reservation.setPassengerId(rs.getInt("passenger_id"));
        reservation.setPassengerName(rs.getString("passenger_name"));
        reservation.setPassengerEmail(rs.getString("passenger_email"));
        reservation.setTrainNumber(rs.getString("train_number"));
        reservation.setStartStation(rs.getString("start_station"));
        reservation.setEndStation(rs.getString("end_station"));
        reservation.setTicketPrice(rs.getDouble("ticket_price"));
        reservation.setTravelDate(rs.getString("travel_date"));
        reservation.setDepartureTime(rs.getString("departure_time"));
        reservation.setArrivalTime(rs.getString("arrival_time"));
        reservation.setNumberOfSeats(rs.getInt("number_of_seats"));
        reservation.setReservationTime(rs.getString("reservation_time"));
        reservation.setStatus(rs.getString("status"));
        return reservation;
    }
}