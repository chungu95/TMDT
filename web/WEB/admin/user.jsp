<%-- 
    Document   : user
    Created on : Apr 3, 2017, 9:46:14 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Người dùng</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css"> 
    </head>
    <body>
         <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>QUẢN LÝ NGƯỜI DÙNG</h3>

                    <div class="shortcutHome">
                        <a href="customer.jsp"><img src="admincss/img/halaman.png"><br>Xem danh sách khách hàng</a>
                    </div>
                    <div class="shortcutHome">
                        <a href="employee.jsp"><img src="admincss/img/list.png" style="width: 70%;"><br>Xem danh sách nhân viên</a>
                    </div>
                    <div class="shortcutHome">
                        <a href=""><img src="admincss/img/AddUser.png" style="width: 70%;"><br>Thêm tài khoản khách hàng</a>
                    </div>  
                    <div class="shortcutHome">
                        <a href=""><img src="admincss/img/addemployee.png" style="width: 70%;"><br>Thêm tài khoản nhân viên</a>
                    </div>
                </div>
                <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
