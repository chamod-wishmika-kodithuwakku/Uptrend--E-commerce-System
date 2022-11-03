<link href="resource/Header.css" rel="stylesheet">
<%@ page session="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header style="margin-bottom: 50px">
	<div class="header-row" id="myHeader">
		<div class="col-2 logo-container nav-com">
			<div class="logo">
				<img src="image/logo.png" alt="Girl in a jacket" width="120px"
					height="120px">
			</div>
		</div>
		<div class="col-4 nav nav-com">
			<ul>
				<li class="li-com"><a class="active" href="index.jsp">Home</a></li>
				<li class="li-com"><a href="index.jsp#contact">Contact Us</a></li>
				<li class="li-com"><a href="#">About Us</a></li>
			</ul>
		</div>
		<div class="col-3 nav nav-com">
			<div class="wrap">
				<div class="search">
					<input type="text" class="searchTerm"
						placeholder="What are you looking for?">
					<button type="submit" class="searchButton">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</div>
		<div class="col-1 nav nav-com">
		<form action="payment.jsp" method="post">
			<button type="submit" class="cart">
				<i class="fa fa-shopping-cart"></i>
			</button>
			</form>
		</div>
		<div class="col-2 nav nav-com">
			<table style="width: 100%; height: 100%;">
				<tr class="row-1">
					<td colspan="2">
						<!--Hi! (User Name)--> <%
 	if (session.getAttribute("getUserSession") == null) {
 %>
						<div style="margin-bottom: 7px;">Hi!</div> <%
 	} else {
 %>
						<div style="margin-bottom: 7px;">
							Hi
							<c:out value="${sessionScope.getUserSession}" />
							!
						</div> <%
 	}
 %>
					</td>
				</tr>
				<tr class="row-2">
					<%
						if (session.getAttribute("getUserSession") == null) {
					%>
					<td>
						<form action="loginBtn" method="post">
						<input type="submit" class="cart" value="Login" name="loginBtn"
						style="border: none;">
						</form>
					</td>
					<%
						} else {
					%>
					<form action="menubehavior" method="post">
					<td>
						<!--Profile--> <input type="submit" class="cart" name="btn"
						value="Profile" style="border: none;">
					</td>
					</form>
					<td>
						<form action="userenquiry" method="post">
							<input type="submit" class="cart" name="enqBtn" value="Enquiris"
								style="border: none;">
						</form>
					</td>
					<td>
						<!--Log Out--> 
						<form action="loginBtn" method="post">
						<input type="submit" class="cart" value="Logout" name="loginBtn"
						style="border: none;">
						</form>
					</td>
					<%
						}
					%>
				</tr>
			</table>
		</div>
	</div>
</header>
