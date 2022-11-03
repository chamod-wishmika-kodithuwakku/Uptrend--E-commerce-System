<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Updates</title>
<link href="resource/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap-grid.css">

	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_panel_custom.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_media_query.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_panel_body.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap-grid.css">

	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_panel_custom.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_media_query.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/inventory_dashboard.css">
</head>
<body>
	<!-- Header -->
	<div class="p-2 container-fluid theme-bg-color">
		<div class="container">
			<div class="row">
			<div class="col-12 col-sm-2">
				<img src="../../resources/header_images/uptrend_logo.png" class="img-fluid">
			</div>

			<div class="col-12 col-sm-3 d-flex align-items-center justify-content-center home-btn-parent">
			
				<button type="button" class="nav-home-btn theme-bg-color" onclick="location.href='admin_panel.jsp'">Home</button>
				
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
						<div onclick="location.href='um_dashboard.jsp'">
							<i class="bi bi-speedometer"></i>
								User Management Dashboard
						</div>
						
						<div onclick="location.href='add_admin.jsp'">
							<i class="bi bi-pie-chart-fill"></i>
							Add_Admin
						</div>
						<div onclick="location.href='/Uptrend/functions/user%20management/reports'">
							<i class="bi bi-file-earmark-spreadsheet-fill"></i>
							Report 1
						</div>
						<div onclick="location.href='/Uptrend/functions/user%20management/reports2'">
							<i class="bi bi-file-earmark-spreadsheet-fill"></i>
							Report 2
						</div>
						<div onclick="location.href='/Uptrend/functions/user%20management/viewDeletedUser'">
							<i class="bi bi-trash-fill"></i>
							Deleted_users
						</div>	
						
					</div>
				</div>
				
			</div>

			<div class="col-12 col-sm-12 col-md-10">
				<div class="dashboard-body-title">
					Search user by User Name / First name or Email
				</div>

				<div class="dashboard-body-content">
				<div class="container">
		<div class="container" align="right">
		<div class="row">
			<div class="col-md-12">

				<div class="form-group">
					<form action="usersearch" method="post">
						<table>
							<tr>
								<td><input type="text" class="form-control" name="search"
									required="required" placeholder="Search"></td>
								<td><button type="submit" class="btn btn-success">
										<i class="fa fa-search"></i>
									</button></td>
							</tr>
						</table>
					</form>
				</div>

			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Name</th>
						<th scope="col">User Name</th>
						<th scope="col">Email</th>
						<th scope="col">Address</th>
						<th scope="col">City</th>
						<th scope="col">Phone Number</th>
					</tr>
				</thead>
				<c:forEach var="userDetails" items="${userDetails}">
					<tbody>
						<tr>
							<th scope="row">${userDetails.user_id}</th>
							<td>${userDetails.user_fname}</td>
							<td>${userDetails.user_name}</td>
							<td>${userDetails.user_email}</td>
							<td>${userDetails.user_address}</td>
							<td>${userDetails.user_city}</td>
							<td>${userDetails.user_phone_number}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
	</div>
				
				</div>
			</div>	
		</div>
	</div>

	

	


	<!-- Footer -->
	<div class="p-4 container-fluid theme-bg-color d-flex justify-content-center align-items-center">
		<div class="footer-title text-center">
			Copyright © 2022 Uptrend - All Rights Reserved
		</div>
	</div>
</body>
</html>