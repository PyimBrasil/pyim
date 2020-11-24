<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<tags:_template>

    <h4 Class="my-4 text-center">Service</h4>
    <div class="container border">
        <div class="row">
            <div id="status" class="d-flex border col justify-content-center">
                <p id="statusServiceString" class="text-to-description-title">${service.serviceStatus}</p>
            </div>
        </div>
        <div class="row">
            <div class="d-flex border col">
                <p class="text-to-description-title">Service Provider:</p>
                <p class="text-to-description">${service.serviceProvider.name}</p>
            </div>
            <div class="d-flex border col">
                <p class="text-to-description-title">Client:</p>
                <p class="text-to-description">${service.client.name}</p>
            </div>
        </div>
        <div class="row">
            <div class="d-flex border col">
                <p class="text-to-description-title">Initial Date/Time:</p>
                <fmt:parseDate value="${service.initialDateTime}" type="date" pattern="yyyy-MM-dd HH:mm"
                    var="parsedDate" />
                <fmt:formatDate value="${parsedDate}" type="date" pattern="dd/MM/yyyy HH:mm" var="initial" />
                <p class="text-to-description">${initial}</p>
            </div>
            <div class="d-flex border col">
                <p class="text-to-description-title">Final Date/Time:</p>
                <fmt:parseDate value="${service.finalDateTime}" type="date" pattern="yyyy-MM-dd HH:mm"
                    var="parsedDate" />
                <fmt:formatDate value="${parsedDate}" type="date" pattern="dd/MM/yyyy HH:mm" var="final" />
                <p class="text-to-description">${final}</p>
            </div>
        </div>
        <div class="row">
            <div class="d-flex border col">
                <p class="text-to-description-title">Description:</p>
                <p class="text-to-description">${service.description}</p>
            </div>
        </div>
    </div>
    <div class="d-flex justify-content-center mt-2 ">
        <button id="return" type="button" class="btn btn-primary">Return</button>
    </div>
    <script>
        $(document).ready(function () {
            statusServiceString = document.getElementById("statusServiceString").innerText;
            if (statusServiceString === 'PENDING') {
                $(document.getElementById('status')).addClass("bg-warning");
            } else if (statusServiceString === 'COMPLETE') {
                $(document.getElementById('status')).addClass("bg-success");
            } else if (statusServiceString === 'CANCELED') {
                $(document.getElementById('status')).addClass("bg-danger");
            } else if (statusServiceString === 'IN_PROGRESS') {
                $(document.getElementById('status')).addClass("bg-info");
            }
        });

        $("#return").click(function () {
            window.history.back();
        });

    </script>
</tags:_template>