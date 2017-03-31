<%-- 
    Document   : checkorders
    Created on : Mar 30, 2017, 2:59:12 PM
    Author     : DELL
--%>

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
        <div class="container">
            <table id="cart"  class="table table-hover table-condensed">
                <thead>
                    <tr>
                        <th style="width: 10%"> STT</th>
                        <th style="width: 50%"> Tên sản phẩm</th>
                        <th style="width: 10%">Giá</th>
                         <th style="width:10%">Số lượng</th>
                         <th style="width:10%"> </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>stt</td>
                         <td data-th="Product"> 
                            <div class="row"> 
                                <div class="col-sm-10"> 
                                    <h4 class="nomargin">ten sp</h4>
                                </div>
                            </div> 
                        </td> 
                        <td data-th="Price">giá</td>
                        <td data-th="Quantity"><input class="form-control text-center" value="" type="number">
                        </td> 
                        <td><a href="#" class="btn btn-danger btn-lg"  style="margin-left: 20px;">
                                    <span class="glyphicon glyphicon-trash"></span>
                                </a>
                        </td>
                    </tr>                    
                </tbody>
                <tfoot>
                    <tr class="hidden-xs"></tr>
                    <tr> 
                        <td colspan="2" class="hidden-xs"> </td> 
                        <td class="hidden-xs "><strong>Tổng tiền 500.000 đ</strong>
                        </td>  
                        <td colspan="2" class="hidden-xs"> </td>                        
                    </tr>                    
                </tfoot>
            </table>
        </div>
    </body>
</html>
