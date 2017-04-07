<%-- 
    Document   : insertEmployee
    Created on : Apr 6, 2017, 4:18:01 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm nhân viên</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css"> 
        <%@include file="header.jsp" %>  
    </head>
    <body>

        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
            <form method="post" action="<%=request.getContextPath()%>/employeeControl" >
                <div id="rightContent">

                    <div class="informasi">
                        THÊM TÀI KHOẢN NHÂN VIÊN
                    </div>

                    <table width="95%">
                        <tr><td width="125px"><b>Nhập tên nhân viên: </b></td><td><input type="text" class="pendek" name="employeeName" required=""></td></tr>

                        <tr><td><b>Chọn nhóm quyền : </b></td><td>                               
                                <select name="role" required="">                                  
                                    <option value="admin" selected>admin</option>                                        
                                    <option value="sale">sale</option>
                                </select>
                            </td></tr>
                        <tr><td><b>Nhập tên đăng nhập: </b></td><td><input type="text" class="sedang" name="username" required=""></td></tr>
                        <tr><td><b>Mật khẩu: </b></td><td><input type="password" name="pass" id="pass" class="sedang" required=""></td></tr>
                        <tr><td><b>Nhập lại mật khẩu: </b></td><td><input type="password" name="repass"  id="repass" class="sedang" required=""></td></tr>
                        <tr><td> <button type="submit" class="button" name="sub" value="insert">Lưu</button></td></tr>
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
                    </script>
                </div>
                <div class="clear"></div>
            </form>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
