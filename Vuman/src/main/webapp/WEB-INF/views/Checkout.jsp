<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>
<spring:url var="images" value="/resources/images"></spring:url>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="${css}/stylesheet.css" />
<script type="text/javascript" src="${js}/myjs.js"></script>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container">
		<div class='row'>
			<div class='col-md-4'></div>
			<div class='col-md-4'>
				<script src='https://js.stripe.com/v2/' type='text/javascript'></script>
				<form accept-charset="UTF-8" action="${contextRoot}/payment/dopayment" class="require-validation"
					data-cc-on-file="false"
					data-stripe-publishable-key="pk_bQQaTxnaZlzv4FnnuZ28LFHccVSaj"
					id="payment-form" method="post">
					<div style="margin: 0; padding: 0; display: inline">
						<input name="utf8" type="hidden" value="✓" /><input
							name="_method" type="hidden" value="PUT" /><input
							name="authenticity_token" type="hidden"
							value="qLZ9cScer7ZxqulsUWazw4x3cSEzv899SP/7ThPCOV8=" />
					</div>
					<div class='form-row'>
						<div class='col-xs-12 form-group required'>
							<label class='control-label'>Name on Card</label> <input
								class='form-control' size='4' type='text'>
						</div>
					</div>
					<div class='form-row'>
						<div class='col-xs-12 form-group card required'>
							<label class='control-label'>Card Number</label> <input
								autocomplete='off' class='form-control card-number' size='14'
								type='text' name="cardNumber">
						</div>
					</div>
					<div class='form-row'>
						<div class='col-xs-4 form-group cvc required'>
							<label class='control-label'>CVC</label> <input
								autocomplete='off' class='form-control card-cvc'
								placeholder='ex. 311' size='3' type='text'>
						</div>
						<div class='col-xs-4 form-group expiration required'>
							<label class='control-label'>Expiration</label> <input
								class='form-control card-expiry-month' placeholder='MM' size='2'
								type='text'>
						</div>
						<div class='col-xs-4 form-group expiration required'>
							<label class='control-label'></label> <input
								class='form-control card-expiry-year' placeholder='YYYY'
								size='4' type='text'>
						</div>
					</div>
					<div class='form-row'>
						<div class='col-md-12'>
							<div class='form-control total btn btn-info'>
								Total: <span class='amount'>&#8377;${totalPrice}</span>
								<input type="hidden" name="paymentPrice" value="${totalPrice}"/>
							</div>
						</div>
					</div>
					<div class='form-row'>
						<div class='col-md-12 form-group'>
							<button class='form-control btn btn-primary submit-button'
								type='submit'>Pay<i class="fa fa-angle-right"></i></button>
						</div>
					</div>
					<div class='form-row'>
						<div class='col-md-12 error form-group hide'>
							<div class='alert-danger alert'>Please correct the errors
								and try again.</div>
						</div>
					</div>
				</form>
			</div>
			<div class='col-md-4'></div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>