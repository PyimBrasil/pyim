<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<tags:_template>
    <h4 Class="my-4 text-center">Role Manager </h4>
    <div class="container d-flex justify-content-around align-items-center">
        <div class="align-self-center">
            <c:choose>
                <c:when test="${status == 'ACCEPTED'}">
                    <div class="d-flex justify-content-center">
                        <div class="bg-success border border-dark rounded p-4 text-white">
                            <p style="font-size: 20px; text-align: center; ">
                                Role data:
                            </p>
                            <p>
                                Id:
                                <c:out value="${role.id}" /><br>
                                Description:
                                <c:out value="${role.description}" /><br>
                            </p>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="d-flex justify-content-center">
                        <form:form method="POST" action="/role/create/result">
                            <div class="row">
                                <div class="form-group col">
                                    <form:label path="description">Description</form:label>
                                    <form:textarea name="description" class="form-control" path="description"
                                        aria-describedby="description" rows="4" cols="30" />
                                </div>
                            </div>
                            <form:button type="submit" class="mt-2 btn btn-primary">Submit Form</form:button>
                        </form:form>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="align-self-center">
            <a type="button" class="btn btn-secondary btn-lg" href="/role">Return to Role</a>
        </div>
    </div>
</tags:_template>