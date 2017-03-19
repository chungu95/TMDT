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
          <style>
  body {
      position: relative; 
  }
  #section1 {padding-top:50px;height:500px;color: black; background-color: white;}
  #section2 {padding-top:50px;height:500px;color: #fff; background-color: pink;}
  #section3 {padding-top:50px;height:500px;color: black; background-color: white;}
  #section4 {padding-top:50px;height:500px;color: #fff; background-color: pink;}
 
  </style>
        
    </head>
    <body  >
        <%-- srollspy --%>
        <%@include file = "header.jsp"%> 
        <img src="image/kh.jpg" style="width: 100%">
        <div data-spy="scroll" data-target=".navbar" data-offset="50">
        <nav class="navbar navbar-inverse navbar-fixed-bottom">
  <div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
        <h1 style="color: yellow">CHĂM SÓC KHÁCH HÀNG</h1>
    </div>
    <div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          <li><a href="#section1">Khi nào tôi nhận được đơn hàng ?</a></li>
          <li><a href="#section2">Làm thế nào tôi kiểm tra tình trạng đơn hàng của tôi</a></li>
          <li><a href="#section3">Các hình thức thanh toán đang được áp dụng</a></li>
          <li><a href="#section4">Làm thế nào để hủy đơn hàng</a></li>
        </ul>
      </div>
    </div>
  </div>
</nav>    

<div id="section1" class="container-fluid">
  <h1>Khi nào tôi nhận được đơn hàng ?</h1>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
</div>
<div id="section2" class="container-fluid">
  <h1>Làm thế nào tôi kiểm tra tình trạng đơn hàng của tôi</h1>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
</div>
<div id="section3" class="container-fluid">
  <h1>Các hình thức thanh toán đang được áp dụng</h1>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
</div>
<div id="section4" class="container-fluid">
  <h1>Làm thế nào để hủy đơn hàng</h1>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
</div>
        </div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
