<%-- 
    Document   : productdetail
    Created on : Mar 26, 2017, 3:18:02 PM
    Author     : DELL
--%>

<%@page import="dao.ProduceDAO"%>
<%@page import="model.Produce"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/productdetail.css">
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <%            try {
                Products product = (Products) ProductsDAO.getProductByID(request.getParameter("productID"));
                Produce produce = (Produce) ProduceDAO.getProduceByID(product.getProduceID());
        %>
        <div class="container">
            <div class="card">
                <div class="container-fliud">
                    <div class="wrapper row">
                        <div class="preview col-md-6">
                            <div class="preview-pic tab-content">
                                <div class="tab-pane active" id="pic-1"><img src="../Product/Images/<%=product.getProductImg()%>" alt="">
                                </div> 
                                <div class="tab-pane" id="pic-2"><img src="../Product/Images/<%=product.getProductImg()%>" alt="">
                                </div>                                
                            </div>
                            <ul class="preview-thumbnail nav nav-tabs"> 
                                <li class="active"><a data-target="#pic-1" data-toggle="tab">
                                        <img src="../Product/Images/<%=product.getProductImg()%>" alt=""></a>
                                </li> 
                                <li><a data-target="#pic-2" data-toggle="tab">
                                        <img src="../Product/Images/<%=product.getProductImg()%>" alt=""></a>
                                </li>                                  
                            </ul>
                        </div>
                        <div class="details col-md-6">
                            <h3 class="product-title"><%=product.getProductName()%>     (<%=product.getProductInfo().getModel()%>)</h3>

                            <p class="product-description"><%=product.getProductInfo().getSize()%></p>
                            <h4 class="price" style="color: red;">GIÁ BÁN : <%=product.getPrice()%> VNĐ</h4>
                            <table class="table table-striped" >
                                <thead>
                                    <tr>
                                        <th> Thông số kỹ thuật</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Nhà sản xuất</td>
                                        <td> <%=produce.getProduceName()%></td> 
                                    </tr>
                                    <tr>
                                        <td>Độ phân giải</td>
                                        <td> <%=product.getProductInfo().getResolution()%></td>
                                    </tr>
                                    <tr>
                                        <td>HDMI</td>
                                        <td><%=product.getProductInfo().getHdmi()%></td>
                                    </tr>
                                    <tr>
                                        <td>USB</td>
                                        <td><%=product.getProductInfo().getUsb()%></td>
                                    </tr>                                    
                                    <tr>
                                        <td>Bảo hành</td>
                                        <td><%=product.getProductInfo().getWarranty()%></td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-success">Mua ngay</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
        <%} catch (Exception ex) {
                 out.print("<center><b style = 'color:red'>Không có sản p //hầm này!</b></center>"); 
            }
        %>
    </body>
</html>
