<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Add Car">
    <br>
    <h1>Add Car</h1>

    <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/AddCar">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="licensePlate">License Plate</label>
                <input type="text" class="form-control" id="licensePlate" name="licensePlate" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Licence Plate is required. sorry :/
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="parkingSpot">Parking Spot</label>
                <input type="text" class="form-control" id="parkingSpot" name="parkingSpot" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Parking Spot is required. don't be a bmw user
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="owner_id">Owner</label>
                <select class="form-select" id="userId" name="userId" required>
                    <option value="">Choose...</option>
                    <c:forEach var="user" items="${users}" varStatus="status">
                        <option value="${user.id}">${user.username}</option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">
                    Owner is required, the car won't drive itself
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </div>
    </form>

</t:pageTemplate>