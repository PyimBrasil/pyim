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
                    <tags:_accepted>
                        <p>
                            Id:
                            <c:out value="${role.id}" /><br>
                            Description:
                            <c:out value="${role.description}" /><br>
                        </p>
                    </tags:_accepted>
                </c:when>
                <c:otherwise>
                    <div class="d-flex justify-content-center">
                        <form:form method="POST" action="/role/create/result" class="needs-validation"
                            novalidate="novalidate">
                            <div class="row">
                                <div class="form-group col">
                                    <form:label path="description">Description *</form:label>
                                    <form:textarea name="description" class="form-control" path="description"
                                        aria-describedby="description" rows="3" cols="30" required="required" />
                                    <form:errors path="description" />
                                </div>
                            </div>
                            <div class="d-flex mt-2">
                                <div>
                                    <form:button type="submit" class="btn btn-primary btn-lg">Submit Form
                                    </form:button>
                                </div>
                                <div class="ml-3">
                                    <a type="button" class="btn btn-secondary btn-lg" href="/role">Return</a>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict';
            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</tags:_template>