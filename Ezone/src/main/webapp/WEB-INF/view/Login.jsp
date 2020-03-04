<%@ page language="java" contentType="text/html "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="<c:url value="/resources/login.css" />" rel="stylesheet">

<title>Login Page</title>
</head>
<body>

	<nav id="navbar-red" class="navbar navbar-inverse navbar-static-top"
		role="navigation">
	<div class="collapse navbar-collapse" id="bs-example-nav">
		<ul class="nav navbar-nav">
			<li><a href="/Ezone"><img
					src="<c:url value="resources/logo.jpg"/>" alt="" height="20px"
					width="90px"></a></li>
			<li><a href="/Ezone">Home</a></li>


		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="register"><span
					class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			<li><a href="login"><span class="glyphicon glyphicon-log-in"></span>
					Login</a></li>
		</ul>
	</div>
	</nav>







	<div class="container">

		<c:if test="${not empty message }">
			<div class="col-md-offset-3 col-md-6">
				<div class="alert alert-danger">${message}</div>
			</div>
		</c:if>

		<div class="wrapper">
			<form action="${pageContext.request.contextPath}/login" method="post"
				name="Login_Form" class="form-signin">
				<h3 class="form-signin-heading">Welcome Back! Please Sign In</h3>
				<hr class="colorgraph">
				<br> <input type="text" class="form-control" name="username"
					placeholder="Email" required="" autofocus="" /> <input
					type="password" class="form-control" name="password"
					placeholder="Password" required="" />

				<button class="btn btn-lg btn-primary btn-block" name="Submit"
					value="LOGIN" type="Submit">Login</button>
			</form>
		</div>
	</div>
	<br>
	<br>

	<%@ include file="/WEB-INF/view/footer.jsp"%>

</body>
</html>