<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Admin Page</title>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<a class="navbar-brand" href="#"> Vuman </a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#"><span
						class="glyphicon glyphicon-home"></span> Home</a></li>

				<li><a href="login"><span class="glyphicon glyphicon-log-in">
							Signin</span></a></li>
		
				<li><a href="${contextRoot}/admin/manageProducts"> Manage Products </a></li>

				<!-- <li><a href="#"><span class="glyphicon glyphicon-user">
							Register</span></a></li>
 -->
				<!-- <li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Category<span class="caret"></span>
				</a> -->

					<!-- <ul class="dropdown-menu">
						<li><a href="#">Jeans</a></li>
						<li><a href="#"> Shirt</a></li>
						<li><a href="#">Shoes</a></li>
					</ul></li> -->

				<li><a href="${contextRoot}/admin"><span
						class="glyphicon glyphicon-log-in"> Admin</span></a></li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- Navbar End -->
</body>
</html>