package com.model;

public class UserReports {
	private String location;
	private String count;

	public UserReports(String location, String count) {
		this.location = location;
		this.count = count;
	}

	public String getLocation() {
		return location;
	}

	public String getCount() {
		return count;
	}

}
