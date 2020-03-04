
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>




<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
</style>
<title>Category-Frontend</title>
</head>
<body>

	<%@ include file="/WEB-INF/view/header.jsp"%>

	<h2>Category Module</h2>
	<form:form
		action="${pageContext.request.contextPath}/admin/UpdateCategory"
		modelAttribute="catmodel" method="post">
		<div class="form-group">
			<label class="control-label col-sm-2">Category ID:</label>
			<div class="col-sm-10">
				<form:input path="catId" class="form-control" />
			</div>
		</div>
		<br>
		<div class="form-group">
			<label class="control-label col-sm-2">Category Name:</label>
			<div class="col-sm-10">
				<form:input path="catName" class="form-control" />
			</div>
		</div>
		<br>
		<div class="form-group">
			<label class="control-label col-sm-2">Category Desc:</label>
			<div class="col-sm-10">
				<form:input path="catDesc" class="form-control" />
			</div>
		</div>
		<br>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-primary navbar-inverse">Insert</button>
			</div>
		</div>
	</form:form>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<%@ include file="/WEB-INF/view/footer.jsp"%>


</body>
</html>