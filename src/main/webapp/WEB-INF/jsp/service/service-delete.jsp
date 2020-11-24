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
                <c:when test="${status == 'OK'}">
                    <tags:_ok>
                        <p>
                            Id:
                            <c:out value="${service.id}" /><br>
                            Status:
                            <c:out value="${service.serviceStatus}" /><br>
                            Service Provider:
                            <c:out value="${service.serviceProvider}" /><br>
                            Initial Date/Time:
                            <fmt:formatDate value="${service.initialDateTime}" type="date" pattern="dd/MM/yyyy"
                                var="initialDateTime" />
                            <c:out value="${initialDateTime}" /><br>
                            Final Date/Time:
                            <fmt:formatDate value="${service.finalDateTime}" type="date" pattern="dd/MM/yyyy"
                                var="finalDateTime" />
                            <c:out value="${finalDateTime}" /><br>
                            Description:
                            <c:out value="${service.description}" /><br>
                        </p>
                    </tags:_ok>
                </c:when>
                <c:when test="${status == 'NO_CONTENT'}">
                    <tags:_noContent>
                    </tags:_noContent>
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