<%-- 
    Document   : customer
    Created on : Apr 3, 2017, 9:53:31 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Khách hàng</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css">
         <%@include file="header.jsp" %>  
    </head>
    <body>
       

            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>DANH SÁCH KHÁCH HÀNG</h3>

                    <div class="informasi">

                    </div>
                    <table class="data">
                        <tr class="data">
                            <th class="data">STT</th>
                            <th class="data" >Mã KH</th>
                            <th class="data">Họ tên</th>
                            <th class="data">Ngày sinh</th>
                            <th class="data">Giới tính</th>
                            <th class="data">Địa chỉ</th>
                            <th class="data">Email</th>
                            <th  class="data">Điện thoại</th>
                            <th  class="data">Tên Đăng nhập</th>
                            <th  class="data"></th>
                        </tr>
                        <tr class="data">
                            <td class="data">stt</td>
                            <td class="data" >Mã KH</td>
                            <td class="data">Họ tên</td>
                            <td class="data">Ngày sinh</td>
                            <td class="data">Giới tính</td>
                            <td class="data">Địa chỉ</td>
                            <td class="data">Email</td>
                            <td  class="data">Điện thoại</td>
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
