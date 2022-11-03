package com.model;

public class User {
	private int user_id;
	private String user_fname;
	private String secret_type;
	private String user_email;
	private String user_password;
	private String user_address;
	private String user_city;
	private String user_phone_number;
	private String secret_password;
	private String user_name;
	private String reg_date;

	public User(int user_id, String user_fname, String secret_type, String user_email, String user_password,
			String user_address, String user_city, String user_phone_number, String secret_password, String user_name,
			String reg_date) {
		this.user_id = user_id;
		this.user_fname = user_fname;
		this.secret_type = secret_type;
		this.user_email = user_email;
		this.user_password = user_password;
		this.user_address = user_address;
		this.user_city = user_city;
		this.user_phone_number = user_phone_number;
		this.secret_password = secret_password;
		this.user_name = user_name;
		this.reg_date = reg_date;
	}

	public int getUser_id() {
		return user_id;
	}

	public String getUser_fname() {
		return user_fname;
	}

	public String getSecret_type() {
		return secret_type;
	}

	public String getUser_email() {
		return user_email;
	}

	public String getUser_password() {
		return user_password;
	}

	public String getUser_address() {
		return user_address;
	}

	public String getUser_city() {
		return user_city;
	}

	public String getUser_phone_number() {
		return user_phone_number;
	}

	public String getSecret_password() {
		return secret_password;
	}

	public String getUser_name() {
		return user_name;
	}

	public String getReg_date() {
		return reg_date;
	}

}
