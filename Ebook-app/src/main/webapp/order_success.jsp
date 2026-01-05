<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>
<%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<%@include file="all_components/navbar.jsp"%>
	<div class="container text-center p-5">
	<i class="fas fa-check-circle fa-5x text-success"></i>
	<h2>Thank You</h2>
	<h3>Your Order Successfully</h3>
	<h5>Within 7 days Your Product will be Delivered in your address</h5>
	<a href="index.jsp" class="btn btn-primary mt-3">Home</a>
	<a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
	</div>
</body>
</html>