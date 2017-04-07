
<%@page import="model.Cart"%>
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
<link rel="stylesheet" href="css/headercss.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style>
    #title{font-family: "Brush Script MT"; border: 0 ;margin-bottom: auto ;  padding: auto ; text-align: center; ;  color: darkgrey; font-weight: bold; font-size: 75pt;
           text-shadow: 1px 1px 0 bisque , 2px 2px 0 firebrick , 3px 3px 0 firebrick, 4px 4px 0 firebrick , 5px 5px 0 firebrick , 6px 6px 0 firebrick, 0 -2px firebrick ,-2px 0 bisque, 2px 0 firebrick, 0 3px firebrick
    }  
    #xxx{color: #003399}
    .nut{
        width: 50px;
        height: 50px;
        float: right;
        margin-top: 50px;
        position: relative;

    }
    .nut img{
        width: 100%;
        height: 100%;



    }
    .nut span {
        color: red;
        position: absolute;
        top: -7px;
        left: 30px;
        font-size: 25px;
        font-family: time new roman;


    }
</style>
<header>  
    <div class="row">
        <div class="logo col-md-6 col-sm-6 col-xs-12"><h1 style="color: yellow;"><span id="title">
                 Tivi-Shop 
                </span></h1></div>
        <div class="search col-md-5 col-sm-6 col-xs-12 text-right" style="margin-top: 20px;">
            <form method="get" action="#">

                <input type="text" class="form-control" placeholder="Nhập từ muốn tìm kiếm">

                <button type="submit" class="btn btn-default">Tìm kiếm</button>


                <%
                    Cart cart;
                    if (session.getAttribute("cart") == null) {
                        cart = new Cart();
                    } else {
                        cart = (Cart) session.getAttribute("cart");
                    }
                %>
                <div class="nut"> 
                    <span><b><%=cart.getTotalQuantity()%></b></span>
                    <a href="cart.jsp"><img src="image/cave.png" alt=""/></a>
                </div>


            </form>           
        </div>
        <div class="clearfix"></div>
    </div>
    <!-- Navigation -->
    <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
        <div class="container-fluid">

            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-left">
                    <li><a href="index.jsp">TRANG CHỦ</a>
                    </li>
                    <li><a href="Help.jsp">CHĂM SÓC KHÁCH HÀNG</a>
                    </li>
                    <li><a href="checkorders.jsp">KIỂM TRA ĐƠN HÀNG</a>
                    </li>
                    <%
                        Customers customer = (Customers) session.getAttribute("customer");
                        if (customer == null) {
                            out.print("<li><a href='reg.jsp'>ĐĂNG KÝ</a></li>"
                                    + "<li><a href='login.jsp'>ĐĂNG NHẬP</a></li>");
                        } else {
                            out.print("<li><a href='formcustomer.jsp'> XEM THÔNG TIN TÀI KHOẢN </a></li>");
                            out.print("<li><a href='../Logout'> ĐĂNG XUẤT </a></li>");
                            out.print("<div><center>");
                            out.print("<li>Xin chào " + customer.getCustomerName() + "</li>");
                            out.print("</center></div>");
                        }
                    %>

                </ul>

            </div>
        </div>
    </div>
    <!-- /Navigation -->
</header>