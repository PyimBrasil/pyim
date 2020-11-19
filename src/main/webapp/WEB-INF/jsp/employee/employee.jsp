<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<tags:_template>
	<h2 Class="mt-4 text-center">${name}Manager</h2>
	<div class="container">
		<div class="d-flex d-flex justify-content-between">
			<h5>List of all employees</h5>
			<div>
				<a type="button" class="btn btn-outline-info mr-1" href="/reports">Reports</a>
				<a type="button" class="btn btn-outline-primary" href="/employee/create">Create employee</a>
			</div>
		</div>
		<table class="table table-striped table-hover table-borderless mt-3">
			<thead class="thead-dark">
				<tr class="row">
					<th scope="col" class="col-2">Name</th>
					<th scope="col" class="col-2">Birth Date</th>
					<th scope="col" class="col-2">Phone</th>
					<th scope="col" class="col-2">Email</th>
					<th scope="col" class="col-2">Role</th>
					<th scope="col" class="col-2">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="employee" items="${listAllEmployee}">
					<tr class="row" scope="row">
						<td class="col-2">
							<p>
								<c:out value="${employee.name}" />
							</p>
						</td>
						<td class="col-2">
							<fmt:parseDate value="${employee.birthdate}" type="date" pattern="yyyy-MM-dd"
								var="parsedDate" />
							<fmt:formatDate value="${parsedDate}" type="date" pattern="dd/MM/yyyy" var="stdDatum" />
							<p>
								<c:out value="${stdDatum}" />
							</p>
						</td>
						<td class="col-2">
							<p>
								<c:out value="${employee.phone}" />
							</p>
						</td>
						<td class="col-2">
							<p>
								<c:out value="${employee.email}" />
							</p>
						</td>
						<td class="col-2">
							<p>
								<c:out value="${employee.role.description}" />
							</p>
						</td>
						<td class="col-2">
							<div class="flex-d">
								<a type="button" class="btn btn-outline-warning"
									href="/employee/edit/${employee.id}">Edit</a> <a type="button"
									class="btn btn-outline-danger" href="/employee/delete/${employee.id}">Delete</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</tags:_template>