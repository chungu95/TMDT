<%-- 
    Document   : hearder.jsp
    Created on : Mar 10, 2017, 9:22:56 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WEB BÁN HÀNG</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/mycss.css">
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
        <div class="container">
                <div class="row">
                    <div class="logo col-md-6 col-sm-6 col-xs-12"><img src="image/ten.PNG"></div>
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
                    <a class="navbar-brand " href="#" style="font-weight: bold">TRANG CHỦ</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav "style="font-weight: bold ">            
                   <li ><a href="#" >KIỂM TRA ĐƠN HÀNG</a></li>
                   <li><a href="#">CHĂM SÓC KHÁCH HÀNG</a></li>
                   <li><a href="#">ĐĂNG KÝ</a></li>
                   <li><a href="#">ĐĂNG NHẬP</a></li>
               </ul>
            </div>
        </nav>
      <!-- End Menu Bootstrap -->
        </div>
        </div>
    </header>
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
