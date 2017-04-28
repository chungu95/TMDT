<%-- 
    Document   : addressDelivery
    Created on : Apr 8, 2017, 10:42:50 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Địa chỉ giao hàng</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/cart.css">
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>        
        <%@include file="header.jsp" %>
    </head>
    <body>
        <h2 class="text-center">Địa chỉ giao hàng</h2>
        <div class="container">
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">Tên : </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" placeholder="Nhập họ và tên">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="address">Địa chỉ giao hàng : </label>
                    <div class="col-sm-10">          
                        <input type="text" class="form-control" id="address" placeholder="Vui lòng điền chính xác địa chỉ giao hàng">
                    </div>
                </div>
                <div class="form-group">        
                    <label class="control-label col-sm-2" for="address">Số điện thoại:  </label>
                    <div class="col-sm-10">          
                        <input type="number" class="form-control" id="address">
                    </div>
                </div>
                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Tiếp tục</button>
                    </div>
                </div>
            </form>

            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Lựa chọn hình thức thanh toán</h4>
                        </div>
                        <div class="modal-body">
                            <a href="#" class="btn btn-warning"><i class="fa fa-angle-left" ></i>Thanh toán khi nhận hàng</a>
                            <a href="#" class="btn btn-info"><i class="fa fa-angle-left"></i> Thanh toán qua thẻ</a>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
