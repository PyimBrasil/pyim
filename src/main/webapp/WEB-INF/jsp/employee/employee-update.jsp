<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<tags:_template>
    <h4 Class="my-4 text-center">Edit Employee</h4>
    <div class="container d-flex justify-content-around align-items-center">
        <div class="align-self-center">
            <c:choose>
                <c:when test="${status == 'OK'}">
                    <div class="d-flex justify-content-center">
                        <form:form method="POST" action="/employee/edit/${id}/result"
                            class="row d-flex justify-content-center">
                            <div class="col-6">
                                <div class="form-group mb-2">
                                    <form:label path="name">Name</form:label>
                                    <form:input type="text" name="name" class="form-control" path="name"
                                        aria-describedby="name" value="${name}" />
                                </div>
                                <div class="form-group mb-2">
                                    <form:label path="email">Email address</form:label>
                                    <form:input type="email" name="email" class="form-control" path="email"
                                        aria-describedby="email" value="${email}" />
                                </div>
                                <div class="form-group mb-2">
                                    <form:label path="birthdate">Birth Date</form:label>
                                    <form:input type="date" name="birthdate" class="form-control" path="birthdate"
                                        aria-describedby="birthdate" value="${birthdate}" />
                                </div>
                                <div class="form-group mb-2">
                                    <form:label path="phone">Phone</form:label>
                                    <form:input type="text" name="phone" class="form-control" path="phone"
                                        aria-describedby="phone" value="${phone}" />
                                </div>
                                <div class="form-group mb-2">
                                    <form:label path="CPF">CPF</form:label>
                                    <form:input type="text" name="CPF" class="form-control" path="CPF"
                                        aria-describedby="CPF" value="${CPF}" />
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group mb-2">
                                    <form:label path="CNPJ">CNPJ</form:label>
                                    <form:input type="text" name="CNPJ" class="form-control" path="CNPJ"
                                        aria-describedby="CNPJ" value="${CNPJ}" />
                                </div>
                                <div class="form-group mb-2">
                                    <form:label path="address">Address</form:label>
                                    <form:input type="text" name="address" class="form-control" path="address"
                                        aria-describedby="address" value="${address}" />
                                </div>
                                <div class="form-group mb-2">
                                    <form:label path="salary">Salary</form:label>
                                    <form:input type="number" name="salary" class="form-control" path="salary"
                                        aria-describedby="salary" value="${salary}" />
                                </div>
                                <div class="row">
                                    <div class="form-group mb-2 col-6">
                                        <form:label path="admissionDate">Admisssion Date</form:label>
                                        <form:input type="date" name="admissionDate" class="form-control"
                                            path="admissionDate" aria-describedby="admissionDate"
                                            value="${admissionDate}" />
                                    </div>
                                    <div class="form-group mb-2 col-6">
                                        <form:label path="resignationDate">Resignation Date</form:label>
                                        <form:input type="date" name="resignationDate" class="form-control"
                                            path="resignationDate" aria-describedby="resignationDate"
                                            value="${resignationDate}" />
                                    </div>
                                </div>
                                <div class="form-group mb-2">
                                    <form:label path="role.id">Role</form:label>
                                    <form:select name="role.id" class="form-control" path="role.id"
                                        aria-describedby="role.id">
                                        <c:forEach var="item" items="${roles}">
                                            <c:choose>
                                                <c:when test="${role.id != item.id }">
                                                    <option value="${item.id}">${item.description}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${item.id}" selected>${item.description}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>
                            <form:button type="submit" class="mt-2 btn btn-primary btn-lg">Submit Form</form:button>
                        </form:form>
                    </div>
                </c:when>
                <c:when test="${status == 'ACCEPTED'}">
                    <div class="d-flex justify-content-center">
                        <div class="bg-success border border-dark rounded p-4 text-white">
                            <p style="font-size: 20px; text-align: center; ">
                                Employee data:
                            </p>
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
                                        <fmt:formatDate value="${employee.resignationDate}" type="date"
                                            pattern="dd/MM/yyyy" var="resignationDate" />
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
                        </div>
                    </div>
                </c:when>
                <c:when test="${status == 'BAD_REQUEST'}">
                    <div class="d-flex justify-content-center">
                        <div class="bg-danger border border-dark rounded p-4" style="max-width: 800px;">
                            <p class="text-center text-wrap text-white">${status}</p>
                            <p class="text-center text-wrap text-white">${error}</p>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="d-flex justify-content-center">
                        <div class="bg-danger border border-dark rounded p-4" style="max-width: 800px;">
                            <p class="text-center text-wrap text-white">${status}</p>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="align-self-center">
            <a type="button" class="btn btn-primary btn-lg" href="/employee/">Return to Employee</a>
        </div>
    </div>
</tags:_template>