package com.lankarails.service;

import com.lankarails.model.Train;
import com.lankarails.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrainService {

    // Create Train
    public boolean createTrain(Train train) {
        String query = "INSERT INTO trains (train_number, total_seats) VALUES (?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, train.getTrainNumber());
            stmt.setInt(2, train.getTotalSeats());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Train by ID
    public Train getTrain(int id) {
        String query = "SELECT * FROM trains WHERE train_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Train train = new Train();
                train.setTrainId(rs.getInt("train_id"));
                train.setTrainNumber(rs.getString("train_number"));
                train.setTotalSeats(rs.getInt("total_seats"));
                return train;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Trains
    public List<Train> getAllTrains() {
        List<Train> trains = new ArrayList<>();
        String query = "SELECT * FROM trains ORDER BY train_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Train train = new Train();
                train.setTrainId(rs.getInt("train_id"));
                train.setTrainNumber(rs.getString("train_number"));
                train.setTotalSeats(rs.getInt("total_seats"));
                trains.add(train);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return trains;
    }

    // Update Train
    public boolean updateTrain(Train train) {
        String query = "UPDATE trains SET train_number = ?, total_seats = ? WHERE train_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, train.getTrainNumber());
            stmt.setInt(2, train.getTotalSeats());
            stmt.setInt(3, train.getTrainId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Train
    public boolean deleteTrain(int id) {
        String query = "DELETE FROM trains WHERE train_id = ?";
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