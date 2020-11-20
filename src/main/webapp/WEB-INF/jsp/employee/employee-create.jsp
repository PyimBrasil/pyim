<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<tags:_template>
	<div class="container-fluid">
		<h2 Class="mt-3 text-center">${name}Manager</h2>
		<div class="container ">
			<form:form method="POST" action="/employee/create/result" class="row d-flex justify-content-center">
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
							<c:forEach var="item" items="${roles}">
								<option value="${item.id}">${item.description}</option>
							</c:forEach>
						</form:select>
					</div>
				</div>
				<form:button type="submit" class="mt-2 btn btn-primary btn-lg">Submit Form</form:button>
			</form:form>
		</div>
	</div>
</tags:_template>