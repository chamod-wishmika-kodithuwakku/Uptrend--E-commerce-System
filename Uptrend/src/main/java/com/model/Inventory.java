package com.model;

public class Inventory {

	// Declare Variables -----------------------------------------------
	
	private int invId;
	private String itemName;
	private int quantity;
	private int available;
	private double purchPrice;
	private double sellPrice;
	private String itemType;
	private String itemImg;
	private String stockInDate;
	private int supId;
	
	
	// Constructors -----------------------------------------------------
	
	public Inventory(int invId, String itemName, int quantity, int available, double purchPrice, double sellPrice,
			String itemType, String itemImg, String stockInDate, int supId) {

		this.invId = invId;
		this.itemName = itemName;
		this.quantity = quantity;
		this.available = available;
		this.purchPrice = purchPrice;
		this.sellPrice = sellPrice;
		this.itemType = itemType;
		this.itemImg = itemImg;
		this.stockInDate = stockInDate;
		this.supId = supId;
		
	}

	public Inventory(String itemName, int quantity, int available, double purchPrice, double sellPrice, String itemType,
			String itemImg, int supId) {

		this.itemName = itemName;
		this.quantity = quantity;
		this.available = available;
		this.purchPrice = purchPrice;
		this.sellPrice = sellPrice;
		this.itemType = itemType;
		this.itemImg = itemImg;
		this.supId = supId;
		
	}
	
	public Inventory(int invId, String itemName, int quantity, int available, double purchPrice, double sellPrice,
			String itemType) {
		
		this.invId = invId;
		this.itemName = itemName;
		this.quantity = quantity;
		this.available = available;
		this.purchPrice = purchPrice;
		this.sellPrice = sellPrice;
		this.itemType = itemType;
		
	}
	
	public Inventory(int invId, String itemName, double sellPrice, String itemType, String itemImg) {
		
		this.invId = invId;
		this.itemName = itemName;
		this.sellPrice = sellPrice;
		this.itemType = itemType;
		this.itemImg = itemImg;
		
	}
	
	
	
	// Setters --------------------------------------------------------------

	public int getInvId() {
		return invId;
	}

	public String getItemName() {
		return itemName;
	}

	public int getQuantity() {
		return quantity;
	}

	public int getAvailable() {
		return available;
	}

	public double getPurchPrice() {
		return purchPrice;
	}

	public double getSellPrice() {
		return sellPrice;
	}

	public String getItemType() {
		return itemType;
	}

	public String getItemImg() {
		return itemImg;
	}

	public String getStockInDate() {
		return stockInDate;
	}

	public int getSupId() {
		return supId;
	}
	
	
}
