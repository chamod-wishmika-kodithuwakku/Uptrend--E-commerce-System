package com.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Inventory;

public class InventoryDBUtil {

	// SQL Queries ---------------------------------------------------------------
	private static String SELECT_EXISTING_INVENTORY_RECORDS = "SELECT * FROM stock";
	private static String SELECT_INVENTORY_RECORD_BY_ID = "SELECT * FROM stock WHERE stock_id=?";
	private static String UPDATE_INVENTORY_RECORD_BY_ID;
	private static String INSERT_DELETED_INVENTORY_RECORD = "INSERT INTO deleted_inventory(stock_id, item_name, quantity, available, purchased_price, selling_price, stock_type,"
			+ "item_image, stock_indate, stock_supplier_id) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
	
	private static String GET_LOW_STOCK_RECORD = "SELECT * FROM stock WHERE available <= 10 AND NOT available = 0";
	private static String GET_OUT_STOCK_RECORD = "SELECT * FROM stock WHERE available = 0";
	
	private static String SELECT_ALL_BIN_RECORDS = "SELECT * FROM deleted_inventory";
	
	private static String DELETE_INVENTORY_RECORD = "DELETE FROM stock WHERE stock_id=?";
	private static String DELETE_BIN_RECORD = "DELETE FROM deleted_inventory WHERE stock_id=?";
	
	
	// ------------------------------------------------------------------
	
