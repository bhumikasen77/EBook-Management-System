<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:Home</title>
</head>
<body>
<h1>HOME PAGE OPENED</h1>

	<h1>User:Home</h1>
	<c:if test="${not empty UserObj }">
		<h1>Name:${UserObj.name}</h1>
		<h1>Email:${UserObj.email }</h1>
	</c:if>
</body>
</html>