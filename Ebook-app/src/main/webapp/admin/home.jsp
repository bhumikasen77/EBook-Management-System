<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Home</title>
<%@include file="allCSS.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body style="background-color:#f0f1f2;">

	<%@include file="navbar.jsp"%>
	<c:if test="${empty UserObj }">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
							<h4>Add Books</h4>
							<p>----------</p>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
							<h4>All Books</h4>
							<p>----------</p>
						</div>
					</div>
				</a>

			</div>

			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
							<h4>Orders</h4>
							<p>----------</p>
						</div>
					</div>
				</a>

			</div>

			<div class="col-md-3">
				<a data-bs-toggle="modal" data-bs-target="#exampleModal">
					<div class="card">
						<div class="card-body text-center">
							<i
								class="fa-solid fa-arrow-right-from-bracket fa-3x text-primary"></i><br>
							<h4>Logout</h4>
							<p>----------</p>
						</div>
					</div>
				</a>

			</div>
		</div>
	</div>
	
	
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="text-center">
			<h4>Do you want to logout</h4>
			<button type="button" class="btn btn-secondary"
				data-bs-dismiss="modal">Close</button>
			<a href="../logout" type="button" class="btn btn-primary">Logout</a>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- end logout -->
	
	<div style="margin-top:280px;">
	<%@include file="footer.jsp" %>
	</div>
</body>
</html>