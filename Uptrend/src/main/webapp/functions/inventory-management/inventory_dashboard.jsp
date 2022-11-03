<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

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
	<link rel="stylesheet" type="text/css" href="../../resources/css/inv_update_modal.css">
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
						<div onclick="location.href='inventory-dashboard'" id="clickAfterPageLoad" class="active">
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
						INVENTORY DASHBOARD
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
						
							<c:forEach var="inventory" items="${inventory}">
						
								<tr class="active-row">
									<th scope="row"><c:out value="${inventory.invId}" /></th>
									<td><c:out value="${inventory.itemName}" /></td>
									<td><c:out value="${inventory.quantity}" /></td>
									<td><c:out value="${inventory.available}" /></td>
									<td><c:out value="${inventory.purchPrice}" />0</td>
									<td><c:out value="${inventory.sellPrice}" />0</td>
									<td><c:out value="${inventory.itemType}" /></td>
									<td><c:out value="${inventory.itemImg}" /></td>
									<td><c:out value="${inventory.stockInDate}" /></td>
									<td><c:out value="${inventory.supId}" /></td>
									<td>
										<!-- action -->
										<div class="container-fluid d-flex text-center dash-action">
											<div class="col-6">
												<i class="bi bi-pencil-square" data-toggle="modal" data-target="#updateModal" onclick="location.href='update-request?id=<c:out value='${inventory.invId}' />'"></i>
											</div>
											<div class="col-6">
												<i class="bi bi-trash-fill" data-toggle="modal" data-target="#deleteModal" onclick="location.href='delete-request?id=<c:out value='${inventory.invId}' />'"></i>
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

	<!-- Update Modal -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">UPDATE STOCK</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>


	      <div class="modal-body">

			<form action="update" method="post" id="update-record">
			  <div class="form-group row">
			    <label for="invId" class="col-sm-4 col-form-label">Inventory ID</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control disabled-input" id="invId" name="invId" placeholder="Inventory ID" value="<c:out value="${inventoryRecord.invId}" />" readonly>
			    </div>
			  </div>

			  <div class="form-group row">
			    <label for="itemName" class="col-sm-4 col-form-label">Item Name</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" id="itemName" name="itemName" placeholder="Item Name" value="<c:out value="${inventoryRecord.itemName}" />" required>
			    </div>
			  </div>

			  <div class="form-group row">
			    <label for="quantity" class="col-sm-4 col-form-label">Quantity</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control disabled-input" id="quantity" name="quantity" placeholder="Quantity" value="<c:out value="${inventoryRecord.quantity}" />" readonly>
			    </div>
			  </div>
			  
			  <div class="form-group row">
			    <label for="availableQty" class="col-sm-4 col-form-label">Available Qty</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control disabled-input" id="availableQty" name="availableQty" placeholder="Available Qty" value="<c:out value="${inventoryRecord.available}" />" readonly>
			    </div>
			  </div>

			  <div class="form-group row">
			    <label for="purchPrice" class="col-sm-4 col-form-label">Purchased Price</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control disabled-input" id="purchPrice" name="purchPrice" placeholder="Purchased Price" value="<c:out value="${inventoryRecord.purchPrice}" />0" readonly>
			    </div>
			  </div>

			  <div class="form-group row">
			    <label for="sellPrice" class="col-sm-4 col-form-label">Selling Price</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" id="sellPrice" name="sellPrice" placeholder="Selling Price" value="<c:out value="${inventoryRecord.sellPrice}" />0" required>
			    </div>
			  </div>

			  <div class="form-group row">
			    <label for="itemType" class="col-sm-4 col-form-label">Stock Type</label>
			    <div class="form-group col-sm-8">
			      <select id="itemType" name="itemType" class="form-select">
			      
			      	<c:if test="${inventoryRecord == null}">
						<option selected disabled>Stock Type</option>
					</c:if>
					<c:if test="${inventoryRecord != null}">
						<option value="<c:out value="${inventoryRecord.itemType}" />" selected><c:out value="${inventoryRecord.itemType}" /></option>
					</c:if>
			      
			        <option value="kids">Kids</option>
			        <option value="men">Mens</option>
			        <option value="women">Womens</option>
			        <option value="unisex">Unisex</option>
			      </select>
			    </div>
			  </div>

			  <div class="form-group row">
			  	<div class="container-fluid d-flex " data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" onclick="myFunction()">

			  		<button class="col-12 d-flex img-collapse" type="button">
			  			<div class="col-11 d-flex justify-content-start">
					  		Update Image (optional)
					  	</div>
					  	<div class="col-1 text-center">
					  		<i id="change-icon" class="bi bi-plus-lg"></i>
					  	</div>
			  		</button>

			  		
			  	</div>
			  </div>

			  <div class="form-group row collapse"  id="collapseExample">
			  	<label class="col-sm-4 col-form-label" for="itemImg">Item Image</label>
			    <div class="col-sm-8">
			      <input type="file" class="form-control" id="itemImg" name="itemImg" accept="image/png, image/jpeg"/>
			    </div>
			  </div>
			</form>	

	      </div>


	      <div class="modal-footer">
	        <button type="button" class="btn close-btn" data-dismiss="modal">Close</button>
	        <button type="submit" form="update-record" class="btn update-btn">Update</button>
	      </div>
	    </div>
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
						Are you sure you want to delete this record?
					</div>
				</div>
			</div>

	      </div>


	      <div class="modal-footer">
	        <button type="button" class="btn close-btn" data-dismiss="modal">Close</button>
	        <button type="button" class="btn delete-btn" onclick="location.href='delete?id=<c:out value='${itemId}' />'">Delete</button>
	      </div>
	    </div>
	  </div>
	</div>	


	<!-- Scripts -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<!-- Custom Scripts -->
	<script>
		function myFunction() {
		  const element = document.getElementById("change-icon");

		  if(element.classList == "bi bi-plus-lg") {
		  	element.classList.remove("bi-plus-lg");
		  	element.classList.add("bi-dash-lg");
		  } else {
		  	element.classList.remove("bi-dash-lg");
		  	element.classList.add("bi-plus-lg");
		  }
		  
		}
		
		
	</script>
	
	
	<c:if test="${inventoryRecord != null}">
		<script>
			$(document).ready(function(){
				$("#updateModal").modal("show");
			})
		</script>
	</c:if>
	
	
	<c:if test="${itemId != null}">
		<script>
			$(document).ready(function(){
				$("#deleteModal").modal("show");
			})
		</script>
	</c:if>
	
	
	

</body>
</html>