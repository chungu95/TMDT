<%-- 
    Document   : index
    Created on : Mar 31, 2017, 8:58:35 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index</title>        
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
       <link rel="stylesheet" type="text/css" href="admincss/mos-style.css"> 
       
    </head>
    <body>
        <%@include file="header.jsp" %>  
        <%--<jsp:include page="header.jsp"></jsp:include>--%>
        
        <div id="wrapper">
        <jsp:include page="menu.jsp"></jsp:include>       
        <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
