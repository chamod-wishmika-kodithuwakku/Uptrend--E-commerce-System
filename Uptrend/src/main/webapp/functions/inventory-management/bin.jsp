<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Bin</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap-grid.css">

	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_panel_custom.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_media_query.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/inventory_dashboard.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/inv_delete_modal.css">
	
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
						<div onclick="location.href='inventory-dashboard'" id="clickAfterPageLoad">
							<i class="bi bi-speedometer"></i>
							Dashboard
						</div>
						<!-- div onclick="location.href='#Analytics'">
							<i class="bi bi-pie-chart-fill"></i>
							Analytics
						</div-->
						<div onclick="location.href='report'">
							<i class="bi bi-file-earmark-spreadsheet-fill"></i>
							Report
						</div>
						<div onclick="location.href='bin'" class="active">
							<i class="bi bi-trash-fill"></i>
							Bin
						</div>	
					</div>
				</div>
				
			</div>

			<div class="col-12 col-sm-12 col-md-10 inventory-space">
				<div class="row dashboard-title-row">
					<div class="col-12 col-sm-8 dashboard-body-title">
						BIN
					</div>

					<div class="col-12 col-sm-4 d-flex justify-content-center justify-content-sm-start new-stock-btn">
						<a href="newly-added-stock" class="notification">
							<span>Newly Added Stocks</span>
							<!--span class="badge">3</span-->
						</a>
					</div>	
				</div>
				

				<div class="table-responsive table-responsive-sm dashboard-body-content" >

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
								<th scope="col">Stock Type</th>
								<th scope="col">Item Image</th>
								<th scope="col">Stock In Date</th>
								<th scope="col">Supplier ID</th>
								<th scope="col" class="text-center">Action</th>

							</tr>
						</thead>
						<tbody class="align-middle">
						
							<c:forEach var="bin" items="${bin}">
						
								<tr class="active-row">
									<th scope="row"><c:out value="${bin.invId}" /></th>
									<td><c:out value="${bin.itemName}" /></td>
									<td><c:out value="${bin.quantity}" /></td>
									<td><c:out value="${bin.available}" /></td>
									<td><c:out value="${bin.purchPrice}" />0</td>
									<td><c:out value="${bin.sellPrice}" />0</td>
									<td><c:out value="${bin.itemType}" /></td>
									<td><c:out value="${bin.itemImg}" /></td>
									<td><c:out value="${bin.stockInDate}" /></td>
									<td><c:out value="${bin.supId}" /></td>
									<td>
										<!-- action -->
										<div class="container-fluid d-flex text-center dash-action">
											<div class="col-6">
												<i class="bi bi-trash-fill" data-toggle="modal" data-target="#deleteModal" onclick="location.href='permanent-delete-request?id=<c:out value='${bin.invId}' />'"></i>
											</div>
										</div>
									</td>
								</tr>
							
							</c:forEach>
							
						</tbody>
					</table>

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

	<!-- Delete Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">DELETE STOCK</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>


	      <div class="modal-body">

			<div class="container-fluid text-center">
				<div class="row">
					<i class="bi bi-trash-fill"></i>
				</div>

				<div class="row">
					<div class="delete-modal-msg">
						Are you sure you want to permanently delete this record?
					</div>
				</div>
			</div>

	      </div>


	      <div class="modal-footer">
	        <button type="button" class="btn close-btn" data-dismiss="modal">Close</button>
	        <button type="button" class="btn delete-btn" onclick="location.href='confirm-delete?id=<c:out value='${itemId}' />'">Delete</button>
	      </div>
	    </div>
	  </div>
	</div>	


	<!-- Scripts -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	
	
	<c:if test="${itemId != null}">
		<script>
			$(document).ready(function(){
				$("#deleteModal").modal("show");
			})
		</script>
	</c:if>
	
	
	

</body>
</html>