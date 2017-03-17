<%-- 
    Document   : Help
    Created on : Mar 17, 2017, 3:50:17 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WEB BÁN HÀNG</title>
        <link rel="stylesheet" href="../WEB/css/bootstrap.min.css">
        <link rel="stylesheet" href="../WEB/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../WEB/css/logincss.css">
        <script type="text/javascript" src="./WEB/js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="./WEB/js/bootstrap.min.js"></script>
         
        <%@include file = "header.jsp"%> 
    </head>
    <body>
        <div class="item">
                 <img src="image/kh.jpg" alt="second slide" style="width: 100%">

         </div>
        <header style="background: #67b168">            
            <div id="all">            
            <h1>CHĂM SÓC KHÁCH HÀNG</h1>
            </div>
        </header> 
        <div class="panel-group">
                 <div class="panel panel-danger">
                          <div class="panel-heading">Khi nào tôi nhận được đơn hàng ?</div>            
                          <input type="button" class="btn btn-success" style="margin-bottom: 10px; margin-left: 20px; margin-top: 20px;" value="Chi tiết " onclick="">
                 </div>
        </div>
        <div class="panel-group">
                 <div class="panel panel-danger">
                          <div class="panel-heading">Làm thế nào tôi kiểm tra tình trạng đơn hàng của tôi</div>            
                          <input type="button" class="btn btn-success"  style="margin-bottom: 10px; margin-left: 20px; margin-top: 20px;" value=" Chi tiết " onclick="" >
                 </div>
        </div>
         <div class="panel-group">
                 <div class="panel panel-danger">
                          <div class="panel-heading">Các hình thức thanh toán đang được áp dụng</div>            
                          <input type="button" class="btn btn-success"  style="margin-bottom: 10px; margin-left: 20px; margin-top: 20px;" value=" Chi tiết " onclick="" >
                 </div>
        </div>
        <div class="panel-group">
                 <div class="panel panel-danger">
                          <div class="panel-heading">Làm thế nào để hủy đơn hàng</div>            
                          <input type="button" class="btn btn-success"  style="margin-bottom: 10px; margin-left: 20px; margin-top: 20px;" value=" Chi tiết " onclick="" >
                 </div>
        </div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