	// Get all existing inventory records and return them
	public List<Inventory> getAllInventoryRecords() {
		
		ArrayList<Inventory> tempInventoryList = new ArrayList<>();
		
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preStmt = connection.prepareStatement(SELECT_EXISTING_INVENTORY_RECORDS);) {
			
			ResultSet rs = preStmt.executeQuery();
			
			while (rs.next()) {
				
				int invId = rs.getInt(1);
				String itemName = rs.getString(2);
				int quantity = rs.getInt(3);
				int available = rs.getInt(4);
				double purchPrice = rs.getDouble(5);
				double sellPrice =  rs.getDouble(6);
				String itemType = rs.getString(7);
				String itemImg = rs.getString(8);
				String stockInDate = rs.getString(9);
				int supId = rs.getInt(11);
				
				Inventory inv = new Inventory(invId, itemName, quantity, available, purchPrice, sellPrice, itemType, itemImg, stockInDate, supId);
				tempInventoryList.add(inv);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return tempInventoryList;
			
	}
		
	// Get one stock record by using its ID
	public Inventory getInventoryRecordById(int id) {
		
		Inventory inventory = null;
		
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preStmt = connection.prepareStatement(SELECT_INVENTORY_RECORD_BY_ID);) {
			
			preStmt.setInt(1, id);
			ResultSet rs = preStmt.executeQuery();
			
			while (rs.next()) {
				
				int invId = rs.getInt(1);
				String itemName = rs.getString(2);
				int quantity = rs.getInt(3);
				int available = rs.getInt(4);
				double purchPrice = rs.getDouble(5);
				double sellPrice = rs.getDouble(6);
				String itemType = rs.getString(7);
				
				inventory = new Inventory(invId, itemName, quantity, available, purchPrice, sellPrice, itemType);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return inventory;
		
	}
	
	// Update inventory record by using its ID
	public boolean updateInventoryRecord(Inventory inventory, boolean imgStatus) throws SQLException {
		
		boolean rowUpdated;
		PreparedStatement preStmt;
		
		try (Connection connection = DBConnection.getConnection();) {

			if (imgStatus == false) {
				
				UPDATE_INVENTORY_RECORD_BY_ID = "UPDATE stock SET item_name=?, selling_price=?, stock_type=? WHERE stock_id=?";
				
				preStmt = connection.prepareStatement(UPDATE_INVENTORY_RECORD_BY_ID);
				
				preStmt.setString(1, inventory.getItemName());
				preStmt.setDouble(2, inventory.getSellPrice());
				preStmt.setString(3, inventory.getItemType());
				preStmt.setInt(4, inventory.getInvId());
				
			} else {
				
				UPDATE_INVENTORY_RECORD_BY_ID = "UPDATE stock SET item_name=?, selling_price=?, stock_type=?, item_image=? WHERE stock_id=?";
				
				preStmt = connection.prepareStatement(UPDATE_INVENTORY_RECORD_BY_ID);
				
				preStmt.setString(1, inventory.getItemName());
				preStmt.setDouble(2, inventory.getSellPrice());
				preStmt.setString(3, inventory.getItemType());
				preStmt.setString(4, inventory.getItemImg());
				preStmt.setInt(5, inventory.getInvId());
				
			}
			
			rowUpdated = preStmt.executeUpdate() > 0;
			
		}
		
		return rowUpdated;
		
	}
	
	
	//Permanently delete record from inventory
	public boolean permanentlyDeleteInventoryRecord(int id) throws SQLException {
		
		boolean deletionStatus;
		
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_INVENTORY_RECORD);) {
			
			statement.setInt(1, id);
			deletionStatus = statement.executeUpdate() > 0;
			
		}
		
		return deletionStatus;
		
	}
	
	
	// Temporarily delete Record from Inventory
	public boolean temporarilyDeleteInventoryRecord(int id) {
		
		boolean deletionStatus = false;
		boolean isInsert = false;
		
		PreparedStatement preStmtForGet, preStmtForInsert;
		
		try (Connection connection = DBConnection.getConnection()) {
			
			preStmtForGet = connection.prepareStatement(SELECT_INVENTORY_RECORD_BY_ID);
			preStmtForInsert = connection.prepareStatement(INSERT_DELETED_INVENTORY_RECORD);
			
			preStmtForGet.setInt(1, id);
			ResultSet rs = preStmtForGet.executeQuery();
			
			while (rs.next()) {
				
				preStmtForInsert.setInt(1, rs.getInt(1));
				preStmtForInsert.setString(2, rs.getString(2));
				preStmtForInsert.setInt(3, rs.getInt(3));
				preStmtForInsert.setInt(4, rs.getInt(4));
				preStmtForInsert.setDouble(5, rs.getDouble(5));
				preStmtForInsert.setDouble(6, rs.getDouble(6));
				preStmtForInsert.setString(7, rs.getString(7));
				preStmtForInsert.setString(8, rs.getString(8));
				preStmtForInsert.setDate(9, rs.getDate(9));
				preStmtForInsert.setInt(10, rs.getInt(11));
				
			}
			
			isInsert = preStmtForInsert.executeUpdate() > 0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (isInsert == true) {
			
			try {
				deletionStatus = permanentlyDeleteInventoryRecord(id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return deletionStatus;
		
	}
	
	public List<Inventory> getLowStockRecords() {
		
		ArrayList<Inventory> tempInventoryList = new ArrayList<>();
		
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preStmt = connection.prepareStatement(GET_LOW_STOCK_RECORD);) {
			
			ResultSet rs = preStmt.executeQuery();
			
			while (rs.next()) {
				
				int invId = rs.getInt(1);
				String itemName = rs.getString(2);
				int quantity = rs.getInt(3);
				int available = rs.getInt(4);
				double purchPrice = rs.getDouble(5);
				double sellPrice =  rs.getDouble(6);
				String itemType = rs.getString(7);
				String itemImg = rs.getString(8);
				String stockInDate = rs.getString(9);
				int supId = rs.getInt(11);
				
				Inventory inv = new Inventory(invId, itemName, quantity, available, purchPrice, sellPrice, itemType, itemImg, stockInDate, supId);
				tempInventoryList.add(inv);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return tempInventoryList;
			
	}
	
	
	public List<Inventory> getOutOfStockRecords() {
		
		ArrayList<Inventory> tempInventoryList = new ArrayList<>();
		
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preStmt = connection.prepareStatement(GET_OUT_STOCK_RECORD);) {
			
			ResultSet rs = preStmt.executeQuery();
			
			while (rs.next()) {
				
				int invId = rs.getInt(1);
				String itemName = rs.getString(2);
				int quantity = rs.getInt(3);
				int available = rs.getInt(4);
				double purchPrice = rs.getDouble(5);
				double sellPrice =  rs.getDouble(6);
				String itemType = rs.getString(7);
				String itemImg = rs.getString(8);
				String stockInDate = rs.getString(9);
				int supId = rs.getInt(11);
				
				Inventory inv = new Inventory(invId, itemName, quantity, available, purchPrice, sellPrice, itemType, itemImg, stockInDate, supId);
				tempInventoryList.add(inv);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return tempInventoryList;
			
	}
	
	
	public List<Inventory> getAllBinRecords() {
		
		ArrayList<Inventory> tempInventoryList = new ArrayList<>();
		
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preStmt = connection.prepareStatement(SELECT_ALL_BIN_RECORDS);) {
			
			ResultSet rs = preStmt.executeQuery();
			
			while (rs.next()) {
				
				int invId = rs.getInt(1);
				String itemName = rs.getString(2);
				int quantity = rs.getInt(3);
				int available = rs.getInt(4);
				double purchPrice = rs.getDouble(5);
				double sellPrice =  rs.getDouble(6);
				String itemType = rs.getString(7);
				String itemImg = rs.getString(8);
				String stockInDate = rs.getString(9);
				int supId = rs.getInt(11);
				
				Inventory inv = new Inventory(invId, itemName, quantity, available, purchPrice, sellPrice, itemType, itemImg, stockInDate, supId);
				tempInventoryList.add(inv);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return tempInventoryList;
			
	}
	
	
	//permenantlyDeleteBinRecord
	public boolean permenantlyDeleteBinRecord(int id) throws SQLException {
		
		boolean deletionStatus;
		
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_BIN_RECORD);) {
			
			statement.setInt(1, id);
			deletionStatus = statement.executeUpdate() > 0;
			
		}
		
		return deletionStatus;
		
	}
	
}
