<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book Page</title>
<%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
<c:if test="${empty UserObj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
	<%@include file="all_components/navbar.jsp"%>

	<div class="container p-5">
	
		<div class="row">
		
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h5 class="text-center text-primary p-1">Sell Old Book</h5>
					
					<c:if test="${not empty succMsg}">
					<p class="text-center text-success">${succMsg }</p>
					<c:remove var="succMsg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty failedMsg}">
					<p class="text-center text-danger">${failedMsg }</p>
					<c:remove var="failedMsg" scope="session"/>
					</c:if>
					
						<form action="add_old_book" method="post"
							enctype="multipart/form-data">
							
							<input type="hidden" value="${UserObj.email }" name="user">
							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label">Book
									Name*</label> <input name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1" class="form-label">Author
									Name*</label> <input name="author" type="text" class="form-control"
									id="exampleInputPassword1">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1" class="form-label">price*</label>
								<input name="price" type="number" class="form-control"
									id="exampleInputPassword1">
							</div>

							
							<div class="form-group">
								<label for="exampleFormControlFile1" class="form-label">Upload
									Photo</label> <input name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Sell</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>