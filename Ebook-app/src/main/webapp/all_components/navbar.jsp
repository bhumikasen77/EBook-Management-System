<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<div class="container-fluid p-3 bg-light">
	<div class="row">

		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i>Ebooks
			</h3>
		</div>

		<div class="col-md-6">
			<form class="d-flex" action="search.jsp" method="post">
				<input class="form-control me-2" type="search" placeholder="Search" name="ch"
					aria-label="Search">
				<button class="btn btn-primary" type="submit">Search</button>
			</form>
		</div>

		<c:if test="${not empty UserObj }">
			<div class="col-md-3">
			<a href="cart.jsp" class="mt-2"><i class="fa-solid fa-cart-plus fa-2x"></i></a>
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user"></i>${UserObj.name}</a> <a
					href="logout" class="btn btn-primary"><i
					class="fa-solid fa-arrow-right-to-bracket"></i>Logout</a>
					
			</div>
		</c:if>

       <c:if test="${empty UserObj }">
       <div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-arrow-right-to-bracket"></i>Login</a> <a
					href="register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-user-plus"></i>Register</a>
			</div>
       </c:if>

	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"> Home </a></li>

				<li class="nav-item"><a class="nav-link active"
					href="all_recent_book.jsp"><i class="fa-solid fa-book"></i>Recent
						Books</a></li>


				<li class="nav-item"><a class="nav-link active"
					href="all_new_book.jsp" tabindex="-1" aria-disabled="true"><i
						class="fa-solid fa-book"></i>New Books</a></li>

				<li class="nav-item"><a class="nav-link active"
					href="all_old_book.jsp" tabindex="-1" aria-disabled="true"><i
						class="fa-solid fa-book"></i>Old Books</a></li>
			</ul>

			<form class="d-flex">
				<a href="setting.jsp" class="btn btn-light me-2" type="button">
					<i class="fa-solid fa-gear"></i> Setting
				</a>
				<button class="btn btn-light" type="submit">
					<i class="fa-solid fa-address-book"></i> Contact Us
				</button>
			</form>
		</div>
	</div>
</nav>
