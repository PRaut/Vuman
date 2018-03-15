<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" autoFlush="false" isELIgnored="false"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>
<spring:url var="images" value="/resources/images"></spring:url>

<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body style="width: 100%;">
	<!-- Navbar -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="#"><strong> Vuman </strong> </a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${contextRoot}/"><span
							class="glyphicon glyphicon-home"></span> Home</a></li>


					<security:authorize access="isAnonymous()"> 
						<li><a href="${contextRoot}/login"><span
								class="glyphicon glyphicon-log-in"> Signin</span></a></li>
	
						<li><a href="${contextRoot}/register"><span
								class="glyphicon glyphicon-user"> Register</span></a></li>

					</security:authorize>

					<li class="dropdown" style="z-index: 9999"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Category<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<c:if test="${ not empty catList }">
								<li><a href="${contextRoot}/product/all">All Products</a></li>
								<c:forEach var="cat" items="${catList}">
									<li><a href="${contextRoot}/product/${cat.cid}"> <c:out
												value="${cat.cname}" /></a></li>
								</c:forEach>
							</c:if>
						</ul></li>

					<security:authorize access="hasAuthority('ROLE_ADMIN')">
						<li><a href="${contextRoot}/admin"><span
								class="glyphicon glyphicon-log-in"> Admin</span></a></li>
					</security:authorize>
					
					
				</ul>
				
				
				<ul class="nav navbar-nav navbar-right">
					<security:authorize  access="hasAuthority('ROLE_USER')"> 
						<li><a href="${contextRoot}/cart/showCart"> <span
									class="glyphicon glyphicon-shopping-cart"></span>
							</a>
						</li>
						</security:authorize>
				
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
					<li><c:if test="${pageContext.request.userPrincipal.name != null}">
							<span>
							<c:out value="${SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString()}"></c:out>
							<h6 style="color: white;" align="right">
								Welcome : ${pageContext.request.userPrincipal.name} 
								<a href="<c:url value="/logout" />">Logout</a>
							</h6>
						</c:if>
						</span>
						</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Navbar End -->
	 <div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="${images}/banner-1.jpg" alt="New York"
						style="width: 100%;" />
				</div>

				<div class="item">
					<img src="${images}/banner-2.jpg" alt="New York"
						style="width: 100%;" />
				</div>

				<div class="item">
					<img src="${images}/banner-3.jpg" alt="Los Angeles"
						style="width: 100%;" />
				</div>
			</div>

			<!-- Left Right control  -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only"></span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only"></span>
			</a>
		</div>
	</div>
 
</body>
</html>