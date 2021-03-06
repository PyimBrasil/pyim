<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<div class="d-flex justify-content-center">
    <div class="alert alert-success" role="alert" style="min-width: 500px;">
        <h4 class="alert-heading">${nameResource} data:</h4>
        <jsp:doBody />
        <hr>
        <div class="d-flex bd-highlight mb-3">
            <div class="mr-auto p-2 bd-highlight">
                <p>Accepted</p>
            </div>
            <div class="ml-3 p-2 bd-highlight">
                <a type="button" class="btn btn-success" href="${linkResource}">Return to ${returnName}</a>
            </div>
        </div>
    </div>
</div>