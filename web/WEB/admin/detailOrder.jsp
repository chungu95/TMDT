<%-- 
    Document   : detailOrder
    Created on : May 7, 2017, 9:59:24 PM
    Author     : DELL
--%>

<%@page import="model.Products"%>
<%@page import="dao.ProductsDAO"%>
<%@page import="dao.CustomerDAOs"%>
<%@page import="model.Customers"%>
<%@page import="dao.OderDAO"%>
<%@page import="model.Oders"%>
<%@page import="model.Employees"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>chi tiết đơn hàng</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css">
        <link rel="stylesheet" href="admincss/detailcss.css">
        <%@include file="header.jsp" %>  
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

            <%            try {

                    Oders order = (Oders) OderDAO.getOrderByID(request.getParameter("OrderID"));
                    Customers cus = (Customers) CustomerDAOs.getCustomer(order.getCustomerID());
                    Products pro = (Products) ProductsDAO.getProductByID(order.getOderDetail().getProductID());
            %>

            <div id="rightContent">
                <h3>THÔNG TIN CHI TIẾT ĐƠN HÀNG</h3>
                <form method="post" action="<%=request.getContextPath()%>/updateOrder">
                    <div class="informasi">
                        ĐƠN HÀNG
                    </div>
                    <table class="data">
                        <tr class="data">
                            <th class="data" >Mã ĐH</th>
                            <th class="data">Tên Khách hàng</th>
                            <th class="data">Ngày đặt </th>
                            <th class="data">Ngày giao</th>
                            <th class="data">Giá </th>
                            <th class="data">Thanh toán</th>
                            <th  class="data">Trạng thái</th>
                        </tr>
                        <tr class="data">                      
                        <input type="hidden" name="orderID" value="<%=order.getOderID()%>" />
                        <td class="data"><%=order.getOderID()%></td>
                        <td class="data"><%=cus.getCustomerName()%></td>
                        <td class="data"><%=order.getOderDate()%></td>
                        <td class="data"><%=order.getShipDate()%></td>
                        <td class="data" ><%=order.getPrice()%></td>
                        <td class="data" ><%=order.getPaymentMethod()%></td> 
                        <td class="data" >                            
                            <select name="status" >   
                                <option value="<%=order.getStatus()%>" selected=""><%=order.getStatus()%></option>
                                <option value="đang xác nhận">đang xác nhận</option>                                        
                                <option value="đang giao hàng">đang giao hàng</option>
                                <option value="hoàn thành">hoàn thành</option>
                            </select>
                        </td> 
                        </tr>
                    </table>
                    <div class="informasi">
                        CHI TIẾT HÓA ĐƠN
                    </div>
                    <table class="data">
                        <tr class="data">
                            <th class="data" >Địa chỉ</th>
                            <th class="data">Điện thoại</th>
                            <th class="data">Mã NV</th>
                            <th class="data">Sản phẩm</th>
                            <th class="data">Số lượng</th>
                            <th class="data">Giá</th>
                            <th  class="data"></th>
                        </tr>

                        <tr class="data">
                            <td class="data"><%=order.getDeliveryAddress()%></td>
                            <td class="data"><%=order.getDeliveryPhone()%></td>
                            <td class="data"><input type="text" class="form-control"  name="employeeID"  value="<%=employee.getEmployeeID()%>"></td>
                            <td class="data"><%=pro.getProductName()%></td>
                            <td class="data" ><%=order.getOderDetail().getQuantity()%></td>
                            <td class="data" ><%=order.getOderDetail().getPrice()%></td> 
                            <td> 
                                <button type="submit" class="button" name="sub" value="update">Sửa</button>                            
                            </td>
                        </tr>
                        <%} catch (Exception ex) {
                                out.print("<center><b style = 'color:red'>Không có sản p //hầm này!</b></center>");
                            }
                        %>
                    </table> </form>
            </div>
            <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>

    </body>
</html>
