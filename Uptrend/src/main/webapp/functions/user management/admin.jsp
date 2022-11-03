<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap-grid.css">

	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_panel_custom.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_media_query.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_panel_body.css">
<link href="resource/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<!-- Header -->
	<div class="p-2 container-fluid theme-bg-color">
		<div class="container">
			<div class="row">
			<div class="col-12 col-sm-2">
				<img src="../../resources/header_images/uptrend_logo.png" class="img-fluid">
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

<br>
<br>
<br>
<br>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form action="adminlogin" method="post">
					<div
						style="border: 1px solid black; padding: 50px; margin-left: 20%; margin-right: 20%">

						<h5 style="text-align: center; text-decoration: underline;">
							Admin Login</h5>
						<br />

						<div class="form-group">
							<label for="logUname">Enter your user name</label> <input
								type="text" class="form-control" id="logUname"
								placeholder="Enter your username" name="logUname"
								required="required">
						</div>
						<div class="form-group">
							<label for="logPword">Enter your password</label> <input
								type="password" class="form-control" id="logPword"
								name="logPword" placeholder="Password" required="required">
						</div>


						<div align="right">
							<input type="submit" class="btn btn-success" style="width: 25%"
								value="Login" name="btn" />
						</div>

					</div>
				</form>

			</div>
		</div>
	</div>


	<br>
<br>
<br>
<br><br>
<br>
<br>
<br>

	<!-- Footer -->
	<div class="p-4 container-fluid theme-bg-color d-flex justify-content-center align-items-center">
		<div class="footer-title text-center">
			Copyright © 2022 Uptrend - All Rights Reserved
		</div>
	</div>
</body>
</html>