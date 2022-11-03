package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserSettings
 */
@WebServlet("/UserSettings")
public class UserSettings extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserSettings() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String buttionName = request.getParameter("btn");
		String uName = request.getParameter("name");
		String uAddress = request.getParameter("address");
		String uContact = request.getParameter("contact");
		String uCity = request.getParameter("city");
		String uEmail = request.getParameter("email");
		String userName = request.getParameter("uname");
		String userPassword = request.getParameter("password");
		String uRadioBtn = request.getParameter("radioBtn");
		String secretPass = request.getParameter("sPass");

		if (buttionName.equals("Update")) {
			com.db.UserSettings.userUpdate(uName, uRadioBtn, uEmail, userPassword, uAddress, uCity, uContact,
					secretPass, userName);
			RequestDispatcher req = request.getRequestDispatcher("menubehavior");
			req.forward(request, response);
		} else if (buttionName.equals("Delete")) {
			com.db.UserSettings.addToDeletetTable(uName, userName, uEmail, uAddress, uCity, uContact);
			com.db.UserSettings.deleteUser(userName);
			RequestDispatcher req = request.getRequestDispatcher("login.jsp");
			req.forward(request, response);
		}

	}

}
