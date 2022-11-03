package com.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.deletedUser;
import com.model.home;

public class Home {
	
	
	
	
	

	private static Connection con = null;
	private static Statement statment = null;
	private static ResultSet rs = null;

	public static List<home> userDetails(String id) {

		ArrayList<home> userArray = new ArrayList<home>();

		try {
			con = DatabaseConnection.getConnection();
			statment = con.createStatement();
			String sql = "select * from stock where stock_type = id";
			rs = statment.executeQuery(sql);

			while (rs.next()) {
				String  hid = rs.getString("stock_id");
				String iname = rs.getString("item_name");
				int avaliable = rs.getInt("avaliable");
				double sprice = rs.getDouble("selling_price");
				String image = rs.getString("item_image");
			

				home h = new com.model.home(hid, iname, avaliable, sprice, image);
				userArray.add(h);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return userArray;
	}
}
