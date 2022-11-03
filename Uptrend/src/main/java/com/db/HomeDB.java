package com.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.model.home;

public class HomeDB {
	private static Connection con = null;
	private static Statement statment = null;
	private static ResultSet rs = null;

	public static home userDetails(String id) {
		
		home h = null;

		try {
			con = DatabaseConnection.getConnection();
			statment = con.createStatement();
			String sql = "select * from uptrend.stock where stock_type = 'men'";
			rs = statment.executeQuery(sql);
			
			
			System.out.println("mn awaaa");
			
			while (rs.next()) {
				String  hid = rs.getString("stock_id");
				String iname = rs.getString("item_name");
				int avaliable = rs.getInt("available");
				double sprice = rs.getDouble("selling_price");
				String image = rs.getString("item_image");
			
				System.out.println(avaliable);

				

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return h;
	}
}
