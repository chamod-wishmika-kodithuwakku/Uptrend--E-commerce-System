<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>

<style>
.error {
	color: #F00;
	background-color: #FFF;
}
</style>

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

	<!-- Main Content -->
	<div class="container">
		<div class="row">

			<!-- Left side -->
			<div class="col-md-4">
				<div>
					
					<div
						style="width: 100%; margin-top: 50px; padding: 20px 50px 50px 50px">
						<div align="center">
						<h2>User Login Portal</h2>
							<img src="../../resources/image/user_login.jpg" width="300px" height="300px">
						</div>
						<form action="login" method="post">
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
								<a href="#" style="float: right; font-size: small;"
									id="forgotPass">Forgot your password?</a>
							</div>
							<br />
							<div>
								<%
									if (request.getAttribute("msg") == "false") {
								%>
								<div class="alert alert-danger" role="alert">Username or
									Password is incorrect!</div>
								<%
									}
								%>
							</div>
							<div align="center">
								<button type="submit" class="button "
									style="width: 100%" name="btn" value="btn1">Login</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Left side -->
			<div class="col-md-1"
				style="border-left: solid 2px black; margin-top: 50px"></div>
			<!-- Right side -->
			<div class="col-md-7">
				<div>

					<div style="width: 80%; margin-top: 50px;">

						<%
							if (request.getParameter("msgReg")=="true") {
						%>
						<div class="alert alert-success" role="alert">Saved
							Successfully!</div>
						<%
							}
						%>
						<div
						style="width: 100%; margin-top: 50px; padding: 20px 50px 50px 50px">
						<div align="center">
						<h2>User Registraion Portal</h2>
							<img src="../../resources/image/user-registration.png" width="300px" height="300px">
						</div>

						<form id="subForm2" action="userReg" method="post">
							<div class="form-group">
								<label for="name">Full Name</label> <input type="text"
									class="form-control" id="name" placeholder="Jon Doe"
									name="name" required="required">
							</div>

							<div class="form-group">
								<label for="address">Address</label> <input type="text"
									class="form-control" id="address"
									placeholder="293,Matale,Srilanka" name="address"
									required="required">
							</div>

							<div class="form-group">
								<label for="contact">Phone Number</label> <input type="tel"
									class="form-control" id="contact" placeholder="0717171717"
									name="contact" required="required" pattern="^\d{10}$">
							</div>

							<div class="form-group">
								<label for="contact">City</label> <input type="text"
									class="form-control" id="city" placeholder="Matale" name="city"
									required="required">
							</div>

							<div class="form-group">
								<label for="contact">Eamil</label> <input type="email"
									class="form-control" id="email" placeholder="example@gmail.com"
									name="email" required="required">
							</div>

							<div class="form-group">
								<label for="uname">User Name</label> <input type="text"
									class="form-control" id="uname" placeholder="jon" name="uname"
									required="required">
							</div>

							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="txtNewPassword" placeholder="1234"
									name="password" required="required">
							</div>

							<div class="form-group">
								<label for="password">Confirm Password</label> <input
									type="password" class="form-control" id="txtConfirmPassword"
									placeholder="1234" name="cpassword" required="required">
							</div>
							<div class="registrationFormAlert" style="color: red;"
								id="CheckPasswordMatch"></div>

							<hr />

							<div class="form-group">
								<p>Select your secret question type</p>
							</div>

							<div class="form-group">
								<input type="radio" id="html" name="squestion" value="Pet name">
								<label for="html">Pet name</label> <input type="radio" id="html"
									name="squestion" value="Mother name"> <label for="html">Mother's
									name</label> <input type="radio" id="html" name="squestion"
									value="Birth place"> <label for="html">Birth
									place</label>
							</div>

							<div class="form-group">
								<label for="uname">Enter the answer to the secret
									question</label> <input type="text" class="form-control" id="sanswer"
									name="sanswer" required="required">
							</div>

							

							<div align="right">
								<button type="submit" class="button " style="width: 50%"
									id="btn2" name="btn" value="btn2">Register as a new
									user</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Right side -->

		</div>
	</div>
	<!-- Main Content -->

	<!-- The Modal -->
	<form action="forgotpassword" method="post">
		<div id="myModal" class="modal">

			<!-- Modal content -->
			<div class="modal-content">
				<span class="close">&times;</span>
				<h4 align="center">Forgot password</h4>
				<br />
				<div class="form-group">
					<label for="contact"><span style="color: navy;">Enter
							your Email</span></label> <input type="email" class="form-control" id="answer"
						name="email" required="required">
				</div>
				<div class="form-group">
					<label for="contact"><span style="color: navy;">Enter
							your secret answer</span></label> <input type="text" class="form-control"
						id="answer" name="answer" required="required">
				</div>
				<div class="form-group">
					<label for="contact"><span style="color: navy;">New
							password</span></label> <input type="password" class="form-control" id="answer"
						name="pass" required="required">
				</div>
				<div class="form-group">
					<label for="contact"><span style="color: navy;">Confirm
							new password</span></label> <input type="password" class="form-control"
						id="answer" name="password" required="required">
				</div>
				<div align="center">
					<button type="submit" class="btn btn-primary" style="width: 50%"
						id="btn2" name="btn" value="btn2">Change Password</button>
				</div>
			</div>

		</div>
	</form>
	<!-- The Modal -->

	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<!-- Footer -->
</body>

<script>
	//Get the modal
	var modal = document.getElementById("myModal");
	var btn = document.getElementById("forgotPass");
	var span = document.getElementsByClassName("close")[0];

	btn.onclick = function() {
		modal.style.display = "block";
	}

	span.onclick = function() {
		modal.style.display = "none";
	}
</script>

<script>
	function checkPasswordMatch() {
		var password = $("#txtNewPassword").val();
		var confirmPassword = $("#txtConfirmPassword").val();
		if (password != confirmPassword) {
			$("#CheckPasswordMatch").html("Passwords does not match!");
			$("#btn2").attr("disabled", true);
		} else {
			$("#CheckPasswordMatch").html("");
			$("#btn2").attr("disabled", false);
		}
	}
	$(document).ready(function() {
		$("#txtConfirmPassword").keyup(checkPasswordMatch);
	});
</script>

<script>
	$("#subForm2").validate({
		rules : {
			contact : {
				required : true,
				number : true,
				minlength : 10,
				maxlength : 10
			}
		}
	});
</script>
</html>