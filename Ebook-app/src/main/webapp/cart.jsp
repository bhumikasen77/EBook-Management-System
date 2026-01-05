<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.CartDAOImpl"%>
<%@ page import="com.entity.Cart"%>
<%@ page import="com.entity.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_components/navbar.jsp"%>

	<c:if test="${empty UserObj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center" role="alert">${succMsg}</div>
			
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
			
		<c:remove var="failedMsg" scope="session"/>
	</c:if>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("UserObj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.0;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid() %>&&cid=<%=c.getCid() %> "
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="order" method="post">
						<input type="hidden" value="${UserObj.id }" name="id">
							<div class="row">
								<div class="col">
									<label>Full Name</label> <input type="text" name="username"
										class="form-control" aria-label="First name" value="<%=u.getName() %>" required>
								</div>
								<div class="col">
									<label>Email</label> <input type="email" class="form-control"  name="email"
										aria-label="Last name" value="<%=u.getEmail() %>" required>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<label>Phone number</label> <input type="number" name="phone"
										class="form-control" aria-label="Phone number" value="<%=u.getPhone() %>" required>
								</div>
								<div class="col">
									<label>Address</label> <input type="text" class="form-control"
										aria-label="Last name" name="address" required>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<label>Landmark</label> <input type="text" class="form-control"
										aria-label="" name="landmark" required>
								</div>
								<div class="col">
									<label>City</label> <input type="text" class="form-control"
										aria-label="Last name" name="city" required>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<label>State</label> <input type="text" class="form-control"
										aria-label="" name="state" required>
								</div>
								<div class="col">
									<label>Zip</label> <input type="number" class="form-control"
										aria-label="Last name" name="pin" required>
								</div>
							</div>

							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control" name="payment">
									<option value="noselect">---select---</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>

							<div class="text-center mt-2">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>