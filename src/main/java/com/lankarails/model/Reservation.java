package com.lankarails.model;

public class Reservation {
	private int reservationId;
    private int passengerId;
    private int scheduleId;
    private String travelDate;
    private int numberOfSeats;
    private String reservationTime;
    private String status;

    // From reservations_view
    private String passengerName;
    private String passengerEmail;
    private String trainNumber;
    private String startStation;
    private String endStation;
    private double ticketPrice;
    private String departureTime;
    private String arrivalTime;
    
	public int getReservationId() {
		return reservationId;
	}
	public int getPassengerId() {
		return passengerId;
	}
	public int getScheduleId() {
		return scheduleId;
	}
	public String getTravelDate() {
		return travelDate;
	}
	public int getNumberOfSeats() {
		return numberOfSeats;
	}
	public String getReservationTime() {
		return reservationTime;
	}
	public String getStatus() {
		return status;
	}
	public String getPassengerName() {
		return passengerName;
	}
	public String getPassengerEmail() {
		return passengerEmail;
	}
	public String getTrainNumber() {
		return trainNumber;
	}
	public String getStartStation() {
		return startStation;
	}
	public String getEndStation() {
		return endStation;
	}
	public double getTicketPrice() {
		return ticketPrice;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public String getArrivalTime() {
		return arrivalTime;
	}
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	public void setPassengerId(int passengerId) {
		this.passengerId = passengerId;
	}
	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}
	public void setTravelDate(String travelDate) {
		this.travelDate = travelDate;
	}
	public void setNumberOfSeats(int numberOfSeats) {
		this.numberOfSeats = numberOfSeats;
	}
	public void setReservationTime(String reservationTime) {
		this.reservationTime = reservationTime;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setPassengerName(String passengerName) {
		this.passengerName = passengerName;
	}
	public void setPassengerEmail(String passengerEmail) {
		this.passengerEmail = passengerEmail;
	}
	public void setTrainNumber(String trainNumber) {
		this.trainNumber = trainNumber;
	}
	public void setStartStation(String startStation) {
		this.startStation = startStation;
	}
	public void setEndStation(String endStation) {
		this.endStation = endStation;
	}
	public void setTicketPrice(double ticketPrice) {
		this.ticketPrice = ticketPrice;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
}