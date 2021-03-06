<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" autoFlush="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${css}/stylesheet.css" rel="stylesheet" type="text/css"></link>
<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
</head>
<body>
	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<!-- <div class="row"> -->
			<!-- <span><a href="#">About us</a></span> <span><a href="#">Contact us</a></span> 
						<span><a href="#"><i class="fa fa-facebook white-text mr-lg-4"></i>facebook</a></span> 
						<span><a href="#"><i class="fa fa-twitter-square white-text mr-lg-4"></i>twitter</a></span>
						 -->
			<nav>
				<ul>
					<li><a href="#">About us</a></li>
					<li><a href="#">Contact us</a></li>
					<li><a href="#"><i
							class="fa fa-facebook white-text mr-lg-4"></i> facebook</a></li>
					<li><a href="#"><i
							class="fa fa-twitter-square white-text mr-lg-4"></i> twitter</a></li>
				</ul>
			</nav>
			<!-- </div>  -->
		</div>
	</footer>
</body>
</html>