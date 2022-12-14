package com.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.UserReports;

/**
 * Servlet implementation class Reports
 */
@WebServlet("/reports2")
public class Reports2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
			List<com.model.UserReportsTwo> uReportTwo = com.db.UserReports.todayReg();
			request.setAttribute("uReportTwo", uReportTwo);
			
			String count = com.db.UserReports.userCount();
			request.setAttribute("count", count);

			RequestDispatcher rd = request.getRequestDispatcher("user-report-two.jsp");
			rd.forward(request, response);
		}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
