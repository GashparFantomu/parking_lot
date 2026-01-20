package com.parking.parking_lot.servlets.users;

import com.parking.parking_lot.common.UserDto;
import com.parking.parking_lot.ejb.InvoiceBean;
import com.parking.parking_lot.ejb.UserBean;
import jakarta.annotation.security.DeclareRoles;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.*;

@DeclareRoles({"READ_USERS", "WRITE_USERS"})
@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"READ_USERS"}),
        httpMethodConstraints = {@HttpMethodConstraint(value = "POST", rolesAllowed = {"WRITE_USERS"})})

@WebServlet(name = "Users", value = "/Users")
public class Users extends HttpServlet {

    @Inject
    UserBean userBean;

    @Inject
    InvoiceBean invoiceBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("activePage", "Users");
        List<UserDto> users = userBean.findAllUsers();
        request.setAttribute("users", users);
        if(!invoiceBean.getUserIds().isEmpty()){
            Collection<String> usernames = userBean.findUsernamesByUserIds(invoiceBean.getUserIds());
            request.setAttribute("usernames", usernames);
        }
        request.getRequestDispatcher("/WEB-INF/pages/users/users.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!request.isUserInRole("WRITE_USERS")) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "You are not authorized to create invoices.");
            return;
        }
        String[] userIdsAsString = request.getParameterValues("userIds");
        if(userIdsAsString != null){
            List<Long> userIds = new ArrayList<>();
            for(String userIdAsString : userIdsAsString){
                userIds.add(Long.parseLong(userIdAsString));
            }
            invoiceBean.getUserIds().addAll(userIds);
        }
        response.sendRedirect(request.getContextPath()+"/Users");
    }
}