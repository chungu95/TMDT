<%-- 
    Document   : acount
    Created on : Mar 9, 2017, 2:49:52 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ĐĂNG KÝ TÀI KHOẢN</title>

        <%@include file = "header.jsp" %> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <link href="./css/bootstrap-datepicker.css" rel="stylesheet" />
        <script src="./js/bootstrap-datepicker.js"></script>
        <link rel="stylesheet" href="../WEB/css/logincss.css">        
        <link rel="stylesheet" href="../WEB/css/bootstrap.min.css">
        <link rel="stylesheet" href="../WEB/css/bootstrap-theme.min.css">
    </head>
    <body class="acount">

        <%            if (session.getAttribute("customer") != null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <div class="container"> 
            <h1 class="text-center">ĐĂNG KÝ TÀI KHOẢN</h1> 
            <div class="row"> 
                <div class="col-xs-12 col-sm-12 col-md-4 well well-sm col-md-offset-4"> 
                    <legend><a href=""><i class="glyphicon glyphicon-globe"></i></a> Đăng ký thành viên!
                    </legend> 
                    <%
                        if (request.getParameter("error") != null && request.getParameter("error").equals("existed")) {
                            out.print("<b style='color:red'><center>Tên truy nhập đã tồn tại!</center></b><br />");
                        }
                    %>
                    <form action="../RegController" method="post" class="form" role="form">                       

                        <div>
                            <input class="form-control" style="float: left; width: 45%; margin-right: 10%;" name="firstname" placeholder="Họ" required="" autofocus="" type="text">
                            <input class="form-control" style="float: left; width: 45%;" name="lastname" placeholder="Tên" required="" type="text" autofocus="" >
                        </div>
                        <input class="form-control" name="Phone" placeholder="Điện thoại" type="number" required=""/> 
                        <input class="form-control" name="youremail" placeholder="Email" type="email" required=""/> 
                        <input class="form-control" name="address" placeholder="Địa chỉ" type="text" required=""/> 
                        <input class="form-control" name="username" placeholder="Tên đăng nhập" type="text" required=""/> 
                        <input class="form-control" name="password" placeholder="Mật khẩu" type="password" id="password" required=""/> 
                        <input class="form-control" name="retypepassword" placeholder="Nhập lại mật khẩu" type="password" id="retypepassword" required=""/> <label for=""> Ngày tháng năm sinh </label>                          
                        <input type="text" class="form-control" id="pickDate" name="DoB" placeholder="Ngày tháng năm sinh" style="width: 300px; padding-left: 20px" required=""/>
                        <label for="sex"> Giới tính: </label>  <label class="radio-inline">      <input name="sex" id="inlineCheckbox1" value="male" type="radio" checked/>          Nam </label> <label class="radio-inline">          <input name="sex" id="inlineCheckbox2" value="female" type="radio"/>          Nữ </label> 
                        <br> 
                        <br> 
                        <button class="btn btn-lg btn-primary btn-block" type="submit"/> Đăng ký</button> 
                    </form> 
                </div> 
            </div>
        </div>
        <script>
            var password = document.getElementById("password")
                    , confirm_password = document.getElementById("retypepassword");
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


    </body>
    <footer>
        <%@include file = "footer.jsp" %> 
    </footer>
</html>
