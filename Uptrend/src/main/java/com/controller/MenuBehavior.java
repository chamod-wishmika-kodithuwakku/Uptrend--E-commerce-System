package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.User;

/**
 * Servlet implementation class MenuBehavior
 */
@WebServlet("/MenuBehavior")
public class MenuBehavior extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MenuBehavior() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String btn = request.getParameter("btn");
		String uName = request.getSession().getAttribute("getUserSession").toString();

		if (btn.equals("Profile")) {
			List<User> userDetails = com.db.Login.userDetails(uName);
			request.setAttribute("userDetails", userDetails);
			RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
			rd.forward(request, response);
		} else if (btn.equals("Update Details")) {
			List<User> userDetails = com.db.Login.userDetails(uName);
			request.setAttribute("userDetails", userDetails);
			RequestDispatcher rd = request.getRequestDispatcher("user-update.jsp");
			rd.forward(request, response);
		}else {
			List<User> userDetails = com.db.Login.userDetails(uName);
			request.setAttribute("userDetails", userDetails);
			RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
			rd.forward(request, response);
		}
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
