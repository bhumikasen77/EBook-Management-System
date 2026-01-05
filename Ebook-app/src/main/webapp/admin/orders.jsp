<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
	<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookOrderImpl"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.entity.Book_Order"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Orders</title>
<%@include file="allCSS.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty UserObj }">
	<c:redirect url="../login.jsp"/>
	</c:if>

	<h3 class="text-center">Hello, Admin</h3>

	<table class="table">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone no.</th>
				<th scope="col">Book</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Payment type</th>
			</tr>
		</thead>
		<tbody>
		
		<%
		BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
		List<Book_Order> blist = dao.getAllOrder();
		for(Book_Order b:blist){
			%>
			<tr>
				<th scope="row"><%=b.getOrder_id() %></th>
				<td><%=b.getUserName() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFullAdd() %></td>
				<td><%=b.getPhone() %></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPaymentType() %></td>
				
			</tr>
		<%}
		%>
			
			
		</tbody>
	</table>
</body>
</html>