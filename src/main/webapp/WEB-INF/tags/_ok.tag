<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<div class="d-flex justify-content-center">
    <div class="alert alert-info" role="alert" style="min-width: 500px;">
        <h4 class="alert-heading">${nameResource} data:</h4>
        <jsp:doBody />
        <hr>
        <div class="d-flex bd-highlight mb-3">
            <div class="mr-auto p-2 bd-highlight">
                <p>Ok</p>
            </div>
            <div class="ml-3 p-2 bd-highlight">
                <a type="button" class="btn btn-primary" href="${linkReturn}">Return to ${nameResource}</a>
            </div>
            <div class="p-2 bd-highlight">
                <a type="button" class="btn btn-danger" href="${linkResource}">${returnName} ${nameResource}</a>
            </div>
        </div>
    </div>
</div>