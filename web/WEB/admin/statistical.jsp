<%-- 
    Document   : statistical
    Created on : Apr 23, 2017, 11:06:45 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thống kê</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css"> 
        
        <!--<c:set var="root" value="${pageContext.request.contextPath}"/>-->
        
        <%@include file="header.jsp" %>  
    </head>
    <body>
         <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>THỐNG KÊ</h3>

                    <div class="shortcutHome">
                        <a href="<%=request.getContextPath()%>/ChartProduce"><img src="admincss/img/halaman.png"><br>Thống kê sản phẩm theo NXS</a>
                    </div>
                     
                    <div class="shortcutHome">
                        <a href="<%=request.getContextPath()%>/ChartEmployee"><img src="admincss/img/bukutamu.png"><br>Thống kê số hóa đơn của NV</a>
                    </div>
                </div>
                <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
