<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Page</title>

<link rel="stylesheet" type="text/css"
	href="./resources/css/admintabs.css">
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
	<%-- <%@include file="header.html" %> --%>
	<h2>Welcome Admin</h2>
	<div class="container">

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#supplier">Supplier</a></li>
			<li><a data-toggle="tab" href="#category">Category</a></li>
			<li><a data-toggle="tab" href="#product">Product</a></li>
		</ul>

		<div class="tab-content">
			<div id="supplier" class="tab-pane fade in active">
				<form action="/saveSupp">
					<div class="form-group">
						<label for="sid">Supplier ID</label> <input type="text"
							class="form-control" id="sid" placeholder="Enter Supplier ID"
							name="sid">
					</div>
					<div class="form-group">
						<label for="supplierName">Supplier Name</label> <input type="text"
							class="form-control" id="supplierName"
							placeholder="Enter Supplier Name" name="supplierName">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
			<div id="category" class="tab-pane fade">
				<form action="/saveCat/cid">
					<div class="form-group">
						<label for="cid">Category ID</label> <input type="text"
							class="form-control" id="cid" placeholder="Enter Category ID"
							name="cid">
					</div>
					<div class="form-group">
						<label for="cname">Category Name</label> <input type="text"
							class="form-control" id="cname" placeholder="Enter Category Name"
							name="cname">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
			<div id="product" class="tab-pane fade">
				<form action="/saveProd">
					<div class="form-group">
						<label for="pName">Product Name</label> <input type="text"
							class="form-control" id="pName" placeholder="Enter Product Name"
							name="pName">
					</div>
					<div class="form-group">
						<label for="pDesc">Product Description</label>
						<textarea class="form-control" id="pDesc" rows="3"></textarea>
					</div>
					<div class="form-group">
						<label for="pPrice">Price</label> <input type="text"
							class="form-control" id="pPrice"
							placeholder="Enter Product Price" name="pPrice">
					</div>

					<div class="form-group">
						<label for="pStock">Stock</label> <input type="pStock"
							class="form-control" id="pStock" placeholder="Enter Stock"
							name="pStock">
					</div>

					<div class="form-group">
						<label for="cid">Category ID</label> <select class="form-control"
							id="cid" name="cid">
							<option>cat 1</option>
							<option>cat 2</option>
						</select>
					</div>

					<div class="form-group">
						<label for="sid">Supplier ID</label> <select class="form-control"
							id="sid" name="sid">
							<option>Supp 1</option>
							<option>Supp 2</option>
						</select>
					</div>

					<div class="form-group">
						<label for="pImage">Select Product Image</label> <input
							type="file" class="form-control-file" id="pImage">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		</div>

	</div>

	<%-- <%@include file="footer.html" %> --%>
</body>
</html>