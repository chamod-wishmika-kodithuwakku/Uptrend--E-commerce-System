package com.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.User;

public class Login {
	private static Connection con = null;
	private static Statement statment = null;
	private static ResultSet rs = null;
	public static String SetUserName;

	public static boolean userVerification(String logUname, String logPword) {
		boolean isSuccess = false;

		try {
			con = DatabaseConnection.getConnection();
			statment = con.createStatement();
			String sql = "select * from user_register where user_name='" + logUname + "' && user_password='" + logPword
					+ "'";
			rs = statment.executeQuery(sql);

			if (rs.next()) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static List<User> userDetails(String userName) {
		ArrayList<User> userArray = new ArrayList<User>();

		try {
			con = DatabaseConnection.getConnection();
			statment = con.createStatement();
			String sql = "select * from user_register where user_name='" + userName + "'";
			rs = statment.executeQuery(sql);

			while (rs.next()) {
				int uId = rs.getInt(1);
				String uFname = rs.getString(2);
				String uType = rs.getString(3);
				String uEmail = rs.getString(4);
				String uPassword = rs.getString(5);
				String uAddress = rs.getString(6);
				String uCity = rs.getString(7);
				String uPhone = rs.getString(8);
				String uSPassword = rs.getString(9);
				String uUserName = rs.getString(10);
				String uDate = rs.getString(11);

				User u = new User(uId, uFname, uType, uEmail, uPassword, uAddress, uCity, uPhone, uSPassword,
						uUserName,uDate);
				userArray.add(u);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return userArray;
	}

	public static void forgotPassword(String email, String answer, String password) {
		try {
			con = DatabaseConnection.getConnection();
			statment = con.createStatement();
			String sql = "UPDATE user_register SET user_password = '" + password + "' WHERE user_email='" + email
					+ "' && secret_password='" + answer + "'";
			statment.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
