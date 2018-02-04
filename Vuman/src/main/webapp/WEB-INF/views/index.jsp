<%@include file="header.html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vuman - shopping place</title>
<link href="/resources/css/stylesheet.css" rel="stylesheet"
	type="text/css"></link>

</head>
<body>

	<!--  carousal start -->
	<jsp:include page="carousel.html"></jsp:include>
	<!-- carousel end -->

	<!-- 3 col product start   -->
	<div class="container">
		<div class="row">

			<div class="col-md-2 column productbox">
				<img src="/resources/images/img1.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Sarees</div>
				<div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">£8.95</div>
				</div>
			</div>

			<div class="col-md-2 column productbox">
				<img src="/images/img2.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Kurti</div>
				<div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">£8.95</div>
				</div>
			</div>

			<div class="col-md-2 column productbox">
				<img src="../images/img3.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Lehenga</div>
				<div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">£8.95</div>
				</div>
			</div>

			<div class="col-md-2 column productbox">
				<img src="../images/img4.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Anarkali</div>
				<div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">£8.95</div>
				</div>
			</div>

			<div class="col-md-2 column productbox">
				<img src="../images/img5.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Leggis</div>
				<div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">£8.95</div>
				</div>
			</div>

			<div class="col-md-2 column productbox">
				<img src="../images/img6.jpeg" class="img-responsive prdimg">
				<div class="producttitle">Blouse</div>
				<div class="productprice">
					<div class="pull-right">
						<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
					</div>
					<div class="pricetext">£8.95</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 3 col product end -->

	<!-- footer -->
	<jsp:include page="footer.html"></jsp:include>
	<!-- footer end -->
</body>
</html>
