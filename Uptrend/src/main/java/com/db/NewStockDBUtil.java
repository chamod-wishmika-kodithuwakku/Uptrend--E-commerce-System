package com.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.model.Inventory;
import com.model.NewStock;

public class NewStockDBUtil {
	
	// SQL Queries ---------------------------------------------------------------
	private static String SELECT_NEWLY_ADDED_ITEMS = "SELECT * FROM supplier WHERE supplier_id NOT IN(SELECT stock_supplier_id FROM stock) AND supplier_id NOT IN(SELECT stock_supplier_id FROM deleted_inventory)";
	private static String SELECT_NEW_STOCK_RECORD_BY_ID = "SELECT * FROM supplier WHERE supplier_id=?";
	private static String INSERT_NEW_ITEM_TO_INVENTORY = "INSERT INTO stock(item_name, quantity, available, purchased_price, selling_price, stock_type,"
			+ "item_image, stock_indate, stock_supplier_id) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?) ";
	
	
	
	// --------------------
	
	// Get all newly added stocks and return them
	public List<NewStock> selectAllStocks() {
		
		ArrayList<NewStock> tempSupItem = new ArrayList<>();
		
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preStmt = connection.prepareStatement(SELECT_NEWLY_ADDED_ITEMS);) {
			
			ResultSet rs = preStmt.executeQuery();
			
			while (rs.next()) {
				
				int supId = rs.getInt(1);
				String supItem = rs.getString(6);
				int quantity = rs.getInt(7);
				double price = rs.getDouble(8);
				
				NewStock newStock = new NewStock(supId, supItem, quantity, price);
				tempSupItem.add(newStock);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return tempSupItem;
		
	}
	
	// Get stock record by its ID
	public NewStock getNewStockRecordById(int id) {
		
		NewStock newStock = null;
		
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preStmt = connection.prepareStatement(SELECT_NEW_STOCK_RECORD_BY_ID);) {
			
			preStmt.setInt(1, id);
			ResultSet rs = preStmt.executeQuery();
			
			while (rs.next()) {
				
				int supId = rs.getInt(1);
				String supItem = rs.getString(6);
				int quantity = rs.getInt(7);
				double price = rs.getDouble(8);
				
				newStock = new NewStock(supId, supItem, quantity, price);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return newStock;
		
	}
	
	// Insert Stock records to inventory table
	public boolean insertItemToInventory(Inventory inventory) {
		
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preStmt = connection.prepareStatement(INSERT_NEW_ITEM_TO_INVENTORY);) {
			
			Date date = new Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			
			preStmt.setString(1, inventory.getItemName());
			preStmt.setInt(2, inventory.getQuantity());
			preStmt.setInt(3, inventory.getAvailable());
			preStmt.setDouble(4, inventory.getPurchPrice());
			preStmt.setDouble(5, inventory.getSellPrice());
			preStmt.setString(6, inventory.getItemType());
			preStmt.setString(7, inventory.getItemImg());
			preStmt.setDate(8, sqlDate);
			preStmt.setInt(9, inventory.getSupId());
			
			preStmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return true;
		
	}
	
}
