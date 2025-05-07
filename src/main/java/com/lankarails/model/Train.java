package com.lankarails.model;

public class Train {
	private int trainId;
    private String trainNumber;
    private int totalSeats;
    
	public int getTrainId() {
		return trainId;
	}
	public String getTrainNumber() {
		return trainNumber;
	}
	public int getTotalSeats() {
		return totalSeats;
	}
	public void setTrainId(int trainId) {
		this.trainId = trainId;
	}
	public void setTrainNumber(String trainNumber) {
		this.trainNumber = trainNumber;
	}
	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}
}