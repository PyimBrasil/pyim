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
						<h3 class="flex-grow-1 bd-highlight text-center">Welcome ${client.name}</h3>
						<button type="button" class="btn btn-info">
							Balance<span class="badge badge-light ml-1">${client.balanceAmount}</span>
						</button>
					</div>
					<div class="my-3 d-flex row justify-content-around">
						<div class="col-2">
							<div>
								<ul style="font-size: 17px;" class="list-group">
									<li class="list-group-item bg-primary">
										<a class="text-white" href="/client/${client.id}/service/create">Request
											service</a>
									</li>
									<li class="list-group-item">
										<a class="text-dark" href="/client/details/${client.id}">Details my
											account</a>
									</li>
									<li class="list-group-item">
										<a class="text-dark" href="/client/edit/${client.id}">Edit my
											account</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="col-10">
							<div class="container border table-responsive">
								<table class="m-0 table table-hover table-sm">
									<thead class="thead-dark">
										<tr class="row text-center text-white">
											<th scope="col" class="col-12">SERVICES</th>
										</tr>
										<tr class="row">
											<th scope="col" class="col-2">Service Provider</th>
											<th scope="col" class="col-5">Description</th>
											<th scope="col" class="col-2">Initial Date/Time</th>
											<th scope="col" class="col-2">Final Date/Time</th>
											<th scope="col" class="col-1">Actions</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${listServices}">
											<tr style="cursor: pointer;" class="row clickable-row" scope="row"
												data-href="/client/${client.id}/service/${item.id}/details">
												<td class="col-2">
													<p>
														<c:out value="${item.serviceProvider.name}" />
													</p>
												</td>
												<td class="col-5">
													<p>
														<c:out value="${item.description}" />
													</p>
												</td>
												<td class="col-2">
													<fmt:parseDate value="${item.initialDateTime}" type="date"
														pattern="yyyy-MM-dd HH:mm" var="parsedDate" />
													<fmt:formatDate value="${parsedDate}" type="date"
														pattern="dd/MM/yyyy HH:mm" var="stdDatum" />
													<p>
														<c:out value="${stdDatum}" />
													</p>
												</td>
												<td class="col-2">
													<fmt:parseDate value="${item.finalDateTime}" type="date"
														pattern="yyyy-MM-dd HH:mm" var="parsedDate" />
													<fmt:formatDate value="${parsedDate}" type="date"
														pattern="dd/MM/yyyy HH:mm" var="stdDatum" />
													<p>
														<c:out value="${stdDatum}" />
													</p>
												</td>
												<td class="col-1">
													<div class="flex-d">
														<a type="button" class="btn btn-outline-danger"
															href="/service/delete/?userId=${client.id}&serviceId=${item.id}">Delete</a>
													</div>
												</td>
										</c:forEach>
									</tbody>
								</table>
							</div>
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
	<script>
		jQuery(document).ready(function ($) {
			$(".clickable-row").click(function () {
				window.location = $(this).data("href");
			});
		});
	</script>
</tags:_template>