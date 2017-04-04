<%-- 
    Document   : employee
    Created on : Apr 3, 2017, 10:10:03 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nhân viên</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css">
        <%@include file="header.jsp" %>  
    </head>
    <body>
        <%
            if (!employee.getRole().equals("Admin")) {
                response.sendRedirect(request.getContextPath() + "/EmployeeLogout");
                return;
            }
        %>

        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>DANH SÁCH KHÁCH HÀNG</h3>

                    <table class="data">
                        <tr class="data">
                            <th class="data">STT</th>
                            <th class="data" >Mã Nhân viên</th>
                            <th class="data">Họ tên</th>
                            <th class="data">Nhóm quyền</th>                            
                            <th  class="data">Tên Đăng nhập</th>
                            <th  class="data"></th>
                        </tr>
                        <tr class="data">
                            <td class="data">STT</td>
                            <td class="data" >Mã Nhân viên</td>
                            <td class="data">Họ tên</td>
                            <td class="data">Nhóm quyền</td>                            
                            <td  class="data">Tên Đăng nhập</td>
                            <td> 
                                <a href="#edit" class="button" data-toggle="collapse" style="background-color: #e4b9c0; size: 15pt;">Sửa</a>
                                <a href="#del" class="button" data-toggle="collapse" style="background-color: #e4b9c0; size: 15pt;">Xóa</a>
                            </td>
                        </tr>
                    </table>

                </div>
                <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>

    </body>
</html>
