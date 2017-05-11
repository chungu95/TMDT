<%-- 
    Document   : payment
    Created on : May 7, 2017, 10:01:34 AM
    Author     : DELL
--%>

<%@page import="dao.OderDAO"%>
<%@page import="model.Oders"%>
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
        <%            Oders order = null;
            if (request.getParameter("orderid") != null) {
                try{
                order = OderDAO.getOrderByID(request.getParameter("orderid"));
                }catch(Exception ex){
                }
            }
            if (order == null) {
                out.print("<center><b style='color:red'>Không có hóa đơn này!</b></center>");
                return;
            } else if (order.getPaymentMethod().equals("delivery") || order.getStatus().equals("Đang giao hàng")) {
                out.print("<center><b style='color:red'>Hóa đơn này đã được thanh toán hoặc sẽ được thanh toán khi nhận hàng</b></center>");
                return;
            }
//            out.print(order.getOderDetailsList().get(0).getProductID()); 
%>
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
                            <td><%=order.getOderID()%></td>
                        </tr><tr></tr>                        
                        <tr>
                            <td>Giá trị đơn hàng : </td>
                            <td><%=order.getPrice()%></td>
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
                    Test BANK!
                </div>
                <br>
            </div>
            <form method="post" action="../PaymentController">
                <input type="hidden" name="OrderID" value="<%=order.getOderID()%>"/>
                <div class="form-group">
                    <label class="control-label col-sm-2" >Số thẻ :</label>
                    <div class="col-sm-9">
                        <input type="number" class="form-control" id="ID" name="ID" placeholder="Nhập số thẻ" name="ID" required=""><br>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Mật khẩu:</label>
                    <div class="col-sm-9">          
                        <input type="password" class="form-control" id="pwd" placeholder="nhập mã PIN" name="pwd" required="">
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
            </form>
        </div>
    </div>
</body>
</html>
