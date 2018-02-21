<%@page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false" autoFlush="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:url  var="css" value="/resources/css"></spring:url>
<spring:url  var="js" value="/resources/js"></spring:url>
<spring:url  var="images" value="/resources/images"></spring:url>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vuman - shopping place</title>

<link href="${css}/stylesheet.css" rel="stylesheet" type="text/css"></link>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
		<!-- 3 col product start   -->
	<div class="container">
		<div class="row">

			<div class="col-md-2 column productbox">
				<img src="${images}/img1.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Sarees</div>
				<!-- <div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">£8.95</div>
				</div> -->
			</div>

			<div class="col-md-2 column productbox">
				<img src="${images}/img2.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Kurti</div>
				<!-- <div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">£8.95</div>
				</div> -->
			</div>

			<div class="col-md-2 column productbox">
				<img src="${images}/img3.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Lehenga</div>
				<!-- <div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">£8.95</div>
				</div> -->
			</div>

			<div class="col-md-2 column productbox">
				<img src="${images}/img4.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Anarkali</div>
				<!-- <div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">£8.95</div>
				</div> -->
			</div>

			<div class="col-md-2 column productbox">
				<img src="${images}/img5.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Leggis</div>
				<!-- <div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">£8.95</div>
				</div> -->
			</div>

			<div class="col-md-2 column productbox">
				<img src="${images}/img6.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Blouse</div>
				<!-- <div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">£8.95</div>
				</div> -->
			</div>
		</div>
	</div>
	<!-- 3 col product end -->

	<!-- footer -->
	
	<!-- footer end -->
</body>
</html>
