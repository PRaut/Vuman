<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"  language="java"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Page</title>

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


	<jsp:include page="adminHeader.jsp" />
	
	
	<div class="container">
		<h3>Welcome Admin</h3>
		<c:if test="${not empty msg }">
			<h3>${msg} </h3>
		</c:if>
		
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#supplier">Supplier</a></li>
			<li><a data-toggle="tab" href="#category">Category</a></li>
			<li><a data-toggle="tab" href="#product">Product</a></li>
		</ul>

		<!-- Supplier Tab -->
		<div class="tab-content">
			<div id="supplier" class="tab-pane fade in active">
				<sf:form action="${contextRoot}/admin/saveSuppliper" modelAttribute="supplier" method="post">
					<div class="form-group">
						<sf:label for="sid" path="sid">Supplier ID</sf:label> 
						<sf:input type="text" path="sid" class="form-control" id="sid" placeholder="Enter Supplier ID"
							name="sid" />
					</div>
					<div class="form-group">
						<sf:label for="supplierName" path="supplierName">Supplier Name</sf:label>
						<sf:input type="text" path="supplierName" class="form-control" id="supplierName"
							placeholder="Enter Supplier Name" name="supplierName" />
					</div>
					<sf:button type="submit" class="btn btn-default">Submit</sf:button>
				</sf:form>
			</div>
			
			<!-- Category Tab -->
			<div id="category" class="tab-pane fade">
				<sf:form action="${contextRoot}/admin/saveCategory" modelAttribute="category" method="POST">
					<div class="form-group">
						<sf:label for="cid" path="cid">Category ID</sf:label> 
						<sf:input type="text"  path="cid" class="form-control" id="cid" placeholder="Enter Category ID"
							name="cid" />
					</div>
					<div class="form-group">
						<sf:label for="cname" path="cname">Category Name</sf:label>
						 <sf:input type="text" path="cname"
							class="form-control" id="cname" placeholder="Enter Category Name"
							name="cname" />
					</div>
					<sf:button type="submit" class="btn btn-default">Submit</sf:button>
				</sf:form>
			</div>
			
			<!-- Product Tab -->
			<div id="product" class="tab-pane fade">
				<sf:form action="${contextRoot}/admin/saveProduct" modelAttribute="product" method="POST" enctype="multipart/form-data" >
					<div class="form-group">
						<sf:label for="pName" path="productName">Product Name</sf:label> 
						<sf:input type="text" path= "productName" class="form-control" id="pName" placeholder="Enter Product Name"
							name="pName"></sf:input>
					</div>
					<div class="form-group">
						<sf:label for="pDesc" path="productDescription">Product Description</sf:label>
						<sf:textarea class="form-control" path="productDescription" id="pDesc" rows="3"></sf:textarea>
					</div>
					<div class="form-group">
						<sf:label for="pPrice" path="price">Price</sf:label> 
						<sf:input type="text" path="price"
							class="form-control" id="pPrice"
							placeholder="Enter Product Price" name="pPrice"/>
					</div>

					<div class="form-group">
						<sf:label for="pStock" path="stock">Stock</sf:label> 
						<sf:input type="text" path="stock" class="form-control" id="pStock" placeholder="Enter Stock"
							name="pStock"/>
					</div>

					<div class="form-group">
						<label for="cid">Category ID</label> 
						<sf:select class="form-control" path="category" name="category"
							items="${categories}"
							itemLabel="cname"
							itemValue="cid"	
						/>
					</div>

					<div class="form-group">
						<label for="sid">Supplier ID</label> 
						<sf:select class="form-control" path="supplier"
							name="supplier"
							items="${suppliers}"
							itemLabel="supplierName"
							itemValue="sid"
						/>
					</div>

					<div class="form-group">
						<sf:label for="file" path="pimage">Select Product Image</sf:label> 
						<sf:input type="file" class="form-control-file" id="pimage" path="pimage" name="pimage"></sf:input>
					</div>
					<sf:button type="submit" class="btn btn-default">Submit</sf:button>
				
				<sf:hidden path="pid"/>
				
				</sf:form>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>