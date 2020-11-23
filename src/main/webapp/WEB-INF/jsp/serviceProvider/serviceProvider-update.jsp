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
                    <div class="d-flex justify-content-center align-content-center">
                        <form:form method="POST" action="/serviceProvider/edit/${id}/result"
                            class="row d-flex justify-content-center">
                            <div class="col-5">
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
                            <div class="col-4">
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
                                    <form:label path="profession">Profession</form:label>
                                    <form:input type="text" name="profession" class="form-control" path="profession"
                                        aria-describedby="profession" value="${profession}" />
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group mb-2">
                                    <form:label path="description">My Description</form:label>
                                    <form:textarea name="description" class="form-control" path="description"
                                        aria-describedby="description" rows="5" cols="50"
                                        aria-valuenow="${description}" />
                                </div>
                            </div>
                            <div class="d-flex mt-2">
                                <div>
                                    <form:button type="submit" class="btn btn-primary btn-lg">Submit Form</form:button>
                                </div>
                                <div class="ml-3">
                                    <a type="button" class="btn btn-secondary btn-lg" href="/serviceProvider/${id}">Return</a>
                                </div>
                            </div>
                        <form:input class="form-control" path="curriculumURI" type="hidden" value="${curriculumURI}"/>

                        </form:form>
                    </div>
                </c:when>
                <c:when test="${status == 'ACCEPTED'}">
                    <tags:_accepted>
                        <p>
                            Id:
                            <c:out value="${serviceProvider.id}" /><br>
                            Name:
                            <c:out value="${serviceProvider.name}" /><br>
                            Birth Date:
                            <fmt:formatDate value="${serviceProvider.birthdate}" type="date" pattern="dd/MM/yyyy"
                                var="birthdate" />
                            <c:out value="${birthdate}" /><br>
                            Phone:
                            <c:out value="${serviceProvider.phone}" /><br>
                            Email:
                            <c:out value="${serviceProvider.email}" /><br>
                            CPF:
                            <c:choose>
                                <c:when test="${serviceProvider.CPF != null}">
                                    <c:out value="${serviceProvider.CPF}" />
                                </c:when>
                                <c:when test="${serviceProvider.CPF == null}">
                                    Not listed
                                </c:when>
                                <c:otherwise>
                                    Not listed or unexpected error
                                </c:otherwise>
                            </c:choose>
                            <br>
                            CNPJ:<c:choose>
                                <c:when test="${serviceProvider.CNPJ != null}">
                                    <c:out value="${serviceProvider.CNPJ}" />
                                </c:when>
                                <c:when test="${serviceProvider.CNPJ == null}">
                                    Not listed
                                </c:when>
                                <c:otherwise>
                                    Not listed or unexpected error
                                </c:otherwise>
                            </c:choose>
                            <br>
                            Address:
                            <c:out value="${serviceProvider.address}" /><br>
                            Profession:
                            <c:out value="${serviceProvider.profession}" /><br>
                            Description:
                            <c:out value="${serviceProvider.description}" /><br>
                        </p>
                    </tags:_accepted>
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