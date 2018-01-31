<%@include file="header.html" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>

<link rel="stylesheet" type="text/css" href="./resources/css/admintabs.css">
<script type="text/javascript" src="./resources/js/admin_tab_js.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="main.js"></script>

</head>
<body>
	<h1>Welcome Admin</h1>
	<div class="container">
		<!-- Tab links -->
		<div class="tab">
			<button class="tablinks" onclick="openCity(event, 'Supplier')">Supplier</button>
			<button class="tablinks" onclick="openCity(event, 'Product')">Product</button>
			<button class="tablinks" onclick="openCity(event, 'Category')">Category</button>
		</div>

		<!-- Tab content -->
		<div id="Supplier" class="tabcontent">
			<h3>Supplier</h3>
			<p>This is Supplier</p>
		</div>

		<div id="Product" class="tabcontent">
			<h3>Product</h3>
			<p>This is Product</p>
		</div>

		<div id="Category" class="tabcontent">
			<h3>Category</h3>
			<p>This is Category</p>
		</div>
	</div>
</body>
</html>