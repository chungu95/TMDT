<%-- 
    Document   : customer
    Created on : Apr 3, 2017, 9:53:31 PM
    Author     : DELL
--%>

<%@page import="dao.CustomerDAOs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Khách hàng</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css">
         <%@include file="header.jsp" %>  
    </head>
    <body>
       

            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>DANH SÁCH KHÁCH HÀNG</h3>


                    <table class="data">
                        <tr class="data">
                            <th class="data">STT</th>
                            <th class="data" >Mã KH</th>
                            <th class="data">Họ tên</th>
                            <th class="data">Ngày sinh</th>
                            <th class="data">Giới tính</th>
                            <th class="data">Địa chỉ</th>
                            <th class="data">Email</th>
                            <th  class="data">Điện thoại</th>
                            <th  class="data">Tên Đăng nhập</th>
                            <th  class="data">Điểm</th>
                            <th  class="data"></th>
                        </tr>
                        <tr class="data">
                        <%
                            String sql = "SELECT * FROM Customers ORDER BY CustomerName ;";
                            ArrayList<Customers> customer = CustomerDAOs.getCustomers(sql);
                            int max = 10;
                            if (request.getParameter("max") != null) {
                                max = Integer.parseInt(request.getParameter("max"));
                            }
                            for (int i = 0; i < customer.size(); i++) {

                        %>
                        <td class="data">i</td>
                        <td class="data" ><%=customer.get(i).getCustomerID()%> </td>
                        <td class="data"><%=customer.get(i).getCustomerName()%></td>
                        <td class="data"><%=customer.get(i).getDoB()%></td>
                        <td class="data"><%=customer.get(i).getDoB()%></td>
                        <td class="data"><%=customer.get(i).getAddress()%>Địa chỉ</td>
                        <td class="data"><%=customer.get(i).getEmail()%></td>
                        <td  class="data"><%=customer.get(i).getPhoneNumber()%></td>
                        <td  class="data"><%=customer.get(i).getUsername()%></td> 
                        <td  class="data"><%=customer.get(i).getAccumulatedScore()%></td> 
                        <td> 
                            <a href="#edit" class="button" data-toggle="collapse" style="background-color: #e4b9c0; size: 15pt;">Sửa</a>                                
                        </td>
                    </tr>
                    <%}%>

                </table>
                
            </div>
            <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>

    </body>
</html>
