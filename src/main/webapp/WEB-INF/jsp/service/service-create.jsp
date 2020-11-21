<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<tags:_template>
    <h4 Class="my-4 text-center">Create Service</h4>
    <div class="container d-flex justify-content-around align-items-center">
        <div class="align-self-center">
            <c:choose>
                <c:when test="${status == 'OK'}">
                    <form:form class="row d-flex justify-content-center" method="POST" action="/service/create/result">
                        <div class="col">
                            <div class="form-group mb-2">
                                <form:label path="initialDateTime">Initial Date/Time</form:label>
                                <form:input type="datetime-local" name="initialDateTime" class="form-control"
                                    path="initialDateTime" aria-describedby="initialDateTime" />
                            </div>
                            <div class="form-group mb-2">
                                <form:label path="numberHoursOfService">Number hours of service</form:label>
                                <form:input type="number" name="numberHoursOfService" class="form-control"
                                    path="numberHoursOfService" aria-describedby="numberHoursOfService" />
                            </div>
                            <div class="form-group mb-2">
                                <form:label path="description">Description</form:label>
                                <form:textarea name="description" class="form-control" path="description"
                                    aria-describedby="description" rows="4" cols="30" />
                            </div>
                            <div class="d-flex mt-2 mt-2 ">
                                <div>
                                    <form:button type="submit" class="btn btn-primary">Submit Form</form:button>
                                </div>
                                <div class="ml-3">
                                    <a type="button" class="btn btn-secondary" href="/client/${clientId}">Return
                                    </a>
                                </div>
                            </div>
                        </div>
                        <form:input class="form-control" path="client" type="hidden" value="${client}"/>
                    </form:form>
                </c:when>
                <c:when test="${status == 'ACCEPTED'}">
                    <div class="d-flex justify-content-center">
                        <div class="bg-success border border-dark rounded p-4 text-white">
                            <p style="font-size: 20px; text-align: center; ">
                                Service data:
                            </p>
                            <p>
                                Description:
                                <c:out value="${service.description}" /><br>
                                Initial Date/Time:
                                <fmt:formatDate value="${client.initialDateTime}" type="date" pattern="dd/MM/yyyy HH:mm"
                                    var="initialDateTime" />
                                <c:out value="${initialDateTime}" /><br>
                                Number hours of service
                                <c:out value="${service.numberHoursOfService}" /><br>
                            </p>
                        </div>
                        <div>
                            <a type="button" class="btn btn-secondary btn-lg" href="/client/${service.client.id}">Return</a>
                        </div>
                    </div>
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