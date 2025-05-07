-- ========================================
-- Create Database
-- ========================================
CREATE DATABASE IF NOT EXISTS lankarails_db;
USE lankarails_db;

-- ========================================
-- Table: passengers
-- ========================================
CREATE TABLE passengers (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ========================================
-- Table: staff
-- ========================================
CREATE TABLE staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ========================================
-- Table: trains
-- ========================================
CREATE TABLE trains (
    train_id INT AUTO_INCREMENT PRIMARY KEY,
    train_number VARCHAR(50) NOT NULL,
    total_seats INT NOT NULL
);

-- ========================================
-- Table: journeys
-- ========================================
CREATE TABLE journeys (
    journey_id INT AUTO_INCREMENT PRIMARY KEY,
    start_station VARCHAR(100) NOT NULL,
    end_station VARCHAR(100) NOT NULL,
    ticket_price DECIMAL(10,2) NOT NULL
);

-- ========================================
-- Table: schedules
-- ========================================
CREATE TABLE schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    train_id INT NOT NULL,
    journey_id INT NOT NULL,
    departure_time TIME NOT NULL,
    arrival_time TIME NOT NULL,
    FOREIGN KEY (train_id) REFERENCES trains(train_id) ON DELETE CASCADE,
    FOREIGN KEY (journey_id) REFERENCES journeys(journey_id) ON DELETE CASCADE
);

-- ========================================
-- Table: reservations
-- ========================================
CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT NOT NULL,
    schedule_id INT NOT NULL,
    travel_date DATE NOT NULL,
    number_of_seats INT NOT NULL,
    reservation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Confirmed', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id) ON DELETE CASCADE,
    FOREIGN KEY (schedule_id) REFERENCES schedules(schedule_id) ON DELETE CASCADE
);

-- ========================================
-- View: schedules_view
-- ========================================
CREATE OR REPLACE VIEW schedules_view AS
SELECT 
    s.schedule_id,
    s.train_id,
    s.journey_id,
    t.train_number,
    j.start_station,
    j.end_station,
    j.ticket_price,
    s.departure_time,
    s.arrival_time
FROM 
    schedules s
JOIN trains t ON s.train_id = t.train_id
JOIN journeys j ON s.journey_id = j.journey_id;

-- ========================================
-- View: reservations_view
-- ========================================
CREATE VIEW reservations_view AS
SELECT 
    r.reservation_id,
    r.passenger_id,
    p.name AS passenger_name,
    p.email AS passenger_email,
    sv.train_number,
    sv.start_station,
    sv.end_station,
    sv.ticket_price,
    r.travel_date,
    sv.departure_time,
    sv.arrival_time,
    r.number_of_seats,
    r.reservation_time,
    r.status
FROM 
    reservations r
JOIN passengers p ON r.passenger_id = p.passenger_id
JOIN schedules_view sv ON r.schedule_id = sv.schedule_id;

-- ========================================
-- Sample Data
-- ========================================

-- Passengers
INSERT INTO passengers (name, email, phone, password) VALUES
('Kasun Silva', 'kasun@gmail.com', '0771234567', 'password123'),
('Nimali Perera', 'nimali@gmail.com', '0767654321', 'mypassword'),
('Sahan Jayasuriya', 'sahanj@gmail.com', '0789876543', 'passsahan'),
('Iresha Kumari', 'iresha.k@gmail.com', '0756541234', 'iresha123');

-- Staff
INSERT INTO staff (username, email, password) VALUES
('admin_rail1', 'admin1@lankarails.com', 'adminpass1'),
('admin_rail2', 'admin2@lankarails.com', 'adminpass2');

-- Trains
INSERT INTO trains (train_number, total_seats) VALUES
('TR-1001', 200),
('TR-1002', 180),
('TR-1003', 220),
('TR-1004', 150),
('TR-1005', 170);

-- Journeys (was previously 'routes')
INSERT INTO journeys (start_station, end_station, ticket_price) VALUES
('Colombo', 'Kandy', 900.00),
('Kandy', 'Colombo', 900.00),
('Colombo', 'Galle', 800.00),
('Galle', 'Colombo', 800.00);

-- Schedules
INSERT INTO schedules (train_id, journey_id, departure_time, arrival_time) VALUES
(1, 1, '06:00:00', '09:00:00'),
(2, 1, '09:00:00', '12:00:00'),
(3, 1, '12:00:00', '15:00:00'),
(4, 1, '15:00:00', '18:00:00'),
(5, 1, '18:00:00', '21:00:00');

-- Reservations
INSERT INTO reservations (passenger_id, schedule_id, travel_date, number_of_seats, status) VALUES
(1, 1, '2025-05-10', 2, 'Confirmed'),
(2, 2, '2025-05-10', 1, 'Pending'),
(3, 3, '2025-05-11', 3, 'Confirmed'),
(4, 4, '2025-05-11', 2, 'Pending'),
(1, 5, '2025-05-12', 1, 'Cancelled'),
(2, 2, '2025-05-12', 2, 'Confirmed');