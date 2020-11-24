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
                    var="parsedDateFinal" />
                <fmt:formatDate value="${parsedDateFinal}" type="date" pattern="dd/MM/yyyy HH:mm" var="final" />
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

        <c:choose>
            <c:when test="${clientId != null}">
                <a type="button" class="btn btn-secondary" href="/client/${clientId}">Return</a>
                <c:if test="${makeCancel == true}">
                    <button type="button" class="btn btn-danger ml-3" data-toggle="modal" data-target="#CancelContract">
                        Cancel
                    </button>
                </c:if>
            </c:when>
            <c:when test="${makeContract == true}">
                <a type="button" class="btn btn-secondary" href="/serviceProvider/${serviceProviderId}">Return</a>
                <button type="button" class="btn btn-primary ml-3" data-toggle="modal" data-target="#MakeContract">
                    Make Contract
                </button>
            </c:when>
            <c:when test="${cancelContractPermission == true}">
                <a href="/serviceProvider/${serviceProviderId}" type="button" class="btn btn-secondary">Return</a>
                <button type="button" class="btn btn-danger ml-3" data-toggle="modal" data-target="#CancelContract">
                    Cancel Contract
                </button>
            </c:when>

            <c:otherwise>
            </c:otherwise>
        </c:choose>
    </div>
    <!-- Scrollable modal -->
    <div class="modal-dialog modal-dialog-scrollable">
        <!-- Modal -->
        <div class="modal fade" id="MakeContract" data-backdrop="static" data-keyboard="false" tabindex="-1"
            aria-labelledby="MakeContractLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="MakeContractLabel">Contract</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac nibh lacus. Nunc lacinia
                            elit
                            in pellentesque lacinia. Nunc vel ipsum id lacus tristique pretium. Vivamus dolor nibh,
                            sodales
                            vel imperdiet imperdiet, vulputate sit amet ex. Quisque porta imperdiet augue vel
                            vestibulum.
                            Etiam pulvinar sodales lacus ut auctor. Suspendisse eget enim a nibh ornare fermentum.
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac nibh lacus. Nunc lacinia
                            elit
                            in pellentesque lacinia. Nunc vel ipsum id lacus tristique pretium. Vivamus dolor nibh,
                            sodales
                            vel imperdiet imperdiet, vulputate sit amet ex. Quisque porta imperdiet augue vel
                            vestibulum.
                            Etiam pulvinar sodales lacus ut auctor. Suspendisse eget enim a nibh ornare fermentum.
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac nibh lacus. Nunc lacinia
                            elit
                            in pellentesque lacinia. Nunc vel ipsum id lacus tristique pretium. Vivamus dolor nibh,
                            sodales
                            vel imperdiet imperdiet, vulputate sit amet ex. Quisque porta imperdiet augue vel
                            vestibulum.
                            Etiam pulvinar sodales lacus ut auctor. Suspendisse eget enim a nibh ornare fermentum.
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac nibh lacus. Nunc lacinia
                            elit
                            in pellentesque lacinia. Nunc vel ipsum id lacus tristique pretium. Vivamus dolor nibh,
                            sodales
                            vel imperdiet imperdiet, vulputate sit amet ex. Quisque porta imperdiet augue vel
                            vestibulum.
                            Etiam pulvinar sodales lacus ut auctor. Suspendisse eget enim a nibh ornare fermentum.
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac nibh lacus. Nunc lacinia
                            elit
                            in pellentesque lacinia. Nunc vel ipsum id lacus tristique pretium. Vivamus dolor nibh,
                            sodales
                            vel imperdiet imperdiet, vulputate sit amet ex. Quisque porta imperdiet augue vel
                            vestibulum.
                            Etiam pulvinar sodales lacus ut auctor. Suspendisse eget enim a nibh ornare fermentum.
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac nibh lacus. Nunc lacinia
                            elit
                            in pellentesque lacinia. Nunc vel ipsum id lacus tristique pretium. Vivamus dolor nibh,
                            sodales
                            vel imperdiet imperdiet, vulputate sit amet ex. Quisque porta imperdiet augue vel
                            vestibulum.
                            Etiam pulvinar sodales lacus ut auctor. Suspendisse eget enim a nibh ornare fermentum.
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac nibh lacus. Nunc lacinia
                            elit
                            in pellentesque lacinia. Nunc vel ipsum id lacus tristique pretium. Vivamus dolor nibh,
                            sodales
                            vel imperdiet imperdiet, vulputate sit amet ex. Quisque porta imperdiet augue vel
                            vestibulum.
                            Etiam pulvinar sodales lacus ut auctor. Suspendisse eget enim a nibh ornare fermentum.
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac nibh lacus. Nunc lacinia
                            elit
                            in pellentesque lacinia. Nunc vel ipsum id lacus tristique pretium. Vivamus dolor nibh,
                            sodales
                            vel imperdiet imperdiet, vulputate sit amet ex. Quisque porta imperdiet augue vel
                            vestibulum.
                            Etiam pulvinar sodales lacus ut auctor. Suspendisse eget enim a nibh ornare fermentum.
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac nibh lacus. Nunc lacinia
                            elit
                            in pellentesque lacinia. Nunc vel ipsum id lacus tristique pretium. Vivamus dolor nibh,
                            sodales
                            vel imperdiet imperdiet, vulputate sit amet ex. Quisque porta imperdiet augue vel
                            vestibulum.
                            Etiam pulvinar sodales lacus ut auctor. Suspendisse eget enim a nibh ornare fermentum.
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac nibh lacus. Nunc lacinia
                            elit
                            in pellentesque lacinia. Nunc vel ipsum id lacus tristique pretium. Vivamus dolor nibh,
                            sodales
                            vel imperdiet imperdiet, vulputate sit amet ex. Quisque porta imperdiet augue vel
                            vestibulum.
                            Etiam pulvinar sodales lacus ut auctor. Suspendisse eget enim a nibh ornare fermentum.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <a type="button" class="btn btn-primary"
                            href="/service/makeContract?serviceId=${service.id}&serviceProviderId=${serviceProviderId}">Make
                            Contract</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="CancelContract" data-backdrop="static" data-keyboard="false" tabindex="-1"
        aria-labelledby="CancelContractLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="CancelContractLabel">Contract</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Confirm CANCEL contract?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a type="button" class="btn btn-danger" href="${linkToCancel}">CANCEL</a>
                </div>
            </div>
        </div>
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
            else if (statusServiceString === 'ALLOCATED') {
                $(document.getElementById('status')).addClass("bg-primary");
            }
        });

        $("#return").click(function () {
            window.history.back();
        });

    </script>
</tags:_template>