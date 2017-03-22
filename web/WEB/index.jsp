<%-- 
    Document   : index
    Created on : Mar 9, 2017, 4:38:13 PM
    Author     : ADMIN
--%>

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
        
        <div id="wrapper">
            <div class="container">
                <div class="row">   
                    <div class="content col-md-9 col-sm-9 col-xs-12">
                       
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
                        <div class="row">
                        <div class="box-index col-lg-9">
                            <h2>Thông tin </h2>
                            <div class="row">
                                <div class="item col-md-3 col-sm-3 col-xs-6">
                                    <span><a href="#" class="thumbnail"><img src="http://placehold.it/200x200"></a></span>
                                    <h3><a href="#">Tiêu đề bài viết</a></h3>
                                </div>
                                <div class="item col-md-3 col-sm-3 col-xs-6">
                                    <span><a href="#" class="thumbnail"><img src="http://placehold.it/200x200"></a></span>
                                    <h3><a href="#">Tiêu đề bài viết</a></h3>
                                </div>
                                <div class="item col-md-3 col-sm-3 col-xs-6">
                                    <span><a href="#" class="thumbnail"><img src="http://placehold.it/200x200"></a></span>
                                    <h3><a href="#">Tiêu đề bài viết</a></h3>
                                </div>
                                <div class="item col-md-3 col-sm-3 col-xs-6">
                                    <span><a href="#" class="thumbnail"><img src="http://placehold.it/200x200"></a></span>
                                    <h3><a href="#">Tiêu đề bài viết</a></h3>
                                </div>
                                <div class="item col-md-3 col-sm-3 col-xs-6">
                                    <span><a href="#" class="thumbnail"><img src="http://placehold.it/200x200"></a></span>
                                    <h3><a href="#">Tiêu đề bài viết</a></h3>
                                </div>
                                <div class="item col-md-3 col-sm-3 col-xs-6">
                                    <span><a href="#" class="thumbnail"><img src="http://placehold.it/200x200"></a></span>
                                    <h3><a href="#">Tiêu đề bài viết</a></h3>
                                </div>
                                <div class="item col-md-3 col-sm-3 col-xs-6">
                                    <span><a href="#" class="thumbnail"><img src="http://placehold.it/200x200"></a></span>
                                    <h3><a href="#">Tiêu đề bài viết</a></h3>
                                </div>
                                <div class="item col-md-3 col-sm-3 col-xs-6">
                                    <span><a href="#" class="thumbnail"><img src="http://placehold.it/200x200"></a></span>
                                    <h3><a href="#">Tiêu đề bài viết</a></h3>
                                </div>
                            </div>                        
                        </div> 
                            <div class="col-lg-3" >                                
                                <div class="checkbox">                                
                                <h3 class="w3-wide"><b>Thương hiệu</b></h3>
                                <label class="checkbox-inline">
                                      <input type="checkbox" id="inlineCheckbox1" value="option1"> LG
                                </label>
                               <label class="checkbox-inline">
                                       <input type="checkbox" id="inlineCheckbox2" value="option2"> Samsung
                               </label>
                               <label class="checkbox-inline">
                                       <input type="checkbox" id="inlineCheckbox3" value="option3"> Sony
                               </label>
                                <label class="checkbox-inline">
                                       <input type="checkbox" id="inlineCheckbox3" value="option3"> Panasonic
                               </label>
                                </div>
                                <div class="checkbox">                                
                                <h3 class="w3-wide"><b>Giá bán </b></h3>
                                <label class="checkbox-inline">
                                      <input type="checkbox" id="inlineCheckbox1" value="option1"> LG
                                </label>
                               <label class="checkbox-inline">
                                       <input type="checkbox" id="inlineCheckbox2" value="option2"> Samsung
                               </label>
                               <label class="checkbox-inline">
                                       <input type="checkbox" id="inlineCheckbox3" value="option3"> Sony
                               </label>
                                <label class="checkbox-inline">
                                       <input type="checkbox" id="inlineCheckbox3" value="option3"> Panasonic
                               </label>
                                </div>
                            </div>   
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
