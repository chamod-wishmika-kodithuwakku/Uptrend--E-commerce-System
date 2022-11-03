package com.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class AdminLogin {
	private static Connection con = null;
	private static Statement statment = null;
	private static ResultSet rs = null;

	public static boolean userVerification(String logUname, String logPword) {
		boolean isSuccess = false;

		try {
			con = DatabaseConnection.getConnection();
			statment = con.createStatement();
			String sql = "select * from admin_register where user_name='" + logUname + "' && password='" + logPword
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

}
