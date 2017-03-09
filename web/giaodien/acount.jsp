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
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/logincss.css">
        
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </head>
    <body class="acount">
       <header>
        <div class="container">
                <div class="row">
                   <div class="logo col-md-6 col-sm-6 col-xs-12"><h1 style="color: yellow;"><a href="#" >BÁN TIVI TỐT NHẤT</a></h1></div>
                   <div class="search col-md-6 col-sm-6 col-xs-12 text-right">
                   <form method="get" action="#">
                       <input type="text" placeholder="Nhập từ khóa tìm kiếm" id="q" name="q" value="" style="padding: 10px">
                       <input type="submit" value="Tìm Kiếm">  
                       <ul class="nav navbar-nav navbar-right">
                         <li><a href="#" style="color: yellow;">Giỏ hàng</a></li>        
                       </ul>
                   </form>           
                   </div>
                   <div class="clearfix"></div>
        </div>
        <div class="header-menu">
      <!-- Menu do Bootstrap cung cấp có hỗ trợ menu trên di động -->
        <nav class="navbar navbar-default">
            <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
             </button>
             <a class="navbar-brand" href="#">TRANG CHỦ</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav">            
                   <li><a href="#">GIỚI THIỆU</a></li>
                   <li><a href="#">LIÊN HỆ</a></li>
                   <li><a href="#">ĐĂNG KÝ</a></li>
                   <li><a href="#">ĐĂNG NHẬP</a></li>
               </ul>
            </div>
        </nav>
      <!-- End Menu Bootstrap -->
        </div>
        </div>
    </header>
    <div class="container"> 
        <h1 class="text-center">ĐĂNG KÝ TÀI KHOẢN</h1> 
        <div class="row"> 
        <div class="col-xs-12 col-sm-12 col-md-4 well well-sm col-md-offset-4"> 
            <legend><a href=""><i class="glyphicon glyphicon-globe"></i></a> Đăng ký thành viên!
            </legend> 
        <form action="" method="post" class="form" role="form"> 
        <div class="row"> 
        <div class="col-xs-6 col-md-6"> <input class="form-control" name="firstname" placeholder="Họ" required="" autofocus="" type="text"> 
        </div> 
        <div class="col-xs-6 col-md-6"> <input class="form-control" name="lastname" placeholder="Tên" required="" type="text"> 
        </div> 
        </div> 
            
           <input class="form-control" name="Phone" placeholder="Điện thoại" type="number"> 
           <input class="form-control" name="youremail" placeholder="Email" type="email"> 
           <input class="form-control" name="address" placeholder="Địa chỉ" type="text"> 
           <input class="form-control" name="username" placeholder="Tên đăng nhập" type="text"> 
           <input class="form-control" name="password" placeholder="Mật khẩu" type="password"> 
           <input class="form-control" name="retypepassword" placeholder="Nhập lại mật khẩu" type="password"> <label for=""> Ngày sinh</label> 
        <div class="row"> 
            <div class="col-xs-4 col-md-4"> <select class="form-control">              <option value="Day">Ngày</option>            </select> 
            </div> 
            <div class="col-xs-4 col-md-4"> <select class="form-control">              <option value="Month">Tháng</option>            </select> 
            </div> 
            <div class="col-xs-4 col-md-4"> <select class="form-control">              <option value="Year">Năm</option>            </select> 
            </div> 
        </div> <label class="radio-inline">          <input name="sex" id="inlineCheckbox1" value="male" type="radio">          Nam </label> <label class="radio-inline">          <input name="sex" id="inlineCheckbox2" value="female" type="radio">          Nữ </label> 
        <br> 
        <br> 
         <button class="btn btn-lg btn-primary btn-block" type="submit"> Đăng ký</button> 
        </form> 
        </div> 
        </div>
    </div>
        
        <footer>
      <div class="container">
      <div class="footer-info text-center">
      Đề tài Môn học Phát triển hệ thống thương mại điện tử.
      Nhóm 5.
      </div>
      </div>
    </footer>
    </body>
</html>
