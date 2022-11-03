<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Report</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap-grid.css">

	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_panel_custom.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_media_query.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/inventory_dashboard.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/report.css">
	
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
				<button type="button" class="nav-home-btn theme-bg-color" onclick="location.href='http://localhost:8090/Uptrend/functions/common/admin_panel.jsp'">Home</button>
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
						<img src="../../resources/body_images/uptrend_admin_logo.png" class="img-fluid">
					</div>

					<div class="admin-option">
						<div onclick="location.href='inventory-dashboard'" id="clickAfterPageLoad" >
							<i class="bi bi-speedometer"></i>
							Dashboard
						</div>
						<!-- div onclick="location.href='#Analytics'">
							<i class="bi bi-pie-chart-fill"></i>
							Analytics
						</div-->
						<div onclick="location.href='report'" class="active">
							<i class="bi bi-file-earmark-spreadsheet-fill"></i>
							Report
						</div>
						<div onclick="location.href='bin'">
							<i class="bi bi-trash-fill"></i>
							Bin
						</div>	
					</div>
				</div>
				
			</div>

			<div class="col-12 col-sm-12 col-md-10 inventory-space">
				<div class="row dashboard-title-row">
					<div class="col-12 col-sm-8 dashboard-body-title">
						REPORT
					</div>

					<div class="col-12 col-sm-4 d-flex justify-content-center justify-content-sm-start new-stock-btn">
						<ul class="nav nav-pills">
						    <li class="nav-item">
						      <a class="nav-link" href="#scrollspyHeading1">Low Stock Item</a>
						    </li>
						    <li class="nav-item">
						      <a class="nav-link" href="#scrollspyHeading2">Stock Out Items</a>
						    </li>
						</ul>
					</div>	
				</div>
				
				<div class="col-12 col-sm-12 col-md-12 d-flex justify-content-around align-items-center visual-graph margin-top">
					
					<c:forEach var="inventory" items="${inventory}">
						<c:set var="x" value="${(inventory.quantity - inventory.available) * inventory.sellPrice}"/>
						<c:set var="y" value="${inventory.quantity * inventory.purchPrice}"/>
						
						<c:set var="xx" value="${xx + x}"/>
						<c:set var="yy" value="${yy + y}"/>
						<c:set var="percentage" value="${(xx / yy) * 100}"/>
					</c:forEach>
					
					<div style="width: 200px;" >
						<div class="d-flex justify-content-center bold-head">Earning Bar</div>
						<div class="d-flex progress">
							<div class="d-flex flex-row progress-bar" role="progressbar" style="width: <c:out value = "${percentage}"/>%;" aria-valuenow="<c:out value = "${percentage}"/>" aria-valuemin="0" aria-valuemax="100"><span id="demo"></span>%</div>
									
							<script>
								document.getElementById("demo").innerHTML = Math.round('<c:out value = "${percentage}"/>');
							</script>
						</div>
					</div>
					<div class="d-flex flex-column justify-content-center">
						<div class="d-flex justify-content-center bold-head">Total Earns</div>
						<div class="d-flex justify-content-center"><c:out value = "${xx}"/>0</div>
					</div>
					<div class="d-flex flex-column justify-content-center ">
						<div class="d-flex justify-content-center bold-head">Total Expected</div>
						<div class="d-flex justify-content-center"><c:out value = "${yy}"/>0</div>
					</div>
					
				</div>
				

				<div class="table-responsive table-responsive-sm dashboard-body-content margin-top" >

					<!-------------- Table ----------------->
					<table class="table table-striped inv-table">
						<thead class="align-middle">
							<tr>
								<th scope="col">Inv_ID</th>
								<th scope="col">Item Name</th>
								<th scope="col">Purchased Quantity</th>
								<th scope="col">Available Quantity</th>
								<th scope="col">Purchased Price</th>
								<th scope="col">Selling Price</th>
								<th scope="col">Amount Spent</th>
								<th scope="col">Expected Amount</th>
								<th scope="col">Earned Amount</th>
								<th scope="col">Expected Profit</th>
								<th scope="col">Earned Profit</th>
								

							</tr>
						</thead>
						<tbody class="align-middle">
						
							<c:forEach var="inventory" items="${inventory}">
								
								<c:set var="curEarn" value="${(inventory.quantity - inventory.available) * inventory.sellPrice}"/>
								<c:set var="expEarn" value="${inventory.quantity * inventory.purchPrice}"/>
								
								<c:set var="totCurEarn" value="${totCurEarn + curEarn}"/>
								<c:set var="totExpEarn" value="${totExpEarn + expEarn}"/>
						
								<tr class="active-row">
									<th scope="row"><c:out value="${inventory.invId}" /></th>
									<td><c:out value="${inventory.itemName}" /></td>
									<td><c:out value="${inventory.quantity}" /></td>
									<td><c:out value="${inventory.available}" /></td>
									<td><c:out value="${inventory.purchPrice}" />0</td>
									<td><c:out value="${inventory.sellPrice}" />0</td>
									<td><c:out value="${inventory.quantity * inventory.purchPrice}" />0</td>
									<td><c:out value="${inventory.quantity * inventory.sellPrice}" />0</td>
									<td><c:out value="${(inventory.quantity - inventory.available) * inventory.sellPrice}" />0</td>
									<td><c:out value="${(inventory.sellPrice - inventory.purchPrice) * inventory.quantity}" />0</td>
									<td><c:out value="${(inventory.sellPrice - inventory.purchPrice) * (inventory.quantity - inventory.available)}" />0</td>
									
								</tr>
							
							</c:forEach>
							
							<!-- tr>
								<td>Tot Earn: <c:out value = "${totCurEarn}"/>0</td>
								<td>Exp Earn: <c:out value = "${totExpEarn}"/>0</td>
							</tr -->
							
						</tbody>
					</table>

				</div>
				
				<!-- Top and Less 5 Table -->
				<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-offset="0" class="scrollspy-example" tabindex="0">
					<div id="scrollspyHeading1" class="margin-top"> 
						<div class="sub-table">Low Stock Items</div>
						<table class="table table-striped inv-table">
							<thead class="align-middle">
								<tr>
									<th scope="col">Inv_ID</th>
									<th scope="col">Item Name</th>
									<th scope="col">Purchased Quantity</th>
									<th scope="col">Available Quantity</th>
								</tr>
							</thead>
							<tbody class="align-middle">
						
								<c:forEach var="lowStock" items="${lowStock}">
							
									<tr class="active-row">
										<th scope="row"><c:out value="${lowStock.invId}" /></th>
										<td><c:out value="${lowStock.itemName}" /></td>
										<td><c:out value="${lowStock.quantity}" /></td>
										<td><c:out value="${lowStock.available}" /></td>
									</tr>
								
								</c:forEach>
								
								
							</tbody>
						</table>
					
					</div>
					<div id="scrollspyHeading2" class="margin-top">
						<div class="sub-table">Low Stock Items</div>
						<table class="table table-striped inv-table">
							<thead class="align-middle">
								<tr>
									<th scope="col">Inv_ID</th>
									<th scope="col">Item Name</th>
								</tr>
							</thead>
							<tbody class="align-middle">
						
								<c:forEach var="outOfStock" items="${outOfStock}">
							
									<tr class="active-row">
										<th scope="row"><c:out value="${outOfStock.invId}" /></th>
										<td><c:out value="${outOfStock.itemName}" /></td>
									</tr>
								
								</c:forEach>
								
								
							</tbody>
						</table>
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