<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" autoFlush="false"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>
<spring:url var="images" value="/resources/images"></spring:url>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="${css}/stylesheet.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Vuman </title>
</head>
<body>
<jsp:include page="navbar.jsp" />
	<div class="container">
	
	<c:if test="${not empty product}">
		<div class="row">
			<div class="col-md-2 col-xs-12">
				<img alt="${product.productName}" class="userproduct img-responsive product"
				src="${contextRoot}/resources/images/${product.imageName}">
			</div>
			<div class="col-md-8 col-xs-12" >
				<h2>Product Name: ${product.productName }</h2>
				<h3>Description: ${product.productDescription }</h3>
				<h4>Stock Available: ${product.stock }</h4>
				<h4>Price: ${product.price }</h4>
				<span>
				<a href="#"><span class="btn btn-warning"> Continue Shopping</span></a>
				<a href="#"><span class="btn btn-success">Add to Cart</span></a>
				</span>
			</div>
		</div>
		</c:if>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>