<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.db.Home"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.home"%>
<%@page import="com.db.Records1"%>




<!DOCTYPE html>

<html>
<head>

<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">

<meta name='viewport' content='width=device-width, initial-scale=1'>





	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-grid.css">
    <link href="bootstrap/css/Footer.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>


	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="resources/css/admin_panel_custom.css">
	<link rel="stylesheet" type="text/css" href="resources/css/admin_media_query.css">
	<link rel="stylesheet" type="text/css" href="resources/css/admin_panel_body.css">
	<link rel="stylesheet" type="text/css" href="resources/css/stock-view.css">
	
	<style>
	.button1 {width: 250px;
	
	height: 50px;
	}
	
	
	</style>
	<style>
.fa {
  padding: 20px;
  font-size: 30px;
  width: 50px;
  text-align: center;
  text-decoration: none;
  margin: 5px 2px;
}

.fa:hover {
    opacity: 0.7;
}

or: white;
}



.fa-instagram {
  background: #125688;
  color: white;
}


</style>

    <style>
        .avatar {
          vertical-align: middle;
          width: 50px;
          height: 50px;
          border-radius: 50%;
        }
        </style>
        <style>
            * {box-sizing: border-box}
            body {font-family: Verdana, sans-serif; margin:0}
            .mySlides {display: none}
            img {vertical-align: middle;}
            
            /* Slideshow container */
            .slideshow-container {
              max-width: 1000px;
              position: relative;
              margin: auto;
            }
            
            /* Next & previous buttons */
            .prev, .next {
              cursor: pointer;
              position: absolute;
              top: 50%;
              width: auto;
              padding: 16px;
              margin-top: -22px;
              color: white;
              font-weight: bold;
              font-size: 18px;
              transition: 0.6s ease;
              border-radius: 0 3px 3px 0;
              user-select: none;
            }
            
            /* Position the "next button" to the right */
            .next {
              right: 0;
              border-radius: 3px 0 0 3px;
            }
            
            /* On hover, add a black background color with a little bit see-through */
            .prev:hover, .next:hover {
              background-color: rgba(0,0,0,0.8);
            }
            
            /* Caption text */
            .text {
              color: #f2f2f2;
              font-size: 15px;
              padding: 8px 12px;
              position: absolute;
              bottom: 8px;
              width: 100%;
              text-align: center;
            }
            
            /* Number text (1/3 etc) */
            .numbertext {
              color: #f2f2f2;
              font-size: 12px;
              padding: 8px 12px;
              position: absolute;
              top: 0;
            }
            
            /* The dots/bullets/indicators */
            .dot {
              cursor: pointer;
              height: 15px;
              width: 15px;
              margin: 0 2px;
              background-color: #bbb;
              border-radius: 50%;
              display: inline-block;
              transition: background-color 0.6s ease;
            }
            
            .active, .dot:hover {
              background-color: #717171;
            }
            
            /* Fading animation */
            .fade {
              animation-name: fade;
              animation-duration: 1.5s;
            }
            
            @keyframes fade {
              from {opacity: .4} 
              to {opacity: 1}
            }
            
            /* On smaller screens, decrease text size */
            @media only screen and (max-width: 300px) {
              .prev, .next,.text {font-size: 11px}
            }
            </style>


<style>
  .btn {
    border: none;
    background-color: inherit;
    padding: 14px 28px;
    font-size: 16px;
    cursor: pointer;
    display: inline-block;
  }
  
  /* Green */
  .success {
    color: green;
  }
  
  .success:hover {
    background-color: #04AA6D;
    color: white;
  }
  
  /* Blue */
  .info {
    color: dodgerblue;
  }
  
  .info:hover {
    background: #2196F3;
    color: white;
  }
  
  /* Orange */
  .warning {
    color: orange;
  }
  
  .warning:hover {
    background: #ff9800;
    color: white;
  }
  
  /* Red */
  .danger {
    color: red;
  }
  
  .danger:hover {
    background: #f44336;
    color: white;
  }
  
  /* Gray */
  .default {
    color: black;
  }
  
  .default:hover {
    background: #e7e7e7;
  }
  </style>
	
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- Menu Bar -->
	<!-- Header -->
	<div class="p-2 container-fluid theme-bg-color">
		<div class="container" style="margin-left:6%;">
			<div class="row">
			<div class="col-12 col-sm-2">
				<img src="resources/header_images/uptrend_logo.png" class="img-fluid">
			</div>

			<div class="col-12 col-sm-2 d-flex align-items-center justify-content-center home-btn-parent">
				<button type="button" class="nav-home-btn theme-bg-color"  >Home</button>
			</div>
			<div class="col-12 col-sm-2 d-flex align-items-center justify-content-center home-btn-parent">
				<button type="button" class="nav-home-btn theme-bg-color">Shop</button>
			</div>
           
			<div class="col-12 col-sm-3 d-flex align-items-center justify-content-center home-btn-parent">
				<button type="button" class="nav-home-btn theme-bg-color">  About Us</button>
			</div>
            
