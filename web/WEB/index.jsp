<%-- 
    Document   : index
    Created on : Mar 9, 2017, 4:38:13 PM
    Author     : ADMIN
--%>

<%@page import="dao.ProduceDAO"%>
<%@page import="model.Produce"%>
<%@page import="dao.ProductsDAO"%>
<%@page import="model.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>WEB BÁN HÀNG</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/mycss.css">
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>        
        <%@include file="header.jsp" %>
        <style>
            #custom-bootstrap-menu.navbar-default .navbar-brand {
                color: rgba(130, 125, 125, 1);
            }
            #custom-bootstrap-menu.navbar-default {
                font-size: 17px;
                background-color: rgba(248, 248, 248, 1);
                border-width: 1px;
                border-radius: 4px;
            }
            #custom-bootstrap-menu.navbar-default .navbar-nav>li>a {
                color: rgba(15, 1, 1, 1);
                background-color: rgba(248, 248, 248, 0);
            }
            #custom-bootstrap-menu.navbar-default .navbar-nav>li>a:hover,
            #custom-bootstrap-menu.navbar-default .navbar-nav>li>a:focus {
                color: rgba(51, 51, 51, 1);
                background-color: rgba(219, 151, 151, 1);
            }
            #custom-bootstrap-menu.navbar-default .navbar-nav>.active>a,
            #custom-bootstrap-menu.navbar-default .navbar-nav>.active>a:hover,
            #custom-bootstrap-menu.navbar-default .navbar-nav>.active>a:focus {
                color: rgba(85, 85, 85, 1);
                background-color: rgba(231, 231, 231, 1);
            }
            #custom-bootstrap-menu.navbar-default .navbar-toggle {
                border-color: #ddd;
            }
            #custom-bootstrap-menu.navbar-default .navbar-toggle:hover,
            #custom-bootstrap-menu.navbar-default .navbar-toggle:focus {
                background-color: #ddd;
            }
            #custom-bootstrap-menu.navbar-default .navbar-toggle .icon-bar {
                background-color: #888;
            }
            #custom-bootstrap-menu.navbar-default .navbar-toggle:hover .icon-bar,
            #custom-bootstrap-menu.navbar-default .navbar-toggle:focus .icon-bar {
                background-color: #888;
            }
        </style>
    </head>
    <body>


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
            <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation" style="margin-top: 15px;">
                <div class="container-fluid">
                    <div class="navbar-header"><a class="navbar-brand" href="#">Lọc sản phẩm</a>
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse navbar-menubuilder">
                        <ul class="nav navbar-nav navbar-left">
                            <li class="dropdown">                            
                                <a  class="dropdown-toggle" data-toggle="dropdown"  href="#">Thương hiệu                           
                                    <span class="caret"></span></a>                            
                                <ul class="dropdown-menu">
                                    <li><a href="#">lg</a></li>    
                                    <li><a href="#">lg</a></li>
                                </ul> 
                            </li>
                            <li class="dropdown">                            
                                <a  class="dropdown-toggle" data-toggle="dropdown"  href="#">Giá                            
                                    <span class="caret"></span></a>                            
                                <ul class="dropdown-menu">
                                    <li><a href="#">dưới 5 triệuzz</a></li>    
                                    <li><a href="#">từ 5 - 7 triệu</a></li>
                                    <li><a href="#">Từ 7-10 triệu</a></li>
                                    <li><a href="#">Trên 10 triệu</a></li>
                                </ul> 
                            </li>
                            <li class="dropdown">                            
                                <a  class="dropdown-toggle" data-toggle="dropdown"  href="#">Kích thước Tivi                           
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
            <!--bar-->
            <!--content-->
            <div class="row">
                <%                    String sql = "SELECT * FROM Products WHERE ProductID LIKE '%%'";

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
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>