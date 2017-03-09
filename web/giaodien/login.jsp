<%-- 
    Document   : login
    Created on : Mar 9, 2017, 1:19:49 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ĐĂNG NHẬP</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/logincss.css">
        
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </head>
    <body>
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
        <section id="main" >
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-ofset-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4> ĐĂNG NHẬP </h4>
                            </div>
                            <div class="panel-body">
                                <form action="" method="POST" role="form">
                                    
                                    
                                    <div class="form-group">
                                        <label for="username">Tên đăng nhập</label>
                                        <input type="text" class="form-control" id="username" placeholder="nhập tên đăng nhập">
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Mật khẩu</label>
                                        <input type="password" class="form-control" id="password" placeholder="nhập mật khẩu">
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
                                        </div>
                                        <div class="col-lg-6">
                                            <a href="f" class="btn btn-link"> Bạn chưa có tài khoản ? </a>
                                        </div>
                                    </div>
                                    
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
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
