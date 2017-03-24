<%-- 
    Document   : detail
    Created on : Mar 22, 2017, 8:45:52 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WEB BÁN HÀNG</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/mycss.css">
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <div class="w3-container w3-teal w3-margin-bottom" style="font-variant-alternates:">
               <h1>Tên sản phẩm</h1>
        </div>
        <section>
                            <div class="container"> 
                                <div class="row">
                                    <div class="col-lg-6" style="margin-top: 20px;">
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
                                                    <img src="../Product/Images/QWERTY/t1.jpg" alt="first slide" style="width: 100%" >

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
                                    <div class="col-lg-6">
                                        <h2> Tên Sản phẩm</h2>
                                        <p> Giá sp </p>
                                        <p></p>
                                        <button type="button" class="btn btn-success">Mua ngay</button>
                                      
                                        
                                    </div>
                                </div>
                            </div>
         </section>
        
        <table class="table table-striped">
                <thead>
                    <tr>
                        <th> Thông tin chung</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td> Độ phân giải</td>
                        <td> dedie</td>
                    </tr>
                    <tr>
                        <td>HDMI</td>
                        <td>dejie</td>
                    </tr>
                    <tr>
                        <td>USB</td>
                        <td>dejie</td>
                    </tr>
                    <tr>
                        <td>Audio</td>
                        <td></td>
                    </tr>
                </tbody>
         </table>
        
        <!-- Contact-->
        <div class="container" id="contact">
              <h2>Liên hệ</h2>    
             <p>Bạn có câu hỏi, thắc mắc hãy liên hệ với chúng tôi: </p>
             <form action="/action_page.php" target="_blank" style="margin-bottom: 100px;">
               <p><input class="input border" type="text" placeholder="Tên Đăng nhập" required name="Name" style="width: 100%;"></p>
                 <p><input class="input border" type="text" placeholder="Email" required name="Email" style="width: 100%;"></p>
                 <p><textarea class="form-control" rows="3" placeholder="Lời nhắn" name="Message" style="width: 100%;"></textarea></p>
                <button type="submit" class="btn btn-success">Gửi phản hồi</button>
                 
             </form>
        </div>
        <footer >
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
