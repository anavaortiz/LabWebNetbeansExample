<%-- 
    Document   : logout.jsp
    Created on : Mar 21, 2021, 7:29:02 PM
    Author     : manny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log out</title>
    </head>
    <body>
        <%
            HttpSession Session = request.getSession();
            Session.invalidate();
            response.sendRedirect("login.jsp");
            %>
    </body>
</html>
