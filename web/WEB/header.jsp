<%@page import="model.Customers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/mycss.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<header>
    <div class="container">
        <div class="row">
            <div class="logo col-md-6 col-sm-6 col-xs-12"><h1 style="color: yellow;"><img src="image/ten.PNG"></h1></div>
            <div class="search col-md-6 col-sm-6 col-xs-12 text-right">
                <form method="get" action="#">
                    <input type="text" placeholder="Nhập từ khóa tìm kiếm" id="q" name="q" value="" style="padding: 10px">
                    <input type="submit" value="Tìm Kiếm">  
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#" style="color: yellow;">Giỏ hàng</a></li>        
                    </ul>
                </form>           
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="header-menu">
            <!-- Menu do Bootstrap cung cấp có hỗ trợ menu trên di động -->
            <div id="custom-bootstrap-menu" class="navbar navbar-default">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">TRANG CHỦ</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">            
                        <li><a href="#">CHĂM SÓC KHÁCH HÀNG</a></li>
                        <li><a href="#">KIỂM TRA ĐƠN HÀNG</a></li>
                       
                            <%
                                Customers customer = (Customers) session.getAttribute("customer");
                                if (customer == null) {
                                    out.print("<li><a href='reg.jsp'>ĐĂNG KÝ</a></li>"
                                            + "<li><a href='login.jsp'>ĐĂNG NHẬP</a></li>");
                                } else {
                                    
                                    out.print("<li><a href='formcustomer.jsp'> XEM THÔNG TIN TÀI KHOẢN </a></li>");
                                    out.print("<li><a href='#'> ĐĂNG XUẤT </a></li>");
                                    out.print("<div>");
                                    out.print("<li>Xin chào " + customer.getCustomerName() + "</li>");
                                    out.print("</div>");
                                }
                            %>
                                    
                               

                    </ul>
                </div>
            </div>
            <!-- End Menu Bootstrap -->
            
        </div>
    </div>
</header>