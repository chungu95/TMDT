<%-- 
    Document   : payment
    Created on : May 7, 2017, 10:01:34 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/cart.css">
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>        
        <%@include file="header.jsp" %>
    </head>
    <body>
    <center><h1>THANH TOÁN QUA NGÂN HÀNG</h1></center>
    <marquee><h2 style="background-color: #b2dba1;">THANH TOÁN TRỰC TUYẾN AN TOÀN - NHANH CHÓNG - TIỆN LỢI </h2></marquee>
    <div class="row" style="margin-top: 50px;">
        <div class="col-sm-4" style="margin-left: 15px;">
            <div class="panel panel-warning">
                <div class="panel-heading" style="size: 15px;">Thông tin đơn hàng</div>
                <div class="panel-body">
                    <table>
                        <tr>
                            <td><label >Thông tin đại lý : </label></td>
                            <td>TIVI SHOP</td>
                        </tr><tr></tr>
                        <tr>
                            <td>   Mã đơn hàng      : </td>
                            <td>mdh</td>
                        </tr><tr></tr>                        
                        <tr>
                            <td>Giá trị đơn hàng : </td>
                            <td>gt đơn hàng</td>
                        </tr><tr></tr>
                    </table>    
                    <img src="image/bank.jpg" class="img-rounded" alt="Cinque Terre" width="304" height="236"> 
                </div>
            </div>
        </div>
        <div class="col-sm-6" style="margin-left: 5px;">
            <h3> Thông tin chủ thẻ </h3>
            <div class="form-group">
                <label class="control-label col-sm-3" >Tên ngân hàng :</label>
                <div>
                    tên ngân hàng
                </div>
                <br>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" >Số thẻ :</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="ID" placeholder="Nhập số thẻ" name="ID"><br>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="pwd">Mật khẩu:</label>
                <div class="col-sm-9">          
                    <input type="password" class="form-control" id="pwd" placeholder="nhập mật khẩu" name="pwd">
                </div>
            </div>
             <div class="form-group" >         
                    <div class="col-sm-4" style="margin-top: 20px;">
                        <input type="submit" value="Thanh toán" class="btn btn-success btn-lg"/>
                    </div>
                 <div class="col-sm-4" style="margin-top: 20px;">
                        <input type="submit" value="Hủy" class="btn btn-warning btn-lg"/>
                    </div>
                </div>
        </div>
    </div>


</body>
</html>
