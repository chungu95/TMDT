<%-- 
    Document   : formcustomer
    Created on : Mar 16, 2017, 3:29:29 PM
    Author     : DELL
--%>

<%@page import="dao.CustomerDAOs"%>
<%@page import="model.Customers"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WEB BÁN HÀNG</title>
        <link rel="stylesheet" href="../WEB/css/bootstrap.min.css">
        <link rel="stylesheet" href="../WEB/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../WEB/css/logincss.css">
        <script type="text/javascript" src="./WEB/js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="./WEB/js/bootstrap.min.js"></script>
         
        <%@include file = "header.jsp"%> 
    </head>
    <body>
        <%
            CustomerDAOs CusD = new CustomerDAOs();
            CusD.getCustomers(request.getParameter(customer.toString()));
                              
        %>
        <div class="jumbotron" >               
            <h1>THÔNG TIN KHÁCH HÀNG</h1>             
        </div>
        <div class="table-bordered " style="font-size: 15px; background: #ebccd1; border-color: black;" >          
           <table class="table">
           <thead>
           <tr>
              <th>Mã KH</th>
              <th>Tên KH</th>
              <th>Ngày sinh</th>
              <th>Giới tính</th>
              <th>Địa chỉ</th>
              <th>Email</th>
              <th>SĐT</th>
              <th>Điểm tích lũy</th>
              <th>Tên đăng nhập</th>
           </tr>
           </thead>
           <tbody>
           <tr>
             <td><%=customer.getCustomerID() %></td>
             <td><%=customer.getCustomerName() %></td>
             <td><%=customer.getDoB() %></td>
             <td><%=customer.getGender() %></td>
             <td><%=customer.getAddress()  %></td>
             <td><%=customer.getEmail() %></td>
             <td><%=customer.getPhoneNumber()%></td>
             <td><%=customer.getAccumulatedScore()%></td>
             <td><%=customer.getUsername() %></td>
             <td><button>Sửa</button></td>
          </tr>
    </tbody>
           </table>
        </div>
    
    </body>
</html>