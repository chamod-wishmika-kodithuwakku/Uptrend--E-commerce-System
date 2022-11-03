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

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private InventoryDBUtil inventoryDBUtil;
       
    public ReportServlet() {
    	inventoryDBUtil = new InventoryDBUtil();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getServletPath();
		
		System.out.println(action);
		
		switch (action) {
		
		case "/functions/inventory-management/report":
			try {
				displayReportTable(request, response);
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
		doGet(request, response);
		
		
		
	}
	
	
	// ------------------------------------------------------------------------------------------------
	
	public void displayReportTable(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
		List<Inventory> inventory = inventoryDBUtil.getAllInventoryRecords();
		request.setAttribute("inventory", inventory);
		
		List<Inventory> lowStock = inventoryDBUtil.getLowStockRecords();
		request.setAttribute("lowStock", lowStock);
		
		List<Inventory> outOfStock = inventoryDBUtil.getOutOfStockRecords();
		request.setAttribute("outOfStock", outOfStock);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("report.jsp");
		dispatcher.forward(request, response);
		
	}
	
	

}
