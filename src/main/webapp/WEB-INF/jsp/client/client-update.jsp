<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<tags:_template>
    <h4 Class="my-4 text-center">Edit Client</h4>
    <div class="container d-flex justify-content-around align-items-center">
        <div class="align-self-center">
            <c:choose>
                <c:when test="${status == 'OK'}">
                    <div class="d-flex justify-content-center">
                        <form:form method="POST" action="/client/edit/${id}/result"
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
                            </div>
                            <div class="col-6">
                                <div class="form-group mb-2">
                                    <form:label path="CPF">CPF</form:label>
                                    <form:input type="text" name="CPF" class="form-control" path="CPF"
                                        aria-describedby="CPF" value="${CPF}" />
                                </div>
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
                                    <form:label path="balanceAmount">Balance Amount</form:label>
                                    <form:input type="number" name="balanceAmount" class="form-control"
                                        path="balanceAmount" aria-describedby="balanceAmount"
                                        value="${balanceAmount}" />
                                </div>
                            </div>
                            <div class="d-flex mt-2">
                                <div>
                                    <form:button type="submit" class="btn btn-primary btn-lg">Submit Form
                                    </form:button>
                                </div>
                                <div class="ml-3">
                                    <a type="button" class="btn btn-secondary btn-lg" href="/client/${id}">Return</a>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </c:when>
                <c:when test="${status == 'ACCEPTED'}">
                    <div class="d-flex justify-content-center">
                        <div class="bg-success border border-dark rounded p-4 text-white">
                            <p style="font-size: 20px; text-align: center; ">
                                Client data:
                            </p>
                            <p>
                                Id:
                                <c:out value="${client.id}" /><br>
                                Name:
                                <c:out value="${client.name}" /><br>
                                Birth Date:
                                <fmt:formatDate value="${client.birthdate}" type="date" pattern="dd/MM/yyyy"
                                    var="birthdate" />
                                <c:out value="${birthdate}" /><br>
                                Phone:
                                <c:out value="${client.phone}" /><br>
                                Email:
                                <c:out value="${client.email}" /><br>
                                CPF:
                                <c:choose>
                                    <c:when test="${client.CPF != null}">
                                        <c:out value="${client.CPF}" />
                                    </c:when>
                                    <c:when test="${client.CPF == null}">
                                        Not listed
                                    </c:when>
                                    <c:otherwise>
                                        Not listed or unexpected error
                                    </c:otherwise>
                                </c:choose>
                                <br>
                                CNPJ:<c:choose>
                                    <c:when test="${client.CNPJ != null}">
                                        <c:out value="${client.CNPJ}" />
                                    </c:when>
                                    <c:when test="${client.CNPJ == null}">
                                        Not listed
                                    </c:when>
                                    <c:otherwise>
                                        Not listed or unexpected error
                                    </c:otherwise>
                                </c:choose>
                                <br>
                                Address:
                                <c:out value="${client.address}" /><br>
                                Balance Amount:
                                <c:out value="${client.balanceAmount}" /><br>
                            </p>
                        </div>
                        <div>
                            <a type="button" class="btn btn-secondary btn-lg" href="/client/${client.id}">Return</a>
                        </div>
                    </div>
                </c:when>
                <c:when test="${status == 'BAD_REQUEST'}">
                    <div class="d-flex justify-content-center">
                        <div class="bg-danger border border-dark rounded p-4" style="max-width: 800px;">
                            <p class="text-center text-wrap text-white">${status}</p>
                            <p class="text-center text-wrap text-white">${error}</p>
                        </div>
                        <div class="ml-2">
                            <a type="button" class="btn btn-secondary btn-lg" href="/client/${client.id}">Return to
                                Home</a>
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


    </div>
</tags:_template>