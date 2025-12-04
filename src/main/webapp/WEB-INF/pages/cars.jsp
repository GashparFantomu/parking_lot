<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate pageTitle="Cars">
    <p>     </p>
    <h1>Welcome to the Cars page</h1>
    <p>with even more taxes for those who use Jakarta EE and glassfish</p>
    <div class="container text-center">
        <div class="row">
            <div class="col">
                Column
            </div>
            <div class="col">
                Column
            </div>
            <div class="col">
                Column
            </div>
        </div>
    </div>
    <h5>Free parking spots: ${numberOfFreeParkingSpots}</h5>
    <p>if you see 0, that means you're using Jakarta EE, tough luck man</p>
</t:pageTemplate>