<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">



<link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">

<style>
.button {
  background-color: #6878be;

;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
</head>
<body>
	<!-- Menu Bar -->
	<jsp:include page="home_header.jsp" />
	<!-- Menu Bar -->

	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<c:forEach var="uDetails" items="${userDetails}">
					<div
						style="border: 1px solid black; padding: 50px; margin-left: 20%; margin-right: 20%">


						<img alt="User Image" src="../../resources/image/user_profile.png" width="200px"
							height="200px"
							style="display: block; margin-left: auto; margin-right: auto;">

						<h5 style="text-align: center; text-decoration: underline;">
							Hi! <span>${uDetails.user_name}</span>
						</h5>
						<br />

						<h3 style="color: aqua;">Bio Graph</h3>

						<table style="font-size: larger;">
							<tr>
								<td>Name</td>
								<td>:</td>
								<td>${uDetails.user_fname}</td>
							</tr>
							<tr>
								<td>Email</td>
								<td>:</td>
								<td>${uDetails.user_email}</td>
							</tr>
							<tr>
								<td>Address</td>
								<td>:</td>
								<td>${uDetails.user_address}</td>
							</tr>
							<tr>
								<td>City</td>
								<td>:</td>
								<td>${uDetails.user_city}</td>
							</tr>
							<tr>
								<td>Phone number</td>
								<td>:</td>
								<td>${uDetails.user_phone_number}</td>
							</tr>
						</table>

						<div align="right">
							<form action="../../functions/user%20management/menubehavior" method="post">
								<input type="submit" class="btn btn-warning" style="width: 25%"
									value="Update Details" name="btn"/>
							</form>
						</div>

					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<!-- Footer -->
</body>
</html>