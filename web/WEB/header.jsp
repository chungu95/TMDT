<%@page import="java.util.ArrayList"%>
<%@page import="model.Products"%>
<%@page import="model.Products"%>
<%@page import="dao.ProductsDAO"%>
<%@page import="model.Customers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/mycss.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style>
    #title{font-family: "Brush Script MT"; border: 0 ;margin-bottom: auto ;  padding: auto ; text-align: center; ;  color: darkgrey; font-weight: bold; font-size: 75pt;
           text-shadow: 1px 1px 0 bisque , 2px 2px 0 firebrick , 3px 3px 0 firebrick, 4px 4px 0 firebrick , 5px 5px 0 firebrick , 6px 6px 0 firebrick, 0 -2px firebrick ,-2px 0 bisque, 2px 0 firebrick, 0 3px firebrick
    }  
    #xxx{color: #003399}
</style>
<header>
    <div class="container">
        <div class="row">
            <div class="logo col-md-6 col-sm-6 col-xs-12"><h1 style="color: yellow;"><span id="title">
                        Nhóm 5
                    </span></h1></div>
            <div class="search col-md-5 col-sm-6 col-xs-12 text-right" style="margin-top: 20px;">
                <form method="get" action="#">
                    <input type="text" placeholder="Nhập từ khóa tìm kiếm" id="q" name="q" value="" style="padding: 10px; margin-right: 5px;">
                    <input type="submit" value="Tìm Kiếm">  

                    <span style="font-size: 20pt" class="glyphicon glyphicon-shopping-cart"></span>

                </form>           
            </div>
            <div class="clearfix"></div>
        </div>

        <div class="header-menu"><center>
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
                            <li><a href="Help.jsp">CHĂM SÓC KHÁCH HÀNG</a></li>
                            <li><a href="#">KIỂM TRA ĐƠN HÀNG</a></li>

                            <%
                                Customers customer = (Customers) session.getAttribute("customer");
                                if (customer == null) {
                                    out.print("<li><a href='reg.jsp'>ĐĂNG KÝ</a></li>"
                                            + "<li><a href='login.jsp'>ĐĂNG NHẬP</a></li>");
                                } else {

                                    out.print("<li><a href='formcustomer.jsp'> XEM THÔNG TIN TÀI KHOẢN </a></li>");
                                    out.print("<li><a href='../Logout'> ĐĂNG XUẤT </a></li>");
                                    out.print("<div>");
                                    out.print("<li>Xin chào " + customer.getCustomerName() + "</li>");
                                    out.print("</div>");
                                }
                            %>
                        </ul>
                    </div>
                </div>
                <!-- End Menu Bootstrap -->
            </center>
        </div>
    </div>
</header>