<%-- 
    Document   : checkorders
    Created on : Mar 30, 2017, 2:59:12 PM
    Author     : DELL
--%>

<%@page import="dao.OderDAO"%>
<%@page import="model.Oders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kiểm tra đơn hàng</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/cart.css">
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>        
        <%@include file="header.jsp" %>
    </head>
    <body>
        <h1 class="text-center" style="color: #398439;">ĐƠN HÀNG CỦA BẠN</h1>
        <%            ArrayList<Oders> order = OderDAO.getAllOrderByCustomerID(customer.getCustomerID());
            if (order.isEmpty() || order == null) {
                out.print("<center><b style='color:red'>Bạn chưa có đơn hàng nào!</b></center>");
                return;
            } else {
                for (int i = 0; i < order.size(); i++) {
        %>
        <div class="container">
            <table id="cart"  class="table table-bordered table-responsive table-hover table-striped">
                <thead>
                    <tr class="info">
                        <th style="width: 10%; text-align: center"> STT</th> 
                        <th style="width: 15%; text-align: center"> Mã hóa đơn</th>
                        <th style="width: 15%; text-align: center">Số lượng</th>
                        <th style="width: 15%; text-align: center">Tổng tiền</th>
                        <th style="width: 15%; text-align: center"> Trạng thái</th>
                        <th style="width: 15%; text-align: center"></th>
                        <th style="width: 15%; text-align: center"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="active">
                        <td style="text-align: center">
                            <h4 class="nomargin"><%=i + 1%></h4> 
                        <td data-th="Product" style="text-align: center"> 
                            <h4 class="nomargin"><%=order.get(i).getOderID()%></h4> 
                        </td> 
                        <td data-th="Quantity" style="text-align: center"> <h4 class="nomargin"><%=order.get(i).getOderDetailsList().size()%></h4></td>
                        <td data-th="Price" style="text-align: center"> <h4 class="nomargin"><%=order.get(i).getPrice()%></h4></td> 
                        <td style="text-align: center"> <h4 class="nomargin"><%=order.get(i).getStatus()%></h4></td>
                            <%if (order.get(i).getPaymentMethod().equals("cart") && order.get(i).getStatus().equals("Chưa thanh toán")) {%> 
                        <td style="text-align: center"> <a href="payment.jsp?orderid=<%=order.get(i).getOderID()%>" class="btn btn-primary" style="border-radius: 6px">Thanh toán</a></td>
                        <td style="text-align: center"> <a href="../CancelOrder?orderID=<%=order.get(i).getOderID()%>" class="btn btn-danger" style="border-radius: 6px">Hủy</a></td>
                        <%} else if(order.get(i).getPaymentMethod().equals("delivery") && order.get(i).getStatus().equals("Đang xác nhận")){%>
                        <td style="text-align: center"> <a class="btn btn-primary disabled" style="border-radius: 6px">Thanh toán</a></td>
                        <td style="text-align: center"> <a href="../CancelOrder?orderID=<%=order.get(i).getOderID()%>" class="btn btn-danger" style="border-radius: 6px">Hủy</a></td>
                        <%} else{%>
                        <td style="text-align: center"> <a class="btn btn-primary disabled" style="border-radius: 6px">Thanh toán</a></td>
                        <td style="text-align: center"> <a class="btn btn-danger disabled" style="border-radius: 6px">Hủy</a></td>
                        <%}%>
                    </tr>                    
                </tbody>
            </table>
        </div>
        <%}
            }%>
    </body>
</html>
