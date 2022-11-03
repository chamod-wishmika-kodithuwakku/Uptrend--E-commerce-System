package com.db;

import java.sql.Connection;
import java.sql.Statement;

public class DeleteUserPermenently {

	private static Connection con = null;
	private static Statement statment = null;

	public static void deleteUser(int uId) {
		try {
			con = com.db.DatabaseConnection.getConnection();
			statment = con.createStatement();
			String sql = "DELETE FROM deleted_user WHERE userId='" + uId + "'";
			statment.executeUpdate(sql);
			System.out.println(uId);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
