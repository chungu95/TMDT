<%-- 
    Document   : formcustomer
    Created on : Mar 16, 2017, 3:29:29 PM
    Author     : DELL
--%>

<%@page import="model.Customers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WEB BÁN HÀNG</title>      
        <link href="./css/bootstrap-datepicker.css" rel="stylesheet" />
        <script src="./js/bootstrap-datepicker.js"></script>
        <link rel="stylesheet" href="../WEB/css/bootstrap.min.css">
        <link rel="stylesheet" href="../WEB/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../WEB/css/logincss.css">
                
        <!--<script type="text/javascript" src="./WEB/js/jquery-3.1.1.min.js"></script>-->
        <!--<script type="text/javascript" src="./WEB/js/bootstrap.min.js"></script>-->

        <%@include file = "header.jsp"%> 
    </head>
    <body>
        
        <div class="jumbotron" >               
            <center><h3>THÔNG TIN KHÁCH HÀNG</h3> </center>            
        </div>
        <div class="table-bordered " style="font-size: 15px; border-color: black;" >          
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
                        <th> Tên đăng nhập</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%=customer.getCustomerID()%></td>
                        <td><%=customer.getCustomerName()%></td>
                        <td><%=customer.getDoB()%></td>
                        <td><%=customer.getGender()%></td>
                        <td><%=customer.getAddress()%></td>
                        <td><%=customer.getEmail()%></td>
                        <td><%=customer.getPhoneNumber()%></td>
                        <td><%=customer.getAccumulatedScore()%></td>
                        <td><%=customer.getUsername()%></td>                        
                        <td><a href="#edit" class="btn btn-info" data-toggle="collapse">Sửa</a></td>
                        <td><a href="#Pass" class="btn btn-success" data-toggle="collapse" >Đổi Mật Khẩu</a></td>
                    </tr>
                </tbody>
            </table>                        
        </div>
                        
       <form action="../CustomerControl" method="post" class="form" role="form">
        <div id="edit" class="collapse" style="margin-top: 100px;">
           <div class="table-bordered " style="font-size: 15px; border-color: black;" >          
            <table class="table">
                <thead>
                    <tr>                        
                        <th>Tên KH</th>
                        <th>Ngày sinh</th>
                        <th>Giới tính</th>
                        <th>Địa chỉ</th>
                        <th>Email</th>
                        <th>SĐT</th>                       
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>  
                        <input type="hidden" value="<%=customer.getCustomerID()%>" name="customerID">
                        <td><input type="text" class="form-control"  name="Name" value=" <%=customer.getCustomerName()%>" style="width: 50%;"></td>
                        <td><input type="text" class="form-control" id="pickDate" name="DoB" placeholder="Ngày tháng năm sinh" style="width: 300px; padding-left: 20px" required=""/></td>
                        <td><input type="text" class="form-control"  name="sex" value="<%=customer.getGender()%>" style="width: 50%;"></td>
                        <td><input type="text" class="form-control"  name="address" value=" <%=customer.getAddress()%>" style="width: 50%;"></td>
                        <td><input type="text" class="form-control"  name="youremail" value="<%=customer.getEmail()%>" style="width: 50%;"></td>
                        <td><input type="text" class="form-control"  name="Phone" value="<%=customer.getPhoneNumber()%>" style="width: 50%;"></td>                                        
                        <td><button type="submit" class="btn btn-danger"  >Lưu</button></td>                          
                    </tr>                     
                </tbody>
            </table>                        
           </div>
         </div>
       </form>            
                        
         <div id="Pass" class="collapse" style="margin-top: 100px;">
             <form class="form-horizontal" style="width: 80%; padding-left: 100px;">
                 <div class="form-group">
                     <label >Nhập mật khẩu cũ : </label>
                     <input class="form-control" type="password" > 
                 </div>
                 <div class="form-group">
                     <label> Nhập mật khẩu mới : </label>
                     <input class="form-control" type="password">
                 </div>
                 <div class="form-group">
                     <label> Nhập lại mật khẩu mới : </label>
                     <input class="form-control" type="password">
                 </div>
                 <button type="submit" class="btn btn-danger">Lưu</button>
             </form>   
         </div>
     <script>
            $('#pickDate').datepicker({
                'format': 'dd-mm-yyyy',
                'autoclose': true,
                'language': 'vi'
            });
            $('#pickDate').datepicker('setDate', new Date(1995, 01, 10));
            $('#pickDate').datepicker('update');
            $('#pickDate').val('');   
            </script>                  
    </body>
</html>
