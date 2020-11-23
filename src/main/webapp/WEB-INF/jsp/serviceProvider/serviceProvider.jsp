<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<tags:_template>
    <div class="container-fluid">
        <c:choose>
            <c:when test="${status == 'OK'}">
                <div>
                    <div class="d-flex bd-highlight mt-4">
                        <h3 class="flex-grow-1 bd-highlight text-center">Welcome ${serviceProvider.name}</h3>
                        <button type="button" class="btn btn-warning">
                            AVAILABLE SERVICES<span class="badge badge-light ml-1">${availableServices}</span>
                        </button>
                    </div>
                    <div class="my-3 d-flex row justify-content-around">
                        <div class="col-2">
                            <div>
                                <ul style="font-size: 17px;" class="list-group">
                                    <li class="list-group-item bg-primary">
                                        <a class="text-white"
                                            href="/serviceProvider/details/${serviceProvider.id}">Details my
                                            account</a>
                                    </li>
                                    <li class="list-group-item">
                                        <a class="text-dark" href="/serviceProvider/edit/${serviceProvider.id}">Edit my
                                            account</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-10">
                            <c:if test="${listServicesSize == 0}">
                                <div class="container d-flex justify-content-center border">
                                        <a style="font-weight: 500;font-size: 20px;" href=""> You do not have services,
                                            search for available
                                            services?
                                        </a>
                                </div>
                            </c:if>
                            <c:if test="${listServicesSize != 0}">
                                <div class="container d-flex ">
                                    <div class="my-0 mx-1 table-responsive col-12 border">
                                        <table class="table table-hover table-sm">
                                            <thead class="thead-dark">
                                                <tr class="row text-center text-white">
                                                    <th scope="col" class="col-12">MY SERVICES</th>
                                                </tr>
                                                <tr class="row">
                                                    <th scope="col" class="col-6">Description</th>
                                                    <th scope="col" class="col-3">Initial Date/Time</th>
                                                    <th scope="col" class="col-3">Final Date/Time</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="item" items="${listServices}">
                                                    <tr class="row" scope="row">
                                                        <td class="col-6">
                                                            <p>
                                                                <c:out value="${item.description}" />
                                                            </p>
                                                        </td>
                                                        <td class="col-3">
                                                            <fmt:parseDate value="${item.initialDateTime}" type="date"
                                                                pattern="yyyy-MM-dd HH:mm" var="parsedDate" />
                                                            <fmt:formatDate value="${parsedDate}" type="date"
                                                                pattern="dd/MM/yyyy HH:mm" var="stdDatum" />
                                                            <p>
                                                                <c:out value="${stdDatum}" />
                                                            </p>
                                                        </td>
                                                        <td class="col-3">
                                                            <fmt:parseDate value="${item.finalDateTime}" type="date"
                                                                pattern="yyyy-MM-dd HH:mm" var="parsedDate" />
                                                            <fmt:formatDate value="${parsedDate}" type="date"
                                                                pattern="dd/MM/yyyy HH:mm" var="stdDatum" />
                                                            <p>
                                                                <c:out value="${stdDatum}" />
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="d-flex justify-content-center m-5">
                    <div class="bg-danger border border-dark rounded p-4">
                        <p style="font-size:25px;" class=" text-center text-wrap text-white">${status}</p>
                    </div>
                    <div class="ml-2">
                        <a type="button" class="btn btn-secondary btn-lg" href="/">Return to Home</a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</tags:_template>