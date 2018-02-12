<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" autoFlush="false"
isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="stylesheet" type="text/css" href="./resources/css/stylesheet.css"/>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body style="width: 100%;">
         <!-- Navbar -->
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    
                    <a class="navbar-brand" href="#"> Vuman </a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                        
                        <li><a href="#"><span class="glyphicon glyphicon-log-in"> Signin</span></a></li>
                        
                        <li><a href="#"><span class="glyphicon glyphicon-user"> Register</span></a></li>
                        
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Category<span class="caret"></span>
                            </a>
                            
                            <ul class="dropdown-menu">
                                <li><a href="#">Jeans</a></li>
                                <li> <a href="#"> Shirt</a></li>
                                <li><a href="#">Shoes</a></li>
                            </ul>
                        </li>
                        
                        <li><a href="${contextRoot}/admin"><span class="glyphicon glyphicon-log-in"> Admin</span></a></li>
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
					<img src="https://www.w3schools.com/bootstrap/ny.jpg"
						alt="New York" style="width: 100%;" />
				</div>

				<div class="item">
					<img src="https://www.w3schools.com/bootstrap/chicago.jpg"
						alt="New York" style="width: 100%;" />
				</div>

				<div class="item">
					<img src="https://www.w3schools.com/bootstrap/la.jpg"
						alt="Los Angeles" style="width: 100%;" />
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