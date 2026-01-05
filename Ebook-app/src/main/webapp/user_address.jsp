<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Address</title>
<%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
<%@include file="all_components/navbar.jsp"%>
<div class="container p-4">
	
		<div class="row p-3">
		
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					<h5 class="text-center text-primary p-1">Edit Address</h5>
					<form action="">
					<div class="row">
								<div class="col">
									<label>Landmark</label> <input type="text" class="form-control"
										aria-label="">
								</div>
								
							</div>

							<div class="row">
							    <div class="col">
									<label>City</label> <input type="text" class="form-control"
										aria-label="Last name">
								</div>
							
								<div class="col">
									<label>State</label> <input type="text" class="form-control"
										aria-label="">
								</div>
								<div class="col">
									<label>Zip</label> <input type="number" class="form-control"
										aria-label="Last name">
								</div>
							</div>
							
							<div class="text-center mt-1">
							<button class="btn btn-warning text-white">Add Address</button>
							</div>

					</form>
					</div>
				</div>
			</div>
		</div>
</div>
</body>
</html>