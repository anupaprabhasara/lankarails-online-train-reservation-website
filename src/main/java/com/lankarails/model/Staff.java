package com.lankarails.model;

public class Staff {
	private int staffId;
    private String username;
    private String email;
    private String password;
    private String createdAt;
    
	public int getStaffId() {
		return staffId;
	}
	public String getUsername() {
		return username;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
}