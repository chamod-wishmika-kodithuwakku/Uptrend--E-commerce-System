package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

@WebServlet("/Uploader")
public class Uploader extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Uploader() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		  PrintWriter out = response.getWriter();
		  
		  if(!ServletFileUpload.isMultipartContent(request)){
		   out.println("Nothing to upload");
		   return; 
		  }
		  FileItemFactory itemfactory = new DiskFileItemFactory(); 
		  ServletFileUpload upload = new ServletFileUpload(itemfactory);
		  try{
		   List<FileItem>  items = upload.parseRequest((new ServletRequestContext(request)));
		   for(FileItem item:items){
		    
		    String contentType = item.getContentType();
		    
		    
		    if(!contentType.equals("image/png")){
		     out.println("only png format image files supported");
		     continue;
		    }
		    File uploadDir = new File("D:\\Java Web Projects\\Uptrend\\src\\main\\webapp\\resources\\stock_images");
		    File file = File.createTempFile("Img",".png",uploadDir);
		    item.write(file);

		   }
		  }
		  catch(FileUploadException e){
		   
		  }
		  catch(Exception ex){
		   
		  }
		  
		  response.sendRedirect("functions/inventory-management/newly-added-stock");
	 }
		
		
}


