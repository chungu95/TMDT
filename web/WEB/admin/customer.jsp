<%-- 
    Document   : customer
    Created on : Apr 3, 2017, 9:53:31 PM
    Author     : DELL
--%>

<%@page import="java.util.Calendar"%>
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


        <div >
            <jsp:include page="menu.jsp"></jsp:include>

                <div>
                    <div class="gagal" style="position: center; margin-top: 50px;">
                        DANH SÁCH KHÁCH HÀNG                 
                    </div>

                    <form action="../CustomerControl" method="post" class="form" role="form">
                        <table class="data" style="font-size: 15px;">
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
                                <!--<th  class="data"></th>-->
                            </tr>
                            <tr class="data">
                            <%
                                String sql = "SELECT * FROM Customers ORDER BY CustomerName ;";
                                ArrayList<Customers> customer = CustomerDAOs.getCustomers(sql);

                                for (int i = 0; i < customer.size(); i++) {

                            %>
                            <td class="data"><%=i + 1%></td>
                            <td class="data" ><%=customer.get(i).getCustomerID()%></td>
                            <td class="data"><%=customer.get(i).getCustomerName()%></td>                               
                            <td class="data"><%=customer.get(i).getDoB()%></td>                        
                            <td class="data"><%=customer.get(i).getGender()%></td>
                            <td class="data"><%=customer.get(i).getAddress()%></td>
                            <td class="data"><%=customer.get(i).getEmail()%></td>
                            <td  class="data"><%=customer.get(i).getPhoneNumber()%></td>
                            <td  class="data"><%=customer.get(i).getUsername()%></td> 
                            <td  class="data"><%=customer.get(i).getAccumulatedScore()%></td> 
                            <!--                        <td> 
                                                        <button type="submit"  class="button"name="cmd" value="updateInfo">Sửa</button>
                                                                                       
                                                    </td>-->
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
