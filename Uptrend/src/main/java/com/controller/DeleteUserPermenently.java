package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteUserPermenently
 */
@WebServlet("/DeleteUserPermenently")
public class DeleteUserPermenently extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int uID = Integer.parseInt(request.getParameter("userId"));

		com.db.DeleteUserPermenently.deleteUser(uID);
		RequestDispatcher rd = request.getRequestDispatcher("um_dashboard.jsp");
		rd.forward(request, response);
	}

}
