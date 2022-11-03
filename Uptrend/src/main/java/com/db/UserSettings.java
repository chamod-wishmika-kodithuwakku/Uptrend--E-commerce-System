package com.db;

import java.sql.Connection;
import java.sql.Statement;

public class UserSettings {
	private static Connection con = null;
	private static Statement statment = null;
	private static Statement statment1 = null;
	private static Statement statment2 = null;

	public static void userUpdate(String user_fname, String secret_type, String user_email, String user_password,
			String user_address, String user_city, String user_phone_number, String secret_password, String user_name) {
		try {
			con = DatabaseConnection.getConnection();
			statment = con.createStatement();
			String sql = "UPDATE user_register SET user_fname = '" + user_fname + "', secret_type = '" + secret_type
					+ "', user_email='" + user_email + "', user_password='" + user_password + "', user_address='"
					+ user_address + "', user_city='" + user_city + "', user_phone_number='" + user_phone_number
					+ "', secret_password='" + secret_password + "', user_name='" + user_name + "' WHERE user_name='"
					+ user_name + "'";
			statment.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void addToDeletetTable(String name, String userName, String email, String address, String city,
			String phoneNo) {
		try {
			con = DatabaseConnection.getConnection();
			statment1 = con.createStatement();
			String sql = "INSERT INTO deleted_user (name, userName, email, address, city, phoneNo) VALUES ('" + name
					+ "', '" + userName + "','" + email + "','" + address + "','" + city + "','" + phoneNo + "');";
			statment1.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void deleteUser(String userName) {
		try {
			con = DatabaseConnection.getConnection();
			statment2 = con.createStatement();
			String sql = "DELETE FROM user_register WHERE user_name='" + userName + "'";
			statment2.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
