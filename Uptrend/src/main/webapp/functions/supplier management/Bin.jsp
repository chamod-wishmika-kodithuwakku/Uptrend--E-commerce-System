<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.db.crud"%>
<%@page import="com.model.Supplier"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	





	<meta charset="ISO-8859-1">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Bin</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">

	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="../../resources/supplier styles/NewFile.css">
	<link rel="stylesheet" type="text/css" href="../../resources/supplier styles/admin_media_query.css">
	<link rel="stylesheet" type="text/css" href="../../resources/supplier styles/supplier_dashboard.css">
	<link rel="stylesheet" href="../../resources/supplier styles/styles.css">
	
</head>

<body>
	<!-- Header -->
	<div class="p-2 container-fluid theme-bg-color" style="margin-left:-8%;">
		<div class="container"">
			<div class="row" >
			<div class="col-12 col-sm-2" >
				<img src="../../resources/header_images/uptrend_logo.png" class="img-fluid">
			</div>

			<div class="col-12 col-sm-3 d-flex align-items-center justify-content-center home-btn-parent">
				<button type="button" class="nav-home-btn theme-bg-color">Home</button>
			</div>

			<div class="col-12 col-sm-7 d-flex align-items-center media-flex hide">
				<div class="row">
					<div class="col d-flex flex-row-reverse align-items-center">
						<div class="p-2 online-icon"></div>
					</div>
					<div class="col admin-title">Admin</div>
				</div>
				
			</div>

		</div>
		</div>
	</div>

	<!-- Body -->
	<div class="container-fluid">
		<div class="row inventory-dash">
			<div class="col-12 col-sm-12 col-md-2 admin-option-column">
				<div class="sticky-top">
					<div class="admin-logo d-flex align-items-center justify-content-center">
						<img src="../../resources/body_images/admin_logo.png" class="img-fluid">
					</div>

					<div class="admin-option">
						<div onclick="location.href='Dashboard.jsp'">
							<i class="bi bi-speedometer"></i>
							Dashboard
						</div>
						<div onclick="location.href='Analytics.jsp'">
							<i class="bi bi-pie-chart-fill"></i>
							Analytics
						</div>
						<div onclick="location.href='Report.jsp'">
							<i class="bi bi-file-earmark-spreadsheet-fill"></i>
							Report
						</div>
						<div onclick="location.href='Bin.jsp'">
							<i class="bi bi-trash-fill"></i>
							Bin
						</div>	
					</div>
				</div>
				
			</div>

			<div class="col-12 col-sm-12 col-md-10">
				<div class="dashboard-body-title">
					Bin
	
				</div>

				<div class="dashboard-body-content">
					
					<div class="table">
						<table>
							<thead>
								<tr>	
									<th>Supplier ID</th>
									<th>Supplier Name</th>
									<th>Email</th>
									<th>Address</th>
									<th>Contact No.</th>
									<th>Supplier Item</th>
									<th>Quantity</th>
									<th>Price(for one)Rs.</th>
									<th>Sub Amount(Total)</th>
									<th>Date</th>
									<th>Deleted Time</th>
									
								</tr>
							</thead>
							<tr>
		
								<%
								int i=0;
								 ArrayList<Supplier> allsuppliers = crud.getAllDeletedRecords();
								
								for(Supplier s1 : allsuppliers)
								{
								
								%>
							<tbody>
								<tr>
							
									<td><%=s1.getSupplierID()%></td>
									<td><%=s1.getSupplierName() %></td>
									<td><%=s1.getEmail()%></td>
									<td><%=s1.getAddress() %></td>
									<td>0<%=s1.getContact() %></td>
									<td><%=s1.getitem() %></td>
									<td><%=s1.getQuantitiy() %></td>
									<td><%=s1.getPrice() %>0</td>
									<td><%=s1.getSubamount() %>0</td>
									<td><%=s1.getDate() %></td>
									<td><%=s1.getTime() %></td>
		
								
								</tr>
								
							</tbody>
							
  
		<%
		}
		%>
		
					</table>


						
					</div>
				</div>
			</div>	
		</div>
	</div>

	



	<!-- Footer -->
	<div class="p-4 container-fluid theme-bg-color d-flex justify-content-center align-items-center">
		<div class="footer-title text-center">
			Copyright@2022 Uptrend - All Rights Reserved
		</div>
	</div>
</body>
</html>