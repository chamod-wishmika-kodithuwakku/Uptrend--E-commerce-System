<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Inventory Dashboard</title>
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
				<button type="button" class="nav-home-btn theme-bg-color"  onclick="location.href='admin_panel.jsp'">Home</button>
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
					
						<div onclick="location.href='/Uptrend/functions/user%20management/reports'">
							<i class="bi bi-file-earmark-spreadsheet-fill"></i>
							Report 1
						</div>
						<div onclick="location.href='#Report'">
							<i class="bi bi-file-earmark-spreadsheet-fill"></i>
							Report 2
						</div>
						<div onclick="location.href='/Uptrend/functions/user%20management/viewDeletedUser'">
							<i class="bi bi-trash-fill"></i>
							Deleted_users
						</div>	
						
						<div onclick="location.href='#Bin'">
							<i class="bi bi-pie-chart-fill"></i>
							View_users
						</div>	
					</div>
				</div>
				
			</div>

			<div class="col-12 col-sm-12 col-md-10">
				<div class="dashboard-body-title">
					Add Admin
				</div>

				<div class="dashboard-body-content">
					<div class="container">
			<div class="row">
			
			
			<!-- Left side -->
			<div class="col-md-4">
				<div>
					
					<div
						style="width: 100%; margin-top: 50px; padding: 20px 50px 50px 50px">
						<div align="center">
								<img src="../../resources/image/undraw_add_friends_re_3xte.png" width="300" height="300" class="img-fluid">
						</div>
						<form action="add_admin" method="post">
							<div class="form-group">
								<label for="name">Enter your user Name</label> <input type="text"
									class="form-control" id="name" placeholder="Jon Doe"
									name="name" required="required">
							</div>
							<div class="form-group">
								<label for="password">Enter your Password</label> <input type="password"
									class="form-control" id="txtNewPassword" placeholder="1234"
									name="password" required="required">
							</div>
								<div class="form-group">
								<label for="contact">Enter your Eamil</label> <input type="email"
									class="form-control" id="email" placeholder="example@gmail.com"
									name="email" required="required">
							</div>

							<br />
							
							<div align="center">
								<button type="submit" class="button "
									style="width: 100%" name="btn" value="btn1">Add Admin</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Left side -->
					
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