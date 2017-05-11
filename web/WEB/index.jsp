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
            #ketqua{
                position:absolute; 
                top:0px;
                left:0px;
                width:96%;
                margin-top:50px;
                margin-left:2%; 
                border:1px solid #ccc;
                background:#ccc;
                border-radius:0 0 5px 5px;
                box-shadow: 5px 5px 5px #888;
            }
            #item:hover{
                background:#888;
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
            <div class="panel panel-danger" style="margin-top: 20px;">
                <div  class="panel-heading" >Lọc sản phẩm</div>
                <div style="position: relative;" class="panel-body">
                    <form  method="get">
                        <input id="tim" type="text" class="form-control" placeholder="Nhập từ muốn tìm kiếm" /> <br>
                        <span id="ketqua"></span>
                        <button type="submit" class="btn btn-default">Tìm kiếm</button>
                        <table>

                            <tr>
                            <h4>Thương Hiệu</h4>
                            <%                            ArrayList<Produce> produce = ProduceDAO.getProduce();
                                for (int i = 0; i < produce.size(); i++) {
                            %>

                            <td><input type="radio"  name="hang" value="<%=produce.get(i).getProduceID()%>"><%=produce.get(i).getProduceName()%>  </td> 
                                <%  }%> 

                            </tr>      

                            <tr>

                                <td><h4>Giá bán</h4></td>                            
                                <td><input type="radio" name="gia" value="1"> dưới 5 triệu    </td>  <td></td>                                
                                <td ><input type="radio"  name="gia"  value="2" > từ 5-7 triệu  </td>   <td></td>                             
                                <td><input type="radio"  name="gia"  value="3"> Từ 7-10 triệu </td>   <td></td>                                  
                                <td><input type="radio"  name="gia"  value="4"> Trên 10 triệu</td>

                            </tr>                         
                            <td >
                                <!--<div class="brands_products" style="margin-right: 100px;">-->
                                <h4>Kích thước Tivi</h4>
                                <div class="brands-name " style="color: #003399;">                            
                                    <input type="radio" id="inlineCheckbox1" name="size" value="32 inch"> 32 inch <br>                                     
                                    <input type="radio" id="inlineCheckbox1" name="size"  value="40 inch"> 40 inch<br>                                    
                                    <input type="radio" id="inlineCheckbox1" name="size" value="43 inch"> 43 inch<br>                                    
                                    <input type="radio" id="inlineCheckbox1" name="size" value="50 inch"> 50 inch<br>
                                    <input type="radio" id="inlineCheckbox1" name="size" value="55 inch"> 55 inch<br>
                                </div>
                                <!--</div>-->
                            </td>
                        </table>     
                    </form>

                </div>
            </div>
            <!--bar-->
            <!--content-->
            <div class="row">
                <%
                    String hang = "";
                    String gia = "";
                    String size = "";
                    if (request.getParameter("size") != null ) {
                        size = request.getParameter("size"); 
                    }
                    if (request.getParameter("gia") != null ) {
                        gia = request.getParameter("gia").trim(); 
                    }
                    if (request.getParameter("hang") != null ) {
                        hang = request.getParameter("hang"); 
                    }

                    ArrayList<Products> product = ProductsDAO.getProductsByProduceslocsp(hang, gia, size);
                    int maxProductDisplay = 4;
                    if (request.getParameter("max") != null) {
                        maxProductDisplay = Integer.parseInt(request.getParameter("max"));
                    }
                    for (int i = 0; i < maxProductDisplay && i<product.size(); i++) {
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                var x_timer;
                $("#tim").keyup(function (e) {
                    clearTimeout(x_timer);
                    var tensanpham = $(this).val();
                    x_timer = setTimeout(function () {
                        tim_sanpham_ajax(tensanpham);
                    }, 2);
                });

                function tim_sanpham_ajax(tensanpham) {
                    $.post('../Search_SanPham_Servlet', {'tensanpham': tensanpham}, function (data) {
                        $("#ketqua").html(data);
                    });
                }
            });

        </script>

    </body>
</html>