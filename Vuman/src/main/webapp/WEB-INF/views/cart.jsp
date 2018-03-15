<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>
<spring:url var="images" value="/resources/images"></spring:url>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="${css}/stylesheet.css" rel="stylesheet" type="text/css"></link>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body id="cartbody">

	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="container">
		<c:choose>
			<c:when test="${not empty cartItems}">
				<table id="cart" class="table table-hover table-condensed">
					<thead>
						<tr>
							<th style="width: 50%">Product</th>
							<th style="width: 10%">Price</th>
							<th style="width: 8%">Quantity</th>
							<th style="width: 22%" class="text-center">Subtotal</th>
							<th style="width: 10%"></th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${cartItems}" var="cartItem">
							<tr>
								<td data-th="Product">
									<div class="row">
										<div class="col-sm-2 hidden-xs">
											<img src="${images}/${cartItem.cartImage}" alt="${cartItem.cartProductName}"
												class="img-responsive cartImage" />
										</div>
										<div class="col-sm-10">
											<h4 class="nomargin">${cartItem.cartProductName}</h4>
											<p>${cartItem.cartProductDesc}</p>
										</div>
									</div>
								</td>
								<td data-th="Price">&#8377; ${cartItem.cartPrice}</td>
								<td data-th="Quantity">
									<input type="text" class="form-control text-center" value="${cartItem.cartQty}"></td>
								<td data-th="Subtotal" class="text-center">&#8377;${cartItem.cartQty*cartItem.cartPrice}</td>
								<td class="actions" data-th="">
									<!-- <button class="btn btn-info btn-sm">
										<span class="glyphicon glyphicon-refresh"></span>
									</button> -->
									<%-- <button class="btn btn-danger btn-sm">
										<span class="glyphicon glyphicon-trash"><a href="${contextRoot}/cart/removeitem/${cartItem.cartProductId}"></a></span>
									</button> --%>
									<a href="${contextRoot}/cart/removeitem/${cartItem.cartProductId}"
									 class="glyphicon glyphicon-trash btn btn-danger btn-sm"></a>
								</td>
							</tr>

						</c:forEach>
					</tbody>
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>&#8377;${cartItem.cartQty*cartItem.cartPrice}</strong></td>
						</tr>
						<tr>
							<td><a href="${contextRoot}/" class="btn btn-warning"> <span
									class="glyphicon glyphicon-chevron-left"> Continue Shopping</span></a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center">
								<strong>Total &#8377;${totalPrice}</strong></td>
							<td><a href="${contextRoot}/payment/checkout" class="btn btn-success btn-block">Checkout
									<span class="glyphicon glyphicon-chevron-right"></span>
							</a></td>
						</tr>
					</tfoot>
				</table>
			</c:when>
			<c:otherwise>
				<div class="jumbotron">
					<div class="text-center">
						<h1>Cart is empty</h1>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

	<!-- jquery  -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="${js}/myjs.js"></script>
</body>
</html>