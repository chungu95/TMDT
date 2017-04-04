<%-- 
    Document   : product
    Created on : Mar 31, 2017, 10:32:13 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css"> 
        <%@include file="header.jsp" %>  
    </head>
    <body>

            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>QUẢN LÝ SẢN PHẨM</h3>

                    <div class="shortcutHome">
                        <a href="allProduct.jsp"><img src="admincss/img/posting.png"><br>Xem sản phẩm</a>
                    </div>
                    <div class="shortcutHome">
                        <a href="insertProduct.jsp"><img src="admincss/img/photo.png" ><br>Thêm sản phẩm</a>
                    </div>
                    <div class="shortcutHome">
                        <a href=""><img src="admincss/img/addProduce.png" style="width: 70%;"><br>Thêm nhà sản xuất</a>
                    </div>  
                </div>
                <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
