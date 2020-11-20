<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<tags:_template>
    <h2 Class="mt-4 text-center">Role Manager</h2>
    <div class="container">
        <div class="d-flex d-flex justify-content-between">
            <h5>List of all roles</h5>
            <div>
                <a type="button" class="btn btn-primary" href="/role/create">Create Role</a>
            </div>
        </div>
        <div class="d-flex justify-content-center">
            <table class="table table-striped table-border mt-3 col-4">
                <thead class="thead-dark">
                    <tr class="row">
                        <th class="col-6" scope="col">Role</th>
                        <th class="col-6" scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="role" items="${listAllRole}">
                        <tr class="row" scope="row">
                            <td class="col-6">
                                <p>
                                    <c:out value="${role.description}" />
                                </p>
                            </td>
                            <td class="col-6">
                                <div class="flex-d">
                                    <a type="button" class="btn btn-outline-warning"
                                        href="/role/edit/${role.id}">Edit</a> <a type="button"
                                        class="btn btn-outline-danger" href="/role/delete/${role.id}">Delete</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</tags:_template>