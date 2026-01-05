<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
<%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_components/navbar.jsp"%>
	<c:if test="${empty UserObj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<div class="container p-1">

		<h3 class="text-center text-success">Your orders</h3>
						<table class="table table-striped mt-3">
							<thead class="bg-primary text-white">
								<tr>
									<th scope="col">Order Id</th>
									<th scope="col">Name</th>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Payment type</th>
								</tr>
							</thead>
							<tbody>
							
							<%
							User u = (User)session.getAttribute("UserObj");
							BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
							List<Book_Order> blist = dao.getBook(u.getEmail());
							for(Book_Order b: blist){
							%>	
							<tr>
									<th scope="row"><%=b.getOrder_id() %></th>
									<td><%=b.getUserName() %></td>
									<td><%=b.getBookName() %></td>
									<td><%=b.getAuthor() %></td>
									<td><%=b.getPrice() %></td>
									<td><%=b.getPaymentType() %></td>
								</tr>
							<%}
							%>
								
								
							</tbody>
						</table>
					
		</div>
</body>
</html>