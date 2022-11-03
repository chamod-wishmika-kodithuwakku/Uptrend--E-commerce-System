package com.db;

import com.model.home;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public static  ArrayList<Home> getAllRecords() throws SQLException
{
	ArrayList<Home> samp =new ArrayList<Home>();
	samp.clear();
	Connection con= Provider.getMysqlConnection();
	String sql = "select * from stock";
	try {
		PreparedStatement pst = con.preparedStatment(sql);
		ResultSet rs =pst.executeQuery(sql);
		while(rs.next()) {
			home h1 =new home();
			h1.setHid
			
		}
		
	}
	catch(Exception e2) {
		
		
	}
	
	
	
	
	}
