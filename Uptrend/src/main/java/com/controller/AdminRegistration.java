package com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.RegistrationDBUtil;
import com.db.encriptPasswordHelper;

/**
 * Servlet implementation class UserRegistration
 */
@WebServlet("/AdminRegistration")
public class AdminRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
	
		
	    String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		boolean isTrue = false;

		
	
		isTrue = com.db.AdminRegistration.adminReg(name, password, email);
		
		if(isTrue == true) {
			request.setAttribute("msgReg", "true");
			//String msg1="msgReg";
		//response.sendRedirect("functions/user management/login.jsp?msg1="+msg1);

		} else if (isTrue == false) {
			request.setAttribute("msgReg", "false");
		}
		
		RequestDispatcher req = request.getRequestDispatcher("add_admin.jsp");
				req.forward(request, response);
	}

}

