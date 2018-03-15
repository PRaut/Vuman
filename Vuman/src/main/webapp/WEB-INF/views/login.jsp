<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:url  var="css" value="/resources/css"></spring:url>
<spring:url  var="js" value="/resources/js"></spring:url>
<spring:url  var="images" value="/resources/images"></spring:url>

<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${css}/stylesheet.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Login to Vuman</title>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	
	<div class="container">
		
		<div class="col-xs-12">
			<c:if test="${not empty msg}">
			<h4 class="alert alert-success">${msg}</h4>
			</c:if>
		</div>
		
		<h2>Login To Your Account</h2>
		<form action="${contextRoot}/login" method="post">
		
		<c:if test="${not empty error }">
			<div class="error" style="color: '#FF0000'">${error}</div>
		</c:if>
		
		<c:if test="${not empty logout}">
			<div class="error" style="color:'#FF0000'">${logout}</div>
		</c:if> 
		
			<div class="form-group">
				<label for="username">Email</label>
				<input type="text" class="form-control" id="username" placeholder ="Email"
					name="username" >
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					class="form-control" id="password" placeholder="Password"
					name="password" >
			</div>
			<div class="checkbox">
				<label><input type="checkbox" name="remember">
					Remember me</label>
			</div>
			
			<div>
				<input name="_csrf.parameterName" type="hidden" value="_csrf.token" />
			</div>
			
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>

	<!-- Footer -->
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>