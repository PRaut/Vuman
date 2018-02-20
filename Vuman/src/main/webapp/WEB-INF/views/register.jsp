<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>
<spring:url var="images" value="/resources/images"></spring:url>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="./resources/css/stylesheet.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Register to Vuman</title>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	
	<div class="container">
		<h2>Register</h2>
		<sf:form action="${contextRoot}/enrolUser" method="POST" modelAttribute="user">
			<div class="form-group">
				<sf:label for="name" path="name">Name</sf:label>
				<sf:input type="text" class="form-control" path="name" id="name" placeholder ="Name"
					name="name" />
			</div>
		
			<div class="form-group">
				<sf:label for="email" path="email">Email</sf:label>
				<sf:input type="email" class="form-control" path="email" id="email" placeholder ="Email"
					name="email" />
			</div>
			<div class="form-group">
				<sf:label for="pwd" path="password">Password</sf:label> 
				<sf:input type="password" class="form-control" path="password" id="password" placeholder="Password"
					name="password" />
			</div>
			
			<div class="form-group">
				<sf:label for="phone" path="phone">Phone</sf:label>
				<input type="tel" class="form-control" path="phone" id="phone" placeholder="Phone Number"
					name="phone">
			</div>
			
			<div class="form-group">
				<sf:label for="address" path="address">Address</sf:label>
				<sf:textarea rows="3" class="form-control" path="address" id="address" name="address" placeholder="Address"></sf:textarea>
			</div>
			
			<sf:button type="submit" class="btn btn-default">Submit</sf:button>
		</sf:form>
	</div>

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>