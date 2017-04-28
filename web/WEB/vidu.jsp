<%-- 
    Document   : date
    Created on : Mar 13, 2017, 2:16:21 PM
    Author     : DELL
--%>

<%@page import="dao.ProductsDAO"%>
<%@page import="model.Products"%>
<%@page import="dao.ProduceDAO"%>
<%@page import="model.Produce"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Cart"%>
<%@page import="model.Customers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/headercss.css">
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <link href="css/bootstrap-datepicker.css" rel="stylesheet" />
        <script src="js/bootstrap-datepicker.js"></script>
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

    </head>
    <body>
        <header>  
            <div class="row">
                <div class="logo col-md-6 col-sm-6 col-xs-12"><h1 style="color: yellow;"><span id="title">
                            nhóm 5 
                        </span></h1></div>
                <div class="search col-md-5 col-sm-6 col-xs-12 text-right" style="margin-top: 20px;">
                    <form method="get" action="#">



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
                    <div class="navbar-header"><a class="navbar-brand" href="#">NHÓM 5</a>
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse navbar-menubuilder">
                        <ul class="nav navbar-nav navbar-left">
                            <li><a href="#">TRANG CHỦ</a>
                            </li>
                            <li><a href="#">CHĂM SÓC KHÁCH HÀNG</a>
                            </li>
                            <li><a href="#">KIỂM TRA ĐƠN HÀNG</a>
                            </li>
                            <%                            Customers customer = (Customers) session.getAttribute("customer");
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
                        <form class="navbar-form navbar-left">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Nhập từ muốn tìm kiếm">
                            </div>
                            <button type="submit" class="btn btn-default">Tìm kiếm</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /Navigation -->
        </header>
        <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Lọc sản phẩm
                                    <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <div class="brands_products" >
                                            <h4>Thương Hiệu</h4>
                                            <%                        ArrayList<Produce> produce = ProduceDAO.getProduce();

                                                for (int i = 0; i < produce.size(); i++) {
                                            %>
                                            <div class="brands-name " style="color: #003399;"> 
                                                <ul class="nav nav-pills nav-stacked" >
                                                    <li style="text-align: left"><a href="#"> <span class="pull-left"><%=produce.get(i).getProduceName()%></span></a></li>
                                                </ul> 
                                            </div>
                                            <%  }%> 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="brands_products">
                                            <h4>Giá bán</h4>
                                            <div class="brands-name " style="color: #003399;">                            
                                                <input type="checkbox" id="inlineCheckbox1" value="option1"> dưới 5 triệu <br>                                     
                                                <input type="checkbox" id="inlineCheckbox1" value="option1"> từ 5-7 triệu<br>                                    
                                                <input type="checkbox" id="inlineCheckbox1" value="option1"> Từ 7-10 triệu<br>                                    
                                                <input type="checkbox" id="inlineCheckbox1" value="option1"> Trên 10 triệu<br>
                                            </div>
                                        </div>
                                    </li>
                                    <li><a href="#">Page 1-3</a></li>
                                </ul>
                            </li>

        <div class="container">
            <!--<div class="jumbotron">-->
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <center>
                                <div class="carousel-inner" role="listbox" >
                                    <div class="item active">
                                        <img src="image/28_02_2017_14_47_13_TV-Gia-Tot-800-300.png" alt="first slide" style="width: 100%" >

                                    </div>
                                    <div class="item">
                                        <img src="image/28_02_2017_14_52_50_TV-Samsung-800-300.png" alt="second slide" style="width: 100%">

                                    </div>
                                    <div class="item">
                                        <img src="image/28_02_2017_14_38_03_LG-800-300.png" alt="second slide" style="width: 100%">

                                    </div>
                                </div>
                            </center>

                            <!-- Controls -->
                            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!--</div>-->

            <!--bar-->

            <!--bar-->
            <!--content-->
            <div class="row">
                <%
                    String sql = "SELECT * FROM Products ORDER BY ProductName ;";

                    ArrayList<Products> product = ProductsDAO.getAllProduct(sql);
                    int maxProductDisplay = 4;
                    if (request.getParameter("max") != null) {
                        maxProductDisplay = Integer.parseInt(request.getParameter("max"));
                    }
                    for (int i = 0; i < maxProductDisplay; i++) {
                %>
                <div class="col-md-3" style="width: 350px; height: 550px;">                   
                    <img class="img-responsive" src="../Product/Images/<%=product.get(i).getProductImg()%>" style="width: 100%;">                   
                    <h2 style="color: red"><%=product.get(i).getPrice()%> vnđ</h2>
                    <% Produce pr = (Produce) ProduceDAO.getProduceByID(product.get(i).getProduceID());%>
                    <p align="center" style="color: #2b542c;"><h2><b><%=product.get(i).getProductName()%>    <%=pr.getProduceName()%></b></h2></p>
                    <a href="productdetail.jsp?productID=<%=product.get(i).getProductID()%>"  >Thông tin chi tiết</a>
                    <div class="choose" >
                        <ul class="nav nav-pills nav-justified" style="margin-bottom: 10px;">

                            <li><a href="../CartController?productID=<%=product.get(i).getProductID()%>&cmd=add" style="color: black; background-color: #d0e9c6;"><i class="fa fa-shopping-cart" ></i>Thêm vào giỏ hàng</a></li>
                        </ul> 
                    </div>
                </div> 
                        <% }%>  
            </div>
                           
            <%
                if (maxProductDisplay < product.size() && (maxProductDisplay + 4) < product.size()) {
                    maxProductDisplay += 4;
                    out.print("<center> <a href='?max=" + maxProductDisplay + "'>Xem thêm sản phẩm</a></center>");
                } else if (maxProductDisplay < product.size()) {
                    maxProductDisplay += product.size() - maxProductDisplay;
                    out.print("<center> <a href='?max=" + maxProductDisplay + "'>Xem thêm sản phẩm</a></center>");
                }
            %>
            <!--content-->
        </div>
    </body>
</html>
 <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation" style="margin-top: 15px;">
                <div class="container-fluid">
                    <div class="navbar-header"><a class="navbar-brand" href="#">Lọc sản phẩm</a>
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse navbar-menubuilder">
                        <ul class="nav navbar-nav navbar-left">
                            <li class="dropdown">                            
                                <a  class="dropdown-toggle"  href="#">Thương hiệu                           
                                    <span class="caret"></span></a>                            
                                <ul class="dropdown-menu">
                                    <li><a href="#">lg</a></li>    
                                    <li><a href="#">lg</a></li>
                                </ul> 
                            </li>
                            <li class="dropdown">                            
                                <a  class="dropdown-toggle" href="#">Giá                            
                                    <span class="caret"></span></a>                            
                                <ul class="dropdown-menu">
                                    <li><a href="#">dưới 5 triệu</a></li>    
                                    <li><a href="#">từ 5 - 7 triệu</a></li>
                                    <li><a href="#">Từ 7-10 triệu</a></li>
                                    <li><a href="#">Trên 10 triệu</a></li>
                                </ul> 
                            </li>
                            <li class="dropdown">                            
                                <a  class="dropdown-toggle" href="#">Kích thước Tivi                           
                                    <span class="caret"></span></a>                            
                                <ul class="dropdown-menu">
                                    <li><a href="#">32 inch</a></li>    
                                    <li><a href="#">42 inch</a></li>
                                    <li><a href="#">Từ 7-10 triệu</a></li>
                                    <li><a href="#">Trên 10 triệu</a></li>
                                </ul> 
                            </li>
                        </ul>
                    </div>
                </div>
            </div>