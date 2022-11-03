package com.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.User;

public class UserSearch {
	private static Connection con = null;
	private static Statement statment = null;
	private static ResultSet rs = null;

	public static List<User> userDetails(String searchTerm) {
		ArrayList<User> userArray = new ArrayList<User>();

		try {
			con = DatabaseConnection.getConnection();
			statment = con.createStatement();
			String sql = "select * from user_register where user_name='" + searchTerm + "' || user_fname='" + searchTerm
					+ "' || user_email='" + searchTerm + "'";
			rs = statment.executeQuery(sql);

			while (rs.next()) {
				int user_id = rs.getInt(1);
				String user_fname = rs.getString(2);
				String secret_type = rs.getString(3);
				String user_email = rs.getString(4);
				String user_password = rs.getString(5);
				String user_address = rs.getString(6);
				String user_city = rs.getString(7);
				String user_phone_number = rs.getString(8);
				String secret_password = rs.getString(9);
				String user_name = rs.getString(10);
				String date = rs.getString(11);

				User e = new User(user_id, user_fname, secret_type, user_email, user_password, user_address, user_city,
						user_phone_number, secret_password, user_name, date);
				userArray.add(e);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return userArray;
	}
}
