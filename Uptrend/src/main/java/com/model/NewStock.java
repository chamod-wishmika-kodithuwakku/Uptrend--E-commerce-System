package com.model;

public class NewStock {

	private int supId;
	private String itemName;
	private int quantity;
	private double purchPrice;
	
	public NewStock(int supId, String itemName, int quantity, double purchPrice) {
		this.supId = supId;
		this.itemName = itemName;
		this.quantity = quantity;
		this.purchPrice = purchPrice;
	}

	public int getSupId() {
		return supId;
	}

	public String getItemName() {
		return itemName;
	}

	public int getQuantity() {
		return quantity;
	}

	public double getPurchPrice() {
		return purchPrice;
	}
	
	
}
