package com.model;

public class deletedUser {
	private int userId;
	private String name;
	private String userName;
	private String email;
	private String address;
	private String city;
	private String phoneNo;

	public deletedUser(int userId, String name, String userName, String email, String address, String city,
			String phoneNo) {
		this.userId = userId;
		this.name = name;
		this.userName = userName;
		this.email = email;
		this.address = address;
		this.city = city;
		this.phoneNo = phoneNo;
	}

	public int getUserId() {
		return userId;
	}

	public String getName() {
		return name;
	}

	public String getUserName() {
		return userName;
	}

	public String getEmail() {
		return email;
	}

	public String getAddress() {
		return address;
	}

	public String getCity() {
		return city;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

}
