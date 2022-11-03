package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	private static String url = "jdbc:mysql://localhost:3306/uptrend";
	private static String userName = "root";
	private static String passWord = "root";
	private static Connection con;

	public static Connection getConnection() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, userName, passWord);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
