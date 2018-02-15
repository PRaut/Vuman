<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="./resources/css/stylesheet.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Register to Vuman</title>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	
	<div class="container">
		<h2>Register</h2>
		<form action="#">
			<div class="form-group">
				<label for="name">Name</label>
				<input type="text" class="form-control" id="name" placeholder ="Name"
					name="name">
			</div>
		
			<div class="form-group">
				<label for="email">Email</label>
				<input type="email" class="form-control" id="email" placeholder ="Email"
					name="email">
			</div>
			<div class="form-group">
				<label for="pwd">Password</label> 
				<input type="password" class="form-control" id="pwd" placeholder="Password"
					name="pwd">
			</div>
			
			<div class="form-group">
				<label for="phone">Phone</label>
				<input type="tel" class="form-control" id="phone" placeholder ="Phone Number"
					name="phone">
			</div>
			
			<div class="form-group">
				<label for="address">Address</label>
				<textarea rows="3" class="form-control" placeholder="Address"></textarea>
			</div>
			
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>