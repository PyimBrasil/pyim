<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<tags:_template>
    <h2 Class="mt-4">${name} Manager</h2>
    <div class="flex-d">
        <a type="button" class="btn btn-outline-dark btn-lg" href="/employee/create">Create</a>
        <a type="button" class="btn btn-outline-dark btn-lg" href="/employee/delete">Delete</a>
        <a type="button" class="btn btn-outline-dark btn-lg" href="/employee/edit">Edit</a>
        <table class=" col-6 table table-striped mt-4">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Birth Date</th>
                    <th scope="col">Phone</th>
                    <th scope="col">CPF</th>
                    <th scope="col">CNPJ</th>
                    <th scope="col">Email</th>
                    <th scope="col">Adress</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="list" items="${listAllEmployee}">
                    <tr>
                        <td>
                            <c:out value="${list.name}" />
                        </td>
                        <td>
                            <c:out value="${list.birthdate}" />
                        </td>
                        <td>
                            <c:out value="${list.phone}" />
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${list.CPF != null}">
                                    <c:out value="${list.CPF}" />
                                </c:when>
                                <c:when test="${list.CPF == null}">
                                    Not listed
                                </c:when>
                                <c:otherwise>
                                    Not listed or unexpected error
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${list.CNPJ != null}">
                                    <c:out value="${list.CNPJ}" />
                                </c:when>
                                <c:when test="${list.CNPJ == null}">
                                    Not listed
                                </c:when>
                                <c:otherwise>
                                    Not listed or unexpected error
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:out value="${list.email}" />
                        </td>
                        <td>
                            <c:out value="${list.endereco}" />
                        </td>
                        <!-- <td><a href="Servlet?action=deletar&id">Deletar</a></td> -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </div>
</tags:_template>