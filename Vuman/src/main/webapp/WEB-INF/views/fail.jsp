<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" autoFlush="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>
<spring:url var="images" value="/resources/images"></spring:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Fail</title>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="container">
		<div class="jumbotron col-md-8 col-sm-8 col-xs-12">
			<h2>${errorTitle}</h2>
			<hr />
			<h3>${errorDesc}</h3>
		</div>
	</div>




	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>