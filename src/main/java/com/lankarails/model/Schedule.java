package com.lankarails.model;

public class Schedule {
	private int scheduleId;
    private int trainId;
    private int journeyId;
    private String departureTime;
    private String arrivalTime;

    // From schedules_view
    private String trainNumber;
    private String startStation;
    private String endStation;
    private double ticketPrice;
    
	public int getScheduleId() {
		return scheduleId;
	}
	public int getTrainId() {
		return trainId;
	}
	public int getJourneyId() {
		return journeyId;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public String getArrivalTime() {
		return arrivalTime;
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
	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}
	public void setTrainId(int trainId) {
		this.trainId = trainId;
	}
	public void setJourneyId(int journeyId) {
		this.journeyId = journeyId;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
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
}