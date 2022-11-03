package com.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.model.UserReportsTwo;

public class UserReports {

	private static Connection con = null;
	private static Statement statment = null;
	private static ResultSet rs = null;

	public static List<com.model.UserReports> userLocations() {
		ArrayList<com.model.UserReports> locationCount = new ArrayList<com.model.UserReports>();

		try {
			con = DatabaseConnection.getConnection();
			statment = con.createStatement();
			String sql = "select user_city, COUNT(*) from user_register GROUP BY user_city";
			rs = statment.executeQuery(sql);

			while (rs.next()) {
				String location = rs.getString(1);
				String count = rs.getString(2);

				com.model.UserReports uReport = new com.model.UserReports(location, count);
				locationCount.add(uReport);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return locationCount;
	}

	public static List<UserReportsTwo> todayReg() {
		ArrayList<UserReportsTwo> todayRegUsers = new ArrayList<UserReportsTwo>();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date dates = new Date();
		String regDate = formatter.format(dates);

		try {
			con = DatabaseConnection.getConnection();
			statment = con.createStatement();
			String sql = "select user_fname, user_address, user_email from user_register where reg_date='" + regDate
					+ "'";
			rs = statment.executeQuery(sql);

			while (rs.next()) {
				String uName = rs.getString(1);
				String uAddress = rs.getString(2);
				String uEmail = rs.getString(3);

				com.model.UserReportsTwo uReportTwo = new com.model.UserReportsTwo(uName, uAddress, uEmail);
				todayRegUsers.add(uReportTwo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return todayRegUsers;
	}

	public static String userCount() {

		String count="";
		try {
			con = DatabaseConnection.getConnection();
			statment = con.createStatement();
			String sql = "select COUNT(*) from user_register";
			rs = statment.executeQuery(sql);

			while (rs.next()) {
				count = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
