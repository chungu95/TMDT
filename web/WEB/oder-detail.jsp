<%-- 
    Document   : addressDelivery
    Created on : Apr 8, 2017, 10:42:50 PM
    Author     : DELL
--%>

<%@page import="function.DateConverter"%>
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
            <form method="post" class="form-horizontal" id="form" action="../OderController">
                <div class="form-group">
                    <label style="text-align: left" class="control-label col-sm-2" for="name">Tên người nhận: </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="name" value="<%=customer.getCustomerName()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label style="text-align: left" class="control-label col-sm-2" for="address">Địa chỉ giao hàng: </label>
                    <div class="col-sm-10">          
                        <input type="text" class="form-control" id="address" name="address" value="<%=customer.getAddress()%>">
                    </div>
                </div>
                <div class="form-group">        
                    <label style="text-align: left" class="control-label col-sm-2" for="phone">Số điện thoại: </label>
                    <div class="col-sm-10">          
                        <input type="text" class="form-control" id="phone" name="phone" value="<%=customer.getPhoneNumber()%>">
                    </div>
                </div>
                <div class="form-group">        
                    <label style="text-align: left" class="control-label col-sm-2" for="phone">Ngày lập hóa đơn: </label>
                    <div class="col-sm-10">          
                        <input type="text" class="form-control" id="oderDate" name="oderDate" value="<%=DateConverter.getFormatDate()%>" readonly="readonly"/>
                    </div>
                </div>
                <div class="form-group">        
                    <label style="text-align: left" class="control-label col-sm-2" for="phone">Dự kiến giao hàng: </label>
                    <div class="col-sm-10">          
                        <input type="text" class="form-control" id="shipDate" name="shipDate" value="<%=DateConverter.getShipDate(3)%>" readonly="readonly"/>
                    </div>
                </div>
                <div class="form-group">        
                    <label style="text-align: left" class="control-label col-sm-2" for="phone">Hình thức thanh toán: </label>
                    <div class="col-sm-10">          
                        <select class="form-control" id ="paymentMethod" name="paymentMethod">
                            <option value="delivery">Thanh toán sau khi nhận hàng</option>
                            <option value="cart" selected="selected">Thẻ ngân hàng</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">         
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" value="Tiếp tục" class="btn btn-success btn-lg"/>
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

<!--        <script language="javascript">
            function doRedirect() {
                var frm = document.getElementById("form");
                var payment = frm.elements[5].value;
                if (payment === "cart") {
                    frm.action="";
                } else if (payment === "delivery") {
                    
                }
            }
        </script>-->

    </body>
</html>
