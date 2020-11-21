<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<tags:_template>
	<h4 Class="my-4 text-center">Employee ${status}</h4>
	<div class="container d-flex justify-content-around align-items-center">
		<div class="align-self-center">
			<c:choose>
				<c:when test="${status == 'ACCEPTED'}">
					<tags:_accepted>
						<p>
							Id:
							<c:out value="${employee.id}" /><br>
							Name:
							<c:out value="${employee.name}" /><br>
							Birth Date:
							<fmt:formatDate value="${employee.birthdate}" type="date" pattern="dd/MM/yyyy"
								var="birthdate" />
							<c:out value="${birthdate}" /><br>
							Phone:
							<c:out value="${employee.phone}" /><br>
							Email:
							<c:out value="${employee.email}" /><br>
							CPF:
							<c:choose>
								<c:when test="${employee.CPF != null}">
									<c:out value="${employee.CPF}" />
								</c:when>
								<c:when test="${employee.CPF == null}">
									Not listed
								</c:when>
								<c:otherwise>
									Not listed or unexpected error
								</c:otherwise>
							</c:choose>
							<br>
							CNPJ:<c:choose>
								<c:when test="${employee.CNPJ != null}">
									<c:out value="${employee.CNPJ}" />
								</c:when>
								<c:when test="${employee.CNPJ == null}">
									Not listed
								</c:when>
								<c:otherwise>
									Not listed or unexpected error
								</c:otherwise>
							</c:choose>
							<br>
							Address:
							<c:out value="${employee.address}" /><br>
							Role:
							<c:out value="${employee.role.description}" /><br>
							Admission Date:
							<fmt:formatDate value="${employee.admissionDate}" type="date" pattern="dd/MM/yyyy"
								var="admissionDate" />
							<c:out value="${admissionDate}" /><br>
							Resignation Date:
							<c:choose>
								<c:when test="${employee.resignationDate != null}">
									<fmt:formatDate value="${employee.resignationDate}" type="date" pattern="dd/MM/yyyy"
										var="resignationDate" />
									<c:out value="${resignationDate}" />
								</c:when>
								<c:when test="${employee.resignationDate == null}">
									Not listed
								</c:when>
								<c:otherwise>
									Not listed or unexpected error
								</c:otherwise>
							</c:choose><br>
							Salary:
							<c:out value="${employee.salary}" /><br>
						</p>
					</tags:_accepted>
				</c:when>
				<c:otherwise>
					<div class="d-flex justify-content-center">
						<div class="bg-danger border border-dark rounded p-4" style="max-width: 800px;">
							<p class="text-center text-wrap text-white">${status}</p>
							<p class="text-center text-wrap text-white">${error}</p>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</tags:_template>