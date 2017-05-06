<%-- 
    Document   : menu
    Created on : Mar 31, 2017, 9:14:03 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>menu</title>
      
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        
        <div id="leftBar">
             <ul>
	<li><a href="index.jsp">Trang chủ</a></li>
	<li><a href="user.jsp">Người dùng</a></li><!--hệ thông-->
	<li><a href="product.jsp">Sản phẩm</a></li> <!--bán hàng-->
                 <li><a href="">Đơn hàng</a></li>   <!--bán hàng-->
                 <li><a href="statistical.jsp">Thống kê</a></li>   <!--hệ thống-->
             </ul>
         </div>
        
    </body>
</html>
