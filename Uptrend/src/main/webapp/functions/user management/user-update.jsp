<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">


<title>Updates</title>
<link href="resource/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<!-- Menu Bar -->
	<jsp:include page="home_header.jsp" />
	<!-- Menu Bar -->
	
	<br>
	<br>
	<br>

	<form action="usersettings" method="post">
		<div class="container">
			<div class="row">
				<c:forEach var="uDetails" items="${userDetails}">
					<!-- left side -->
					<div class="col-md-6">
						<div class="form-group">
							<label for="name">Full Name</label> <input type="text"
								class="form-control" id="name" name="name" required="required"
								value="${uDetails.user_fname}">
						</div>

						<div class="form-group">
							<label for="address">Address</label> <input type="text"
								class="form-control" id="address"
								value="${uDetails.user_address}" name="address"
								required="required">
						</div>

						<div class="form-group">
							<label for="contact">Phone Number</label> <input type="tel"
								class="form-control" id="contact"
								value="${uDetails.user_phone_number}" name="contact"
								required="required" pattern="^\d{10}$">
						</div>

						<div class="form-group">
							<label for="contact">City</label> <input type="text"
								class="form-control" id="city" value="${uDetails.user_city}"
								name="city" required="required">
						</div>

						<div class="form-group">
							<label for="contact">Email</label> <input type="email"
								class="form-control" id="email" name="email" required="required"
								value="${uDetails.user_email}">
						</div>
					</div>
					<!-- left side -->


					<!-- right side -->
					<div class="col-md-6" style="border-left: 1px solid black">

						<div class="form-group">
							<label for="uname">User Name</label> <input type="text"
								class="form-control" id="uname" name="uname" required="required"
								value="${uDetails.user_name}" readonly="readonly">
						</div>

						<div class="form-group">
							<input type="password" class="form-control" id="password"
								name="password" required="required"
								value="${uDetails.user_password}" hidden="true">
						</div>

						<hr />

						<div class="form-group">
							<p>Select your secret question type</p>
						</div>

						<div class="form-group">
							<input type="radio" id="html" name="radioBtn" value="Pet name"
								<c:if test="${uDetails.secret_type == 'Pet name'}">checked</c:if>>
							<label for="html">Pet name</label> <input type="radio" id="html"
								name="radioBtn" value="Mother name"
								<c:if test="${uDetails.secret_type == 'Mother name'}">checked</c:if>>
							<label for="html">Mother's name</label> <input type="radio"
								id="html" name="radioBtn" value="Birth place"
								<c:if test="${uDetails.secret_type == 'Birth place'}">checked</c:if>>
							<label for="html">Birth place</label>
						</div>

						<div class="form-group">
							<label for="uname">Enter the answer to the secret
								question</label> <input type="text" class="form-control" id="uname"
								name="sPass" required="required"
								value="${uDetails.secret_password}">
						</div>

						<div align="right">
							<button type="submit" class="btn btn-warning" style="width: 25%"
								id="btn2" name="btn" value="Update">Update Details</button>
							<button type="submit" class="btn btn-danger" style="width: 25%"
								id="btn2" name="btn" value="Delete">Delete Profile</button>
						</div>
					</div>
					<!-- right side -->

				</c:forEach>

			</div>
		</div>
	</form>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<!-- Footer -->
</body>
</html>