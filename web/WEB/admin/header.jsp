<%-- 
    Document   : header
    Created on : Mar 31, 2017, 8:58:14 AM
    Author     : DELL
--%>

<%@page import="model.Employees"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/mycss.css">
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <style>
            #title{font-family: "Brush Script MT"; border: 0 ;margin-bottom: auto ;  padding: auto ; text-align: left; ;  color: darkgrey; font-weight: bold; font-size: 30pt;
           text-shadow: 1px 1px 0 bisque , 2px 2px 0 firebrick , 3px 3px 0 firebrick, 4px 4px 0 firebrick , 5px 5px 0 firebrick , 6px 6px 0 firebrick, 0 -2px firebrick ,-2px 0 bisque, 2px 0 firebrick, 0 3px firebrick
           }  
        </style>
    </head>
    <body>
        <%
            Employees employee = (Employees) session.getAttribute("Employee");
            if(employee==null){
                response.sendRedirect("ad_login.jsp");
                return;
            }else{
        %>
       <div id="header">
	<div class="inHeader">
		<div class="mosAdmin">
		Xin chào, <%=employee.getName()%> (<%=employee.getRole()%>)<br> 
		<a href="index.jsp">trang chủ</a> | <a href="ad_login.jsp">Đăng nhập</a> | <a href="<%=request.getContextPath()%>/EmployeeLogout">Đăng xuất</a>
		</div>
	<div class="clear"></div> 
	</div>
        </div>
        <%}%>
    </body>
</html>
