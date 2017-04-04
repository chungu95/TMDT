<%-- 
    Document   : cart
    Created on : Mar 24, 2017, 9:52:54 AM
    Author     : DELL
--%>

<%@page import="java.lang.Exception"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/cart.css">
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>        
        <%@include file="header.jsp" %>
    </head>
    <body>
        <h2 class="text-center">Giỏ hàng của bạn</h2>
        <div class="container"> 
            <table id="cart" class="table table-hover table-condensed"> 
                <thead> 
                    <tr> 
                        <th style="width:50%">Tên sản phẩm</th> 
                        <th style="width:10%">Giá</th> 
                        <th style="width:8%">Số lượng</th> 
                        <th style="width:22%" class="text-center">Thành tiền</th> 
                        <th style="width:10%"> </th> 
                    </tr> 
                </thead> 
                <tbody>

                    <%                        for (int i = 0; i < cart.getListProduct().size(); i++) {
                    %>
                    <tr> 

                        <td data-th="Product"> 
                            <div class="row"> 

                                <div class="col-sm-10"> 
                                    <h4 class="nomargin"><%=cart.getListProduct().get(i).getProductName()%></h4> 

                                </div>
                            </div> 
                        </td> 
                        <td data-th="Price"><%=cart.getListProduct().get(i).getPrice()%></td> 
                        <td data-th="Quantity"><input class="form-control text-center" value="<%=cart.getListProduct().get(i).getQuantity()%>" type="number">
                        </td> 
                        <td data-th="Subtotal" class="text-center"><%=(cart.getListProduct().get(i).getPrice() * cart.getListProduct().get(i).getQuantity())%></td> 
                        <td class="actions" data-th="">
                            <div class="row">
                                <a href="../CartController?cmd=delete&productID=<%=cart.getListProduct().get(i).getProductID()%>" class="btn btn-danger btn-lg"> 
                                    <span class="glyphicon glyphicon-trash"></span>
                                </a>
                            </div>
                        </td> 
                    </tr> 
                    <%}%>

                </tbody>
                <tfoot> 

                    <tr> 
                        <td><a href="index.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp tục mua hàng</a>

                        <td colspan="1" class="hidden-xs"> </td>   
                        <td class="hidden-xs text-center"><strong>Tổng TiVi: <%=cart.getTotalQuantity()%></strong>
                        <td class="hidden-xs text-center"><strong>Tổng tiền: <%=cart.getTotalPrice()%></strong>

                        <td><a href="index.jsp" class="btn btn-success btn-block">Thanh toán <i class="fa fa-angle-right"></i></a></td> 
                    </tr> 
                </tfoot> 
            </table>
        </div>
    </body>
</html>
