<%-- 
    Document   : 404
    Created on : Mar 16, 2017, 4:31:24 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><% out.print(request.getParameter("error"));%></h1> 
    </body>
</html>
