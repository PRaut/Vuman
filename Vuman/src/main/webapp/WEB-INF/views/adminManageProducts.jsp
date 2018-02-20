<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" autoFlush="true" isELIgnored="false"%>

<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>
<spring:url var="images" value="/resources/images"></spring:url>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin- Manage Products</title>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />
	
	<div class="container" style="padding-top: 10px;">

		 <c:if test="${not empty msg}">
			<div class="alert alert-success col-xs-12">
				<h3>${msg}</h3>
			</div>
		</c:if> 


		 <c:if test="${ not empty productList }">
			<table border="2" width="70%" cellpadding="2"
				class="col-xs-12 table table-striped">
				<tr>
					<th>PID</th>
					<th>Name</th>
					<th>Image</th>
					<th>Description</th>
					<th>Price</th>
					<th>Stock</th>
					<th>Category</th>
					<th>Supplier</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				<c:forEach var="product" items="${productList}">
					<tr>
						<td>${product.pid}</td>
						<td>${product.productName}</td>
						<td><img
							src="${contextRoot}/resources/images/${product.imageName}"
							alt="${product.imageName}" width="40" height="40"></img></td>
						<td>${product.productDescription}</td>
						<td>${product.price}</td>
						<td>${product.stock}</td>
						<td>${product.category.cid}</td>
						<td>${product.supplier.sid}</td>
						<td><a href="editProduct/${product.pid}"
							class="btn btn-warning">Edit</a></td>
						<td><a href="deleteProduct/${product.pid}"
							class="btn btn-danger">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if> 
		<c:if test="${empty productList}">
			<div class="col-xs-12 jumbotron">
				<h3>No Products Available</h3>
			</div> 
		</c:if>
		
		<hr/>
		<h3>Manage Product Here</h3>
		
		<!-- Update Product Form -->
	<div id="product">
		<sf:form action="${contextRoot}/admin/saveProduct"
			modelAttribute="product" method="POST" enctype="multipart/form-data">
			
			<sf:hidden path="pid" />
			
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
					items="${categories}" itemLabel="cname" itemValue="cid"/>
					<c:out value="${product.category.cid}" />
			</div>

			<div class="form-group">
				<label for="sid">Supplier ID</label>
				<sf:select class="form-control" path="supplier" name="supplier"
					items="${suppliers}" itemLabel="supplierName" itemValue="sid"
					 value="${product.supplier.sid}" />
					<c:out value="${product.supplier.sid}"/>
			</div>

			<div class="form-group">
				<sf:label for="file" path="pimage">Select Product Image</sf:label>
				<sf:input type="file" class="form-control-file" id="pimage"
					path="pimage" name="pimage"></sf:input>
			</div>
			<sf:button type="submit" class="btn btn-default">Submit</sf:button>

			
			<c:out value=" PID FOR UPDATE PRODUCT+${pid}"></c:out>
			
		</sf:form>
	</div>
	</div>
	<!-- Make a Sticky footer for this page -->
	 <jsp:include page="footer.jsp"></jsp:include> 
</body>
</html>