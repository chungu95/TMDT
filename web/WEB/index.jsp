<%-- 
    Document   : index
    Created on : Mar 9, 2017, 4:38:13 PM
    Author     : ADMIN
--%>

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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/mycss.css">
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>        
        <%@include file="header.jsp" %>
    </head>
    <body>
        <section>
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
                        </section>
        <div class="col-sm-3">
            <div class="left-sidebar" style="margin-top: 50px; margin-left: 100px; " >
                <div class="brands_products" >
                    <h2>Thương Hiệu</h2>
                    <div class="brands-name " >
                            <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#"> <span class="pull-right">(50)</span>LG</a></li>
                                    <li><a href="#"> <span class="pull-right">(56)</span>SamSung</a></li>
                                    <li><a href="#"> <span class="pull-right">(27)</span>Sony</a></li>
                                    <li><a href="#"> <span class="pull-right">(32)</span>Panasonic</a></li>
                                    
                            </ul>
                    </div>
            </div>
                 <div class="brands_products">
                    <h2>Giá bán</h2>
                    <div class="brands-name " style="color: #003399;">                            
                        <input type="checkbox" id="inlineCheckbox1" value="option1"> dưới 5 triệu <br>                                     
                        <input type="checkbox" id="inlineCheckbox1" value="option1"> từ 5-7 triệu<br>                                    
                        <input type="checkbox" id="inlineCheckbox1" value="option1"> Từ 7-10 triệu<br>                                    
                        <input type="checkbox" id="inlineCheckbox1" value="option1"> Trên 10 triệu<br>
                    </div>
            </div>
            </div>
        </div>
        
        <div id="wrapper">
            <div class="container">
                <div class="row">   
                    <div class="content col-md-9 col-sm-9 col-xs-12">

                        
                        
                        <div class="row">
<<<<<<< HEAD
                            <div class="box-index col-lg-9">
                                <h2>Thông tin </h2>

                                <div class="row">
                                    <%                                        
                                        ArrayList<Products> product = ProductsDAO.getAllProduct();
                                        for (int i = 0; i < product.size(); i++) {
                                    %>
                                    <div class="item col-md-3 col-sm-3 col-xs-6">
                                        <span><a href="../Product/Images/<%=product.get(i).getProductImg()%>" target="_blank" class="thumbnail"><img src="../Product/Images/<%=product.get(i).getProductImg()%>"></a></span>
                                        <h3><a href="#">xem</a></h3>
                                    </div>
                                    <% }%>
                                </div>      
                            </div>
                            <div class="col-lg-3">
                                <div class="checkbox">
                                    <h3>Thương hiệu</h3>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="inlineCheckbox1" value="option1"> LG
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="inlineCheckbox1" value="option1"> SamSung
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="inlineCheckbox1" value="option1"> Sony
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="inlineCheckbox1" value="option1"> Panasonic
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <h3>Giá bán</h3>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="inlineCheckbox1" value="option1"> dưới 5 triệu
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="inlineCheckbox1" value="option1"> từ 5-7 triệu
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="inlineCheckbox1" value="option1"> Từ 7-10 triệu
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="inlineCheckbox1" value="option1"> Trên 10 triệu
                                    </label>
                                </div>
                            </div>    
                        </div>
=======
                      
                                <%                                    for (int i = 0; i < product.size(); i++) {
                                %>
                               
                                <div class="col-sm-3" style="margin: 30px 30px; background-color: #e7e7e7;">      
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                               <img src="../Product/Images/<%=product.get(i).getProductImg()%>" style="width: 100%;">
                                               <h2 style="color: red"><%=product.get(i).getPrice()%> vnđ</h2>
                                               <p align="center" style="color: #2b542c;"><h2><b><%=product.get(i).getProductName()%></b></h2></p>
                                                 <a href="#"  >Thông tin chi tiết</a>
                                             </div>
                                              <div class="choose" >
                                                  <ul class="nav nav-pills nav-justified" style="margin-bottom: 10px;">
                                                      
                                                      <li><a href="#" style="color: black; background-color: #d0e9c6;"><i class="fa fa-shopping-cart" ></i>Thêm vào giỏ hàng</a></li>
                                                  </ul>
                                              </div>
                                        </div>
                                    </div>
                                    </div>
                                <% }%>
                          
>>>>>>> tuyettrinh
                    </div>
                                
                </div>
            </div>
        </div>
</div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
