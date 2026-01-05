<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Books</title>
<%@include file="all_components/allCSS.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>

<%
User u = (User)session.getAttribute("UserObj");
%>
	<div class="container-fluid">
		<div class="row p-3">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao2.getAllRecentBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho m-2">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="height: 150px; width: 100px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("old")) {
							%>


							Category:
							<%=b.getBookCategory()%>

						</p>

						<div class="d-flex justify-content-center">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ms-1">View</a> <a href="#"
								class="btn btn-danger btn-sm ms-1">₹<%=b.getPrice()%></a>
						</div>

						<%
						} else {
						%>
						<p>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="d-flex justify-content-center">
							<%
						if(u==null){
						%>	
						<a href="login.jsp" class="btn btn-danger btn-sm ms-2"><i
								class="fa-solid fa-cart-shopping"></i>Add Cart</a>
						<%}else{
						%>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ms-2"><i
								class="fa-solid fa-cart-shopping"></i>Add Cart</a>
						<%}
						%>
								 <a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ms-1">View</a> <a href="#"
								class="btn btn-danger btn-sm ms-1">₹<%=b.getPrice()%></a>
						</div>
						<%
						}
						%>




					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>
</body>
</html>