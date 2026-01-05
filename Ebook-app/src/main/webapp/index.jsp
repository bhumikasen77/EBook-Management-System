<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file="all_components/allCSS.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/book.jpg");
	height: 60vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">

<%
User u = (User)session.getAttribute("UserObj");
%>


	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-white">
			<i class="fa-solid fa-book"></i> EBook Management System
		</h2>
	</div>

	<%
	Connection conn = DBConnect.getConn();
	%>

	<!-- start recent section -->
	<div class="container">
		<h3 class="text-center">Recent Books</h3>
		<div class="row">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao2.getRecentBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="height: 200px; width: 150px" class="img-thumblin">
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
							 <a
								href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ms-1">View</a> <a href=""
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
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- End recent section -->
	<hr>
	<!-- start new section -->
	<div class="container">
		<h3 class="text-center">New Books</h3>
		<div class="row">


			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao.getNewBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="height: 200px; width: 150px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%></p>
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
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!-- End new section -->

	<hr>
	<!-- start old section -->
	<div class="container">
		<h3 class="text-center">Old Books</h3>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="height: 200px; width: 150px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:
							<%=b.getBookCategory()%></p>
						
						<div class="d-flex justify-content-center">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ms-1">View</a> <a href="#"
								class="btn btn-danger btn-sm ms-1">₹<%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>




		</div>
		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!-- End old section -->

	<%@include file="all_components/footer.jsp"%>

</body>
</html>