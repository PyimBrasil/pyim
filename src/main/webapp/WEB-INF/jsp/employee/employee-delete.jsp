<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<tags:_template>
    <h4 Class="my-4 text-center">Delete Employee</h4>
    <div class="container d-flex justify-content-around align-items-center">
        <div class="align-self-center">
            <c:choose>
                <c:when test="${status == 'ACCEPTED'}">
                    <div class="d-flex justify-content-center">
                        <div class="bg-info border border-dark rounded p-4 text-white">
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
                                Salary:
                                <c:out value="${employee.salary}" /><br>
                            </p>
                        </div>
                        <div class="ml-5 align-self-center">
                            <a type="button" data-method="delete" class="btn btn-danger btn-lg"
                                href="/employee/delete/${employee.id}/result">Delete</a>
                        </div>
                    </div>
                </c:when>
                <c:when test="${status == 'NO_CONTENT'}">
                    <div class="d-flex justify-content-center">
                        <div class="bg-success border border-dark rounded p-4" style="max-width: 800px;">
                            <p class="text-center text-wrap text-white">DELETE SUCCESS</p>
                        </div>
                    </div>
                </c:when>
                <c:when test="${status == 'BAD_REQUEST'}">
                    <div class="d-flex justify-content-center">
                        <div class="bg-danger border border-dark rounded p-4" style="max-width: 800px;">
                            <p class="text-center text-wrap text-white">${status} - delete success</p>
                            <p class="text-center text-wrap text-white">${error}</p>

                        </div>
                    </div>
                </c:when>
                <c:when test="${status == 'NOT_FOUND'}">
                    <div class="d-flex justify-content-center">
                        <div class="bg-danger border border-dark rounded p-4" style="max-width: 800px;">
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