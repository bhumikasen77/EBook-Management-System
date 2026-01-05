<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook: Register</title>
<%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color:#f0f1f2;">
	<%@include file="all_components/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center">Registration Page</h4>
					<c:if test="${ not empty sucMsg}">
					<p class="text-center text-success">${sucMsg}</p>
					<c:remove var="sucMsg" scope="session"/>
					</c:if>
					
					<c:if test="${ not empty failedMsg}">
					<p class="text-center text-danger">${failedMsg}</p>
					<c:remove var="failedMsg" scope="session"/>
					</c:if>
					
						<form action="register" method="post">
						    <div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Enter your
									full name</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">
						
							</div>
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone
									number</label> <input type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="phone">
								
							</div>
							
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required="required" name="password">
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Check me out</label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_components/footer.jsp" %>
</body>
</html>