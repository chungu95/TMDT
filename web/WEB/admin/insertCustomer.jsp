<%-- 
    Document   : insertCustomer
    Created on : Apr 20, 2017, 3:57:12 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm Tài Khoản KH</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css"> 
        <%@include file="header.jsp" %>  
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
            <form method="post" action="<%=request.getContextPath()%>/CustomerControl" >
                <div id="rightContent">

                    <div class="informasi">
                        THÊM TÀI KHOẢN KHÁCH HÀNG
                    </div>

                    <table width="95%">
                        <tr><td width="125px"><b>Nhập Họ : </b></td><td><input type="text" class="pendek" name="firstname" required=""></td></tr>
                        <tr><td width="125px"><b>Nhập Tên : </b></td><td><input type="text" class="pendek" name="lastname" required=""></td></tr>
                        <tr><td><b>Giới tính : </b></td><td>                               
                                <select  name="sex"   required="">                                  
                                    <option value="Nữ" selected>Nữ</option>                                        
                                    <option  value="Nam">Nam</option>
                                </select>
                            </td></tr>
                        <tr><td><b>Ngày tháng năm sinh</b></td><td><input type="datetime" class="form-control" id="pickDate" name="DoB" required=""/></td></tr>
                        <tr><td><b>Nhập số ĐT: </b></td><td><input type="number"  class="sedang" name="Phone" required=""></td></tr>
                        <tr><td><b>Địa chỉ email : </b></td><td><input type="email" class="sedang" name="youremail" required=""></td></tr>
                        <tr><td><b>Địa chỉ : </b></td><td><input type="text" class="sedang" name="address" required=""></td></tr>
                        <tr><td><b>Nhập tên đăng nhập: </b></td><td><input type="text" class="sedang" name="username" required=""></td></tr>
                        <tr><td><b>Mật khẩu: </b></td><td><input type="password" name="pass" id="pass" class="sedang" required=""></td></tr>
                        <tr><td><b>Nhập lại mật khẩu: </b></td><td><input type="password" name="repass"  id="repass" class="sedang" required=""></td></tr>
                        <tr><td> <button type="submit" class="button" name="cmd" value="insert">Thêm</button></td></tr>
                    </table>
                    <script>
                        var password = document.getElementById("pass")
                                , confirm_password = document.getElementById("repass");
                        function validatePassword() {
                            if (password.value !== confirm_password.value.trim()) {
                                confirm_password.setCustomValidity("Mật khẩu nhập lại không đúng!");
                            } else {
                                confirm_password.setCustomValidity('');
                            }
                        }
                        password.onchange = validatePassword;
                        confirm_password.onkeyup = validatePassword;

                        $('#pickDate').datepicker({
                            'format': 'dd-mm-yyyy',
                            'autoclose': true,
                            'language': 'vi'
                        });
                        $('#pickDate').datepicker('setDate', new Date(1995, 01, 10));
                        $('#pickDate').datepicker('update');
                        $('#pickDate').val('');
                    </script>
                </div>
                <div class="clear"></div>
            </form>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
