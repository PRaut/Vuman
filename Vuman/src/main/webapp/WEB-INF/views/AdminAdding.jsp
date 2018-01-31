
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>

<link rel="stylesheet" type="text/css" href="/css/admintabs.css">
<script type="text/javascript" src="/js/admin_js_tab.js"></script>

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
			<button class="tablinks" onclick="openCity(event, 'London')">London</button>
			<button class="tablinks" onclick="openCity(event, 'Paris')">Paris</button>
			<button class="tablinks" onclick="openCity(event, 'Tokyo')">Tokyo</button>
		</div>

		<!-- Tab content -->
		<div id="London" class="tabcontent">
			<h3>London</h3>
			<p>London is the capital city of England.</p>
		</div>

		<div id="Paris" class="tabcontent">
			<h3>Paris</h3>
			<p>Paris is the capital of France.</p>
		</div>

		<div id="Tokyo" class="tabcontent">
			<h3>Tokyo</h3>
			<p>Tokyo is the capital of Japan.</p>
		</div>
	</div>
</body>
</html>