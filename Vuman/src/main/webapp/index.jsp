<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vuman</title>
<link href="stylesheet.css"></link>
</head>
<body>
	<!-- header start-->
	<jsp:include page="header.html"></jsp:include>
	<!-- header end -->

	<!--  carousal start -->
	<jsp:include page="carousel.html"></jsp:include>
	<!-- carousel end -->

	<!-- 3 col product start   -->
	<div class="container">
		<div class="row">
			 
			<div class="col-md-2 column productbox">
				<img src="images/img1.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Sarees</div>
				<div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">�8.95</div>
				</div>
			</div>

			<div class="col-md-2 column productbox">
				<img src="images/img2.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Kurti</div>
				<div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">�8.95</div>
				</div>
			</div>
			
			<div class="col-md-2 column productbox">
				<img src="images/img3.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Lehenga</div>
				<div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">�8.95</div>
				</div>
			</div>
			
			<div class="col-md-2 column productbox">
				<img src="images/img4.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Anarkali</div>
				<div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">�8.95</div>
				</div>
			</div>
			 
			 <div class="col-md-2 column productbox">
				<img src="images/img5.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Leggis</div>
				<div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">�8.95</div>
				</div>
			</div>
			
			<div class="col-md-2 column productbox">
				<img src="images/img6.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Blouse</div>
				<div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">�8.95</div>
				</div>
			</div>
			<!-- 
			<ul class="products">
				<li>
					<a href="#"> <img src="shirt-gray.png">
						<h4>Logo Shirt (Gray)</h4>
						<p>$20.00</p>
					</a>
				</li>
				<li><a href="#"> <img src="shirt-orange.png">
						<h4>Mike the Frog Shirt (Orange)</h4>
						<p>$25.00</p>
				</a></li>
				<!-- more list items -->
			</ul>
			
 			
		</div>
	</div>
	<!-- 3 col product end -->

	<!-- footer -->
	<jsp:include page="footer.html"></jsp:include>
	<!-- footer end -->
</body>
</html>