<%-- 
    Document   : orderByDate
    Created on : May 10, 2017, 10:53:47 PM
    Author     : DELL
--%>


<%@page import="dao.OrderDAO"%>
<%@page import="dao.OderDAO"%>
<%@page import="model.Oders"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>thông kê hóa đơn theo ngày</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css">
        <%@include file="header.jsp" %>  
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <div class="gagal" style="position: center; margin-top: 50px;">
                        DANH SÁCH CÁC HÓA ĐƠN         
                    </div>

                    <form action=".." method="post" class="form" role="form">
                        <table class="data" style="font-size: 15px;">
                            <tr class="data">
                                <th class="data">STT</th>
                                <th class="data" >Mã HĐ</th>
                                <th class="data">Mã KH</th> 
                                <th  class="data">TT đơn hàng</th>
                                <th  class="data">Mã NV</th>  
                                <th class="data">Ngày đặt</th>
                            </tr>
                            <tr class="data">
                            <%                          
                                String fromday = (String) session.getAttribute("from");
                                String today = (String) session.getAttribute("to");
                                ArrayList<Oders> order = OrderDAO.getOrderByDate(fromday, today);
                                for (int i = 0; i < order.size(); i++) {

                            %>
                            <td class="data"><%=i + 1%></td>
                            <td class="data" ><%=order.get(i).getOderID()%></td>
                            <td class="data" ><%=order.get(i).getCustomerID()%></td>                           
                            <td class="data" ><%=order.get(i).getStatus()%></td>
                            <td class="data" ><%=order.get(i).getEmployeeID()%></td>
                            <td class="data"><%=order.get(i).getOderDate()%></td>
                        </tr>
                        <%}%>

                    </table>
                </form>
            </div>
            <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>

    </body>
</html>
