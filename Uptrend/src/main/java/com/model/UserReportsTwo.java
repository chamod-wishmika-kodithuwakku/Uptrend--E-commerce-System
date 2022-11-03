package com.model;

public class UserReportsTwo {
	private String uName;
	private String uAddress;
	private String uEmail;

	public UserReportsTwo(String uName, String uAddress, String uEmail) {
		this.uName = uName;
		this.uAddress = uAddress;
		this.uEmail = uEmail;
	}

	public String getuName() {
		return uName;
	}

	public String getuAddress() {
		return uAddress;
	}

	public String getuEmail() {
		return uEmail;
	}

}
