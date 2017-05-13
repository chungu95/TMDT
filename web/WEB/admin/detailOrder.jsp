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

            <%      //      try {

                Oders order = (Oders) OderDAO.getOrderByID(request.getParameter("OrderID"));
                Customers cus = (Customers) CustomerDAOs.getCustomer(order.getCustomerID());
            %>

            <div id="rightContent">
                <h3>THÔNG TIN CHI TIẾT ĐƠN HÀNG</h3>
                <div class="informasi">
                    ĐƠN HÀNG MÃ <b style="color:red"><%=order.getOderID()%></b>
                </div><div class="data">
                    <form method="post" action="<%=request.getContextPath()%>/updateOrder">
                        <label for="status">Tình trạng đơn hàng </label>
                        <select name="status" >   
                            <option value="<%=order.getStatus()%>" selected=""><%=order.getStatus()%></option>
                            <option value="đang xác nhận">đang xác nhận</option>                                        
                            <option value="đang giao hàng">đang giao hàng</option>
                            <option value="hoàn thành">hoàn thành</option>
                            <td class="data"><input type="hidden" class="form-control"  name="employeeID"  value="<%=employee.getEmployeeID()%>"></td>
                        </select>
                        <input type="hidden" name="orderID" value="<%=order.getOderID()%>" />
                        <button type="submit" class="button" name="sub" value="update">Cập nhật</button>   
                    </form>
                </div>
                <table class="data">
                    <tr class="data">
                        <th class="data">Tên Khách hàng</th>
                        <th class="data">Ngày đặt </th>
                        <th class="data">Ngày giao</th>
                        <th class="data">Giá </th>
                        <th class="data">Thanh toán</th>
                        <th  class="data">Địa chỉ</th>
                        <th  class="data">SĐT</th>
                    </tr>
                    <tr class="data">                      
                        <td class="data"><%=cus.getCustomerName()%></td>
                        <td class="data"><%=order.getOderDate()%></td>
                        <td class="data"><%=order.getShipDate()%></td>
                        <td class="data" ><%=order.getPrice()%></td>
                        <td class="data" ><%=order.getPaymentMethod()%></td> 
                        <td class="data"><%=order.getDeliveryAddress()%></td>
                        <td class="data"><%=order.getDeliveryPhone()%></td>
                    </tr>
                </table>
                <div class="informasi">
                    CHI TIẾT HÓA ĐƠN
                </div>
                <table class="data">
                    <tr class="data">
                        <th class="data">Mã sản phẩm</th>
                        <th class="data">Tên Sản phẩm</th>
                        <th class="data">Số lượng</th>
                        <th class="data">Số tiền</th>
                    </tr>
                    <%
                        for (int i = 0; i < order.getOderDetailsList().size(); i++) {
                    %>
                    <tr class="data"> 
                        <td class="data"><%=order.getOderDetailsList().get(i).getProductID()%></td>
                        <td class="data"><%=ProductsDAO.getProductByID(order.getOderDetailsList().get(i).getProductID()).getProductName()%></td>
                        <td class="data" ><%=order.getOderDetailsList().get(i).getQuantity()%></td>
                        <td class="data" ><%=order.getOderDetailsList().get(i).getPrice()%></td>  
                    </tr>
                    <% }%>
                </table> 
            </div>
            <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>

    </body>
</html>
