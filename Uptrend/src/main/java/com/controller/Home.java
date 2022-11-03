package com.controller;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.HomeDB;
import com.model.home;



@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public Home() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int id = Integer.parseInt(request.getParameter("id"))  ;
		String name=null;
		
		if(id == 1) {
			name = "men";
			System.out.println("1");
		}
		else if(id==2) {
			
			name = "women";
			System.out.println("2");

		}
		else if(id== 3) {
			 name = "kids";
				System.out.println("3");

		}
		else if(id == 4) {
			 name = "unisex";
				System.out.println("4");

		}
		
		 home stockDetails = HomeDB.userDetails(name);
		 request.setAttribute("stockDetails", stockDetails);
		 
		 RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
		 dispatcher.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
