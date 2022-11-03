package com.db;

import com.model.home;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Records1 {
	
	public static ArrayList<home> getAllRecords(){
		
		ArrayList<home> samp =new ArrayList<home>();
		samp.clear();
		Connection con=DatabaseConnection.getConnection();
		String sql = "select * from uptrend.stock";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs =pst.executeQuery(sql);
			while(rs.next()) {
				home h1= new home();
				h1.setHid(rs.getInt("stock_id"));
				h1.setIname(rs.getString("item_name"));
				h1.setAvaliable(rs.getInt("available"));
				h1.setSprice(rs.getDouble("selling_price"));
				h1.setImage(rs.getString("item_image"));
				h1.setStock_type(rs.getString("stock_type"));
				
			     samp.add(h1);	
			     }
			
		}
		catch(Exception e2) {
			
			
		}
		return samp;
		
		
	}
	

}
