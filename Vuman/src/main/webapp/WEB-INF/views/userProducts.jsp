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

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Vuman - Products Available</title>
<link href="${css}/stylesheet.css" rel="stylesheet" type="text/css"></link>


</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="container">
		<c:if test="${not empty msg }">
			<div class="col-xs-12 col-md-8 alert-danger">
				${msg}
			</div>
		</c:if>
	
		<c:if test="${not empty productList}">
			<c:forEach var="product" items="${productList}">
				<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="col-xs-12 productbox">
								<img alt="${product.imageName}" class="img-responsive prdimg"
									src="${contextRoot}/resources/images/${product.imageName}" />

								<div class="producttitle">${product.productName}</div>
								<div class="productprice">
									<div class="pull-right">
										<a href="productById/${product.pid}"
											class="btn btn-sm" role="button"><span class="glyphicon glyphicon-eye-open"></span></a>
									</div>
									<div class="pricetext">&#8377; ${product.price}</div>
								</div>
							</div>
						</div>
			</c:forEach>
		</c:if>
		<br/>
	</div>
	<br/>
	<br/>
	<br/>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>