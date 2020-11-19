<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
	<meta charset="ISO-8859-1">
	<title>Pyim</title>
	<!-- Required meta tags -->
	<meta http-equiv="Content-Type" content="text/html" charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
		integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<link rel="stylesheet" href="../../static/css/main.css">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Pyim</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
			aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a></li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid">
		<h2 Class="mt-3 text-center">${name}Manager</h2>
		<div class="container ">
			<form:form method="POST" action="/employee/create/addEmployee" class="row d-flex justify-content-center">
				<div class="col-6">
					<div class="form-group mb-2">
						<form:label path="name">Name</form:label>
						<form:input type="text" name="name" class="form-control" path="name" aria-describedby="name" />
					</div>
					<div class="form-group mb-2">
						<form:label path="email">Email address</form:label>
						<form:input type="email" name="email" class="form-control" path="email"
							aria-describedby="email" />
					</div>
					<div class="form-group mb-2">
						<form:label path="birthdate">Birth Date</form:label>
						<form:input type="date" name="birthdate" class="form-control" path="birthdate"
							aria-describedby="birthdate" />
					</div>
					<div class="form-group mb-2">
						<form:label path="phone">Phone</form:label>
						<form:input type="text" name="phone" class="form-control" path="phone"
							aria-describedby="phone" />
					</div>
					<div class="form-group mb-2">
						<form:label path="CPF">CPF</form:label>
						<form:input type="text" name="CPF" class="form-control" path="CPF" aria-describedby="CPF" />
					</div>
				</div>
				<div class="col-6">
					<div class="form-group mb-2">
						<form:label path="CNPJ">CNPJ</form:label>
						<form:input type="text" name="CNPJ" class="form-control" path="CNPJ" aria-describedby="CNPJ" />
					</div>
					<div class="form-group mb-2">
						<form:label path="address">Address</form:label>
						<form:input type="text" name="address" class="form-control" path="address"
							aria-describedby="address" />
					</div>
					<div class="form-group mb-2">
						<form:label path="salary">Salary</form:label>
						<form:input type="number" name="salary" class="form-control" path="salary"
							aria-describedby="salary" />
					</div>
					<div class="form-group mb-2">
						<form:label path="admissionDate">Admission Date</form:label>
						<form:input type="date" name="admissionDate" class="form-control" path="admissionDate"
							aria-describedby="admissionDate" />
					</div>
					<div class="form-group mb-2">
						<form:label path="role.id">Role</form:label>
						<form:select name="role.id" class="form-control" path="role.id" aria-describedby="role.id">
							<c:forEach var="role" items="${roles}">
								<option value="${role.id}">${role.description}</option>
							</c:forEach>
						</form:select>
					</div>
				</div>
				<form:button type="submit" class="mt-2 btn btn-primary btn-lg">Submit Form</form:button>
			</form:form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
</body>

</html>