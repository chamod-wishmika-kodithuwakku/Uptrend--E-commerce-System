package com.db;

import java.sql.Connection;
import java.sql.Statement;

public class RegistrationDBUtil {
	private static Connection con = null;
	private static Statement statment = null;

	public static boolean userReg(String user_fname, String secret_type, String user_email, String user_password,
			String user_address, String user_city, String user_phone_number, String secret_password, String user_name,
			String date) {

		boolean isSuccess = false;

		try {

			con = DatabaseConnection.getConnection();
			statment = con.createStatement();
			String sql = "INSERT INTO user_register (user_fname, secret_type, user_email, user_password, user_address,user_city,user_phone_number,secret_password,user_name, reg_date) VALUES ('"
					+ user_fname + "', '" + secret_type + "', '" + user_email + "', '" + user_password + "', '"
					+ user_address + "','" + user_city + "','" + user_phone_number + "','" + secret_password + "','"
					+ user_name + "','" + date + "')";

			statment.executeUpdate(sql);
			isSuccess = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}

}
