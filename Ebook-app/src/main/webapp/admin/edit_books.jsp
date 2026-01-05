<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.BookDtls"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Add Books</title>
<%@include file="allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="navbar.jsp"%>

	<div class="container">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>



						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDtls b = dao.getBookbyId(id);
						%>

						<form action="../editbooks" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label">Book
									Name*</label> <input name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value=<%=b.getBookName()%>>

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1" class="form-label">Author
									Name*</label> <input name="author" type="text" class="form-control"
									id="exampleInputPassword1" value=<%=b.getAuthor()%>>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1" class="form-label">price*</label>
								<input name="price" type="number" class="form-control"
									id="exampleInputPassword1" value=<%=b.getPrice()%>>
							</div>


							<div class="form-group">
								<label for="inputState" class="form-label">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									
									<option value="Active"
										<%="Active".equals(b.getStatus()) ? "selected" : ""%>>Active</option>
									<option value="Inactive"
										<%="Inactive".equals(b.getStatus()) ? "selected" : ""%>>Inactive</option>
								</select>

							</div>



							<button type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>