<div class="col-12 col-sm-3 d-flex align-items-center justify-content-center home-btn-parent">
 &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; 
               
				<button type="button" class="nav-home-btn theme-bg-color  btn btn-primary btn-sm" onclick="location.href='../user%20management/login.jsp'" >Login</button>
			</div>

			
				
			</div>

		</div>
		</div>
	</div>
	             
    
             <!-- image slider -->
    <div class="slideshow-container">

        <div class="mySlides fade">
          <div class="numbertext">1 / 3</div>
          <img src="img_nature_wide.jpg" style="width:100%">
          <div class="text">Caption Text</div>
        </div>
        
        <div class="mySlides fade">
          <div class="numbertext">2 / 3</div>
          <img src="img_snow_wide.jpg" style="width:100%">
          <div class="text">Caption Two</div>
        </div>
        
        <div class="mySlides fade">
          <div class="numbertext">3 / 3</div>
          <img src="img_mountains_wide.jpg" style="width:100%">
          <div class="text">Caption Three</div>
        </div>
        
        <a class="prev" onclick="plusSlides(-1)">❮</a>
        <a class="next" onclick="plusSlides(1)">❯</a>
        
        </div>
        <br>
        
        <div style="text-align:center">
          <span class="dot" onclick="currentSlide(1)"></span> 
          <span class="dot" onclick="currentSlide(2)"></span> 
          <span class="dot" onclick="currentSlide(3)"></span> 
        </div>

        <!-- body -->
        <h2 style="text-align: center;"> Pick your category </h2>
        
      
        
   
        <div class="d-flex justify-content-around">
          <div><a href="home3.jsp?id=a">Men</a></div>
          <div><a href="home3.jsp?id=b">Women</a></div>
          <div><a href="home3.jsp?id=c">Kids</a></div>
          <div><a href="home3.jsp?id=d">Unisex</a></div>
        </div>
        
        
         <div class="content-body">
         
        
         <div class="content-body">
         
         <div class="row"> 
         
         <%
         String id = request.getParameter("id")  ;
 		String name="";
 		
 		if(id.equals("a")) {
 			name = "men";
 		}

 		else if(id.equals("b")) {
 			name = "women";
 		}
 		

 		else if(id.equals("c")) {
 			name = "kids";
 		}
 		
 		else if(id.equals("d")) {
 			name = "unisex";
 		}
         
 		
 		
         ArrayList<home> allrecords = Records1.getAllRecords();
         for(home h1:allrecords)
         {
        	 
        	 if(name.equals(h1.getStock_type()))
         
        	 {
                
         	    
         		
              %>

             
                            
             <div class="col-sm-3">
	         <div class="frame">
	         	<div class="card">
				  <img src="../../resources/stock_images/<c:out value="<%=h1.getImage() %>" />" alt="Denim Jeans" style="width:100%">
				  <h1><c:out value="<%=h1.getIname() %>" /></h1>
				  <p class="price"><c:out value="<%=h1.getSprice()%>" /></p>
				  <p>Qty: <c:out value="<%=h1.getIname() %>"/></p>
				  
					<button type="button" class="nav-home-btn theme-bg-color  button1" onclick="location.href='../user%20management/login.jsp'" ><p style="font-size:20px" >Add to cart</p></button>
				
				  <p></p>
				</div>
	         </div>
	         </div>
         	
         
         	
         
	         
         
         
         
        
          
              
              <%
              
              
        	 }
         }
              %>
         
         
         </div>
         
         
         
         	
     




    <footer class="footer" style="margin-top: 50px">
        <div class="container">
            <div class="row">
                <div class="footer-col">
                    <h4>company</h4>
                    <ul>
                        <li><a href="#">about us</a></li>
                        <li><a href="#">our services</a></li>
                    
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>get help</h4>
                    <ul>
                      
                        <li><a href="#">order status</a></li>
                        <li><a href="#">payment options</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Customer Care</h4>
                    <ul>
                        <li><a href="#">inquries</a></li>

                    </ul>
                </div>
                <div class="footer-col">
                    <h4>follow us</h4>
                    <div class="social-links">
                       <a href="#" class="fa fa-facebook"></a>
                        <a href="#" class="fa fa-instagram"></a>
                   
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <script>
        let slideIndex = 1;
        showSlides(slideIndex);
        
        function plusSlides(n) {
          showSlides(slideIndex += n);
        }
        
        function currentSlide(n) {
          showSlides(slideIndex = n);
        }
        
        function showSlides(n) {
          let i;
          let slides = document.getElementsByClassName("mySlides");
          let dots = document.getElementsByClassName("dot");
          if (n > slides.length) {slideIndex = 1}    
          if (n < 1) {slideIndex = slides.length}
          for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
          }
          for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
          }
          slides[slideIndex-1].style.display = "block";  
          dots[slideIndex-1].className += " active";
        }
        </script>
	<!-- Menu Bar --></body>
</html></html>