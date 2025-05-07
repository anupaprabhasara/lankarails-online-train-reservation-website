package com.lankarails.model;

public class Journey {
	private int journeyId;
    private String startStation;
    private String endStation;
    private double ticketPrice;
    
	public int getJourneyId() {
		return journeyId;
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
	public void setJourneyId(int journeyId) {
		this.journeyId = journeyId;
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