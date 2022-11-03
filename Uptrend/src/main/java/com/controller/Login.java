package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.encriptPasswordHelper;
import com.model.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
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
		
		String uName = request.getParameter("logUname");
		String uPassword = request.getParameter("logPword");
		boolean isTrue;

		String encriptPass = com.db.encriptPasswordHelper.changePassToEncript(uPassword);
		isTrue = com.db.Login.userVerification(uName, encriptPass);
		if (isTrue == true) {
			request.setAttribute("msg", "true");
			HttpSession session = request.getSession(true);
			session.setAttribute("getUserSession", uName);

			
			request.setAttribute("uname", uName);

//			RequestDispatcher rd = request.getRequestDispatcher("../common/home2.jsp");
//			rd.forward(request, response);
			response.sendRedirect("../common/home2.jsp?user=" + uName);
			
//			RequestDispatcher rd = request.getRequestDispatcher("../common/home2.jsp");
//			rd.forward(request, response);
		} else {
			request.setAttribute("msg", "false");
			//response.sendRedirect("login.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
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
