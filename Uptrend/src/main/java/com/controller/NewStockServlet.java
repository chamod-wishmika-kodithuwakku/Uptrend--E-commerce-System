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

import com.db.NewStockDBUtil;
import com.model.Inventory;
import com.model.NewStock;

@WebServlet("/NewStockServlet")
public class NewStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private NewStockDBUtil newStockDBUtil;
 
    public NewStockServlet() {
    	newStockDBUtil = new NewStockDBUtil();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getServletPath();
		
		switch (action) {
			
		case "/functions/inventory-management/newly-added-stock":
			try {
				newlyAddedItems(request, response);
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
			
		case "/functions/inventory-management/item-request":
			try {
				autoFillInsertForm(request, response);
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		
		String action = request.getServletPath();
		
		switch (action) {
			
		case "/functions/inventory-management/insert":
			try {
				submitInsertForm(request, response);
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
	
	private void newlyAddedItems(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		List<NewStock> newStock = newStockDBUtil.selectAllStocks();
		request.setAttribute("newStock", newStock);
		RequestDispatcher dispatcher = request.getRequestDispatcher("new_stock.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private void autoFillInsertForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		List<NewStock> newStock = newStockDBUtil.selectAllStocks();
		request.setAttribute("newStock", newStock);
		
		int id = Integer.parseInt(request.getParameter("id"));
		NewStock existingRecord = newStockDBUtil.getNewStockRecordById(id);
		request.setAttribute("itemRecord", existingRecord);
		RequestDispatcher dispatcher = request.getRequestDispatcher("new_stock.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private void submitInsertForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
		List<NewStock> newStock = newStockDBUtil.selectAllStocks();
		request.setAttribute("newStock", newStock);
		
		String itemName = request.getParameter("itemName");
		int quantity = Integer.parseInt(request.getParameter("itemQty"));
		int available = quantity;
		double purchPrice = Double.parseDouble(request.getParameter("itemPurchPrice"));
		double sellPrice = Double.parseDouble(request.getParameter("itemSellPrice"));
		String itemType = request.getParameter("itemType");
		String itemImg = request.getParameter("itemImg");
		int supId = Integer.parseInt(request.getParameter("supId"));
		
		Inventory inventory = new Inventory(itemName, quantity, available, purchPrice, sellPrice, itemType, itemImg, supId);
		boolean insertionStatus = newStockDBUtil.insertItemToInventory(inventory);
		
		request.setAttribute("insertionStatus", insertionStatus);
		response.sendRedirect("newly-added-stock");
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/functions/inventory-management/newly-added-stock");
//		dispatcher.forward(request, response);
	}

}
