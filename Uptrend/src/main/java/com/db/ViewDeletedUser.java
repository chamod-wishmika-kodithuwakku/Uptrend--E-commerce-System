package com.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.deletedUser;

public class ViewDeletedUser {

	private static Connection con = null;
	private static Statement statment = null;
	private static ResultSet rs = null;

	public static List<deletedUser> userDetails() {
		ArrayList<deletedUser> userArray = new ArrayList<deletedUser>();

		try {
			con = DatabaseConnection.getConnection();
			statment = con.createStatement();
			String sql = "select * from deleted_user";
			rs = statment.executeQuery(sql);

			while (rs.next()) {
				int uId = rs.getInt(1);
				String uname = rs.getString(2);
				String uUserName = rs.getString(3);
				String uEmail = rs.getString(4);
				String uAddress = rs.getString(5);
				String uCity = rs.getString(6);
				String uPhone = rs.getString(7);

				deletedUser u = new com.model.deletedUser(uId, uname, uUserName, uEmail, uAddress, uCity, uPhone);
				userArray.add(u);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return userArray;
	}

}
