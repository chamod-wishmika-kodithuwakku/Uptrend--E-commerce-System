<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Newly Added Stock</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap-grid.css">
	

	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_panel_custom.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/admin_media_query.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/inventory_dashboard.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/new_stock_page.css">
	
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
						<div onclick="location.href='<%=request.getContextPath()%>/functions/inventory-management/inventory-dashboard'">
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
						NEWLY ADDED STOCKS
					</div>
					 
					 <div class="col-12 col-sm-4 d-flex justify-content-center align-items-center justify-content-sm-start new-stock-btn">
						 <form method="post" action="<%=request.getContextPath()%>/Uploader" encType="multipart/form-data">
						 	<label for="upload" class="imgUploadBtn">Upload Images</label>
							<input type="file" id="upload" name="file" value="select images..." onchange="form.submit()" multiple hidden/>
							
						 </form>
					 </div> 
					
				</div>
				

				<div class="table-responsive dashboard-body-content">

					<!-------------- Table ----------------->
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">Sup_ID</th>
								<th scope="col">Item Name</th>
								<th scope="col">Quantity</th>
								<th scope="col">Purchased Price</th>
								<th scope="col" class="text-center">Action</th>

							</tr>
						</thead>
						<tbody class="align-middle">
							
							<c:forEach var="newStock" items="${newStock}">
							
								<tr class="active-row">
									<th scope="row"><c:out value="${newStock.supId}" /></th>
									<td><c:out value="${newStock.itemName}" /></td>
									<td><c:out value="${newStock.quantity}" /></td>
									<td><c:out value="${newStock.purchPrice}" />0</td>
									<td class="text-center">
										<a href="item-request?id=<c:out value='${newStock.supId}' />"><i class="bi bi-plus-circle-fill insert-icon-btn"></i></a>
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

	<!-- Modal -->
	
	<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">INSERT STOCK</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>


	      <div class="modal-body">

			<form action="insert" method="post" id="new-stock-insert">
			  <div class="form-group row">
			    <label for="itemName" class="col-sm-4 col-form-label">Item Name</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" id="itemName" name="itemName" placeholder="Item Name" value="<c:out value="${itemRecord.itemName}" />" required>
			    </div>
			  </div>

			  <div class="form-group row">
			    <label for="itemQty" class="col-sm-4 col-form-label">Quantity</label>
			    <div class="col-sm-8">
			      <input type="number" class="form-control disabled-input" id="itemQty" name="itemQty" placeholder="Quantity" value="<c:out value="${itemRecord.quantity}" />" readonly>
			    </div>
			  </div>

			  <div class="form-group row">
			    <label for="itemPurchPrice" class="col-sm-4 col-form-label">Purchased Price</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control disabled-input" id="itemPurchPrice" name="itemPurchPrice" placeholder="Purchased Price" value="<c:out value="${itemRecord.purchPrice}" />0" readonly>
			    </div>
			  </div>

			  <div class="form-group row">
			    <label for="itemSellPrice" class="col-sm-4 col-form-label">Selling Price</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" id="itemSellPrice" name="itemSellPrice" placeholder="Selling Price" required>
			    </div>
			  </div>

			  <div class="form-group row">
			    <label for="itemType" class="col-sm-4 col-form-label">Stock Type</label>
			    <div class="form-group col-sm-8">
			      <select id="itemType" name="itemType" class="form-select">
			        <option selected disabled>Stock Type</option>
			        <option value="kids">Kids</option>
			        <option value="men">Men</option>
			        <option value="women">Women</option>
			        <option value="unisex">Unisex</option>
			      </select>
			    </div>
			  </div>

			  <div class="form-group row">
			    <label class="col-sm-4 col-form-label" for="itemImg">Item Image</label>
			    <div class="col-sm-8">
			      <input type="file" class="form-control" id="itemImg" name="itemImg" accept="image/png, image/jpeg" required/>
			    </div>
		  	</div>
		  	
		  	<input type="hidden" id="supId" name="supId" value="<c:out value="${itemRecord.supId}" />">

			</form>	

	      </div>


	      <div class="modal-footer">
	        <button type="button" class="btn close-btn" data-dismiss="modal">Close</button>
	        <button type="submit" form="new-stock-insert" class="btn insert-btn">Insert</button>
	      </div>
	    </div>
	  </div>
	</div>	

	<!-- Scripts -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


	<c:if test="${itemRecord != null}">
		<script>
			$(document).ready(function(){
				$("#insertModal").modal("show");
			})
		</script>
	</c:if>

</body>
</html>