<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tags"%>

<tags:_template>
    <div class="mt-5 container d-flex justify-content-center align-items-center">
        <div class="alert alert-danger" role="alert">
            <h4 class="alert-heading">${nameResource} Bad Request</h4>
            <p>${error}</p>
            <hr>
            <div class="d-flex bd-highlight mb-3">
                <div class="mr-auto p-2 bd-highlight">
                    <p>Bad Request</p>
                </div>
                <div class="ml-3 p-2 bd-highlight">
                    <a type="button" class="btn btn-danger" href="${linkResource}">Return to ${returnName}</a>
                </div>
            </div>
        </div>
</tags:_template>