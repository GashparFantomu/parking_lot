<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="activePage" value="Users"/>
<t:pageTemplate pageTitle="Users">
    <br>
    <h1>Users</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Users">
        <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
            <a href="${pageContext.request.contextPath}/AddUser" class="btn btn-primary">Add User</a>
            <button class="btn btn-secondary btn-lg" type="submit">Invoice</button>
        </c:if>
        <div class="container">
            <c:forEach var="user" items="${users}">
                <div class="row border-bottom py-2 align-items-center">

                    <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
                        <div class="col-1">
                            <input type="checkbox" name="userIds" value="${user.id}" />
                        </div>
                    </c:if>

                    <div class="col">${user.username}</div>
                    <div class="col">${user.email}</div>

                    <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
                        <div class="col">
                            <a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/EditUser?id=${user.id}">Edit</a>
                        </div>
                    </c:if>

                </div>
            </c:forEach>
        </div>
    </form>
</t:pageTemplate>
