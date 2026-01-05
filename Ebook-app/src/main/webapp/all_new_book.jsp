<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Books</title>
<%@include file="all_components/allCSS.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {
	from {
		bottom: 0;
		opacity: 0;
	}
	to {
		bottom: 30px;
		opacity: 1;
	}
}

@keyframes fadeOut {
	from {
		bottom: 30px;
		opacity: 1;
	}
	to {
		bottom: 0;
		opacity: 0;
	}
}

}
</style>
</head>
<body>
<%
User u = (User)session.getAttribute("UserObj");
%>
	<c:if test="${not empty addCart }">

		<div id="toast">${addCart}</div>

		<script type="text/javascript">
	showToast("${addCart}");

	function showToast(content) {
		$('#toast').addClass("display");
		$('#toast').html(content);
		setTimeout(() => {
			$("#toast").removeClass("display");
		}, 2000);
	}
</script>

    <c:remove var="addCart" scope="session"/>
    
	</c:if>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao.getAllNewBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho m-2">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="height: 150px; width: 100px" class="img-thumbnail">
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
							 <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ms-1">View</a> 
							 <a href="#" class="btn btn-danger btn-sm ms-1">₹<%=b.getPrice()%></a>
						</div>
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