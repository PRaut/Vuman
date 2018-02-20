<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@page language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" language="java"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Update Product</title>
</head>
<body>

	<jsp:include page="adminHeader.jsp" />
	
	<div class="container">
	
	<c:if test="${not empty msg}">
		<h4>${msg}</h4>
	</c:if>
	
	<!-- Update Product Form -->
	<div id="product">
		<sf:form action="${contextRoot}/admin/editSave"
			modelAttribute="product" method="POST" enctype="multipart/form-data">
			
			<div class="form-group">
				<sf:label for="pName" path="productName">Product Name</sf:label>
				<sf:input type="text" path="productName" class="form-control"
					id="pName" placeholder="Enter Product Name" name="pName"></sf:input>
			</div>
			<div class="form-group">
				<sf:label for="pDesc" path="productDescription">Product Description</sf:label>
				<sf:textarea class="form-control" path="productDescription" name="productDescription"
					id="pDesc" rows="3"></sf:textarea>
			</div>
			<div class="form-group">
				<sf:label for="pPrice" path="price">Price</sf:label>
				<sf:input type="text" path="price" class="form-control" id="pPrice"
					placeholder="Enter Product Price" name="pPrice" />
			</div>

			<div class="form-group">
				<sf:label for="pStock" path="stock">Stock</sf:label>
				<sf:input type="text" path="stock" class="form-control" id="pStock"
					placeholder="Enter Stock" name="pStock" />
			</div>

			<div class="form-group">
				<label for="cid">Category ID</label>
				<sf:select class="form-control" path="category" name="category"
					items="${categories}" itemLabel="cname" itemValue="cid" />
			</div>

			<div class="form-group">
				<label for="sid">Supplier ID</label>
				<sf:select class="form-control" path="supplier" name="supplier"
					items="${suppliers}" itemLabel="supplierName" itemValue="sid" />
			</div>

			<div class="form-group">
				<sf:label for="file" path="pimage">Select Product Image</sf:label>
				<sf:input type="file" class="form-control-file" id="pimage"
					path="pimage" name="pimage"></sf:input>
			</div>
			<sf:button type="submit" class="btn btn-default">Submit</sf:button>

			<sf:hidden path="pid" />
			<c:out value=" PID FOR UPDATE PRODUCT+${pid}"></c:out>
			<sf:hidden path="productName" />
			<sf:hidden path="productDescription" />
			<sf:hidden path="price" />
			<sf:hidden path="stock" />
		</sf:form>
	</div>
	</div>
</body>
</html>