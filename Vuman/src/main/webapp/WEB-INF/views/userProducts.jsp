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

<title>Vuman - Products Available</title>
<link href="${css}/stylesheet.css" rel="stylesheet" type="text/css"></link>


</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="container">
		<c:if test="${not empty productList}">
			<c:forEach var="product" items="${productList}">
				<div class="row">
					<div class="col-md-4 column productbox">
						<div class="col-sm-6 col-xs-12">
							<img alt="${product.imageName}"
								class="userproduct img-responsive product"
								src="${contextRoot}/resources/images/${product.imageName}" />

							<div class="producttitle">${product.productName}</div>
							<div class="productprice">
								<div class="pull-right">
									<a href="productById/${product.pid}"
										class="btn btn-danger btn-sm" role="button">BUY</a>
								</div>
								<div class="pricetext">&#8377; ${product.price}</div>
							</div>
						</div>

					</div>
				</div>
			</c:forEach>
		</c:if>

	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>