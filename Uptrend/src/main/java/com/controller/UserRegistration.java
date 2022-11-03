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
@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");
		String city = request.getParameter("city");
		String email = request.getParameter("email");
		String uname = request.getParameter("uname");
		String password = request.getParameter("password");
		String squestion = request.getParameter("squestion");
		String sanswer = request.getParameter("sanswer");
		
		boolean isTrue = false;

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date dates = new Date();
		String date1 = formatter.format(dates);

		String encriptPass = encriptPasswordHelper.changePassToEncript(password);
		isTrue = com.db.RegistrationDBUtil.userReg(name, squestion, email, encriptPass, address, city, contact, sanswer, uname, date1);
		
		if(isTrue == true) {
			request.setAttribute("msgReg", "true");
			//String msg1="msgReg";
		//response.sendRedirect("functions/user management/login.jsp?msg1="+msg1);

		} else if (isTrue == false) {
			request.setAttribute("msgReg", "false");
		}
		
		RequestDispatcher req = request.getRequestDispatcher("login.jsp");
				req.forward(request, response);
	}

}
