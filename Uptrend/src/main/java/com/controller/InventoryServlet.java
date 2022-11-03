package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.InventoryDBUtil;
import com.model.Inventory;

@WebServlet("/InventoryServlet")
public class InventoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private InventoryDBUtil inventoryDBUtil;
	
    public InventoryServlet() {
    	inventoryDBUtil = new InventoryDBUtil();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getServletPath();
		
		switch(action) {
		
		case "/functions/inventory-management/inventory-dashboard":
			try {
				displayInventoryTable(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case "/functions/inventory-management/update-request":
			try {
				autoFillUpdateForm(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		
		case "/functions/inventory-management/delete-request":
			try {
				returnItemId(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		
		case "/functions/inventory-management/delete":
			try {
				tempDeleteInventoryRecord(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case "/functions/inventory-management/bin":
			try {
				displayBinRecords(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case "/functions/inventory-management/permanent-delete-request":
			try {
				returnBinId(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break; 
			
		case "/functions/inventory-management/confirm-delete":
			try {
				permenantlyDeleteBinRecord(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		}
	
		
	}
		
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		
		String action = request.getServletPath();
		
		switch (action) {
		
		case "/functions/inventory-management/update":
			try {
				updateInventoryRecord(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		
		}
		
	}
	
	
	// -----------------------------------------------------------------------------------------------
	
	public void displayInventoryTable(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
		List<Inventory> inventory = inventoryDBUtil.getAllInventoryRecords();
		request.setAttribute("inventory", inventory);
		RequestDispatcher dispatcher = request.getRequestDispatcher("inventory_dashboard.jsp");
		dispatcher.forward(request, response);
		
	}
	
	
	private void autoFillUpdateForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		List<Inventory> inventory = inventoryDBUtil.getAllInventoryRecords();
		request.setAttribute("inventory", inventory);
		
		int itemId = Integer.parseInt(request.getParameter("id"));
		Inventory inventoryRecord = inventoryDBUtil.getInventoryRecordById(itemId);
		request.setAttribute("inventoryRecord", inventoryRecord);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("inventory_dashboard.jsp");
		dispatcher.forward(request, response);
		
	}
	
	
	private void updateInventoryRecord(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		boolean imgStatus = false;
		
		int invId = Integer.parseInt(request.getParameter("invId"));
		String itemName = request.getParameter("itemName");
		double sellPrice = Double.parseDouble(request.getParameter("sellPrice"));
		String itemType = request.getParameter("itemType");
		String itemImg = request.getParameter("itemImg");
		
		if (itemImg == "") {
			imgStatus = false;
		} else {
			imgStatus = true;
		}
		
		Inventory inventoryUpdate = new Inventory(invId, itemName, sellPrice, itemType, itemImg);
		inventoryDBUtil.updateInventoryRecord(inventoryUpdate, imgStatus);
		
		response.sendRedirect("inventory-dashboard");
		
	}
	
	
	private void returnItemId(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		List<Inventory> inventory = inventoryDBUtil.getAllInventoryRecords();
		request.setAttribute("inventory", inventory);
		
		int itemId = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("itemId", itemId);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("inventory_dashboard.jsp");
		dispatcher.forward(request, response);
		
	}
	
	
	private void tempDeleteInventoryRecord(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		List<Inventory> inventory = inventoryDBUtil.getAllInventoryRecords();
		request.setAttribute("inventory", inventory);
		
		int itemId = Integer.parseInt(request.getParameter("id"));
		System.out.println("item id: " + itemId);
		boolean deletionStatus = inventoryDBUtil.temporarilyDeleteInventoryRecord(itemId);
		request.setAttribute("deletionStatus", deletionStatus);
		
		response.sendRedirect("inventory-dashboard");
//		RequestDispatcher dispatcher = request.getRequestDispatcher("inventory_dashboard.jsp");
//		dispatcher.forward(request, response);
		
	}
	
	public void displayBinRecords(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
		List<Inventory> bin = inventoryDBUtil.getAllBinRecords();
		request.setAttribute("bin", bin);
		RequestDispatcher dispatcher = request.getRequestDispatcher("bin.jsp");
		dispatcher.forward(request, response);
		
	}
	
	
	private void returnBinId(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		List<Inventory> bin = inventoryDBUtil.getAllBinRecords();
		request.setAttribute("bin", bin);
		
		int itemId = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("itemId", itemId);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("bin.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private void permenantlyDeleteBinRecord(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		List<Inventory> bin = inventoryDBUtil.getAllBinRecords();
		request.setAttribute("bin", bin);
		
		int itemId = Integer.parseInt(request.getParameter("id"));
		boolean deletionStatus = inventoryDBUtil.permenantlyDeleteBinRecord(itemId);
		request.setAttribute("deletionStatus", deletionStatus);
		
		response.sendRedirect("bin");
		
	}
	

}
