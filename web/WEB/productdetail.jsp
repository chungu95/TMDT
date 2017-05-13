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
                            <%
                                if (product.getQuantity() <= 0) {
                            %>
                            <h3 class="product-title">HẾT HÀNG</h3>
                            <%} else {%>
                            <h3 class="product-title">CÒN HÀNG</h3>
                            <%}%>
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
                                        <td>Kích thước</td>
                                        <td> <%=product.getProductInfo().getSize()%></td> 
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
                            <%
                                if (product.getQuantity() > 0) {
                            %>
                            <form method ="get" action ="../CartController">
                                <input type="hidden" name ="productID" value="<%=product.getProductID()%>"/>
                                <input type="hidden" name ="cmd" value="add"/>
                                <center><input type ="submit"  class="btn btn-success" style="color: #e4b9b9; background-color: #d0e9c6; padding: 4px ; font-weight: bold" value ="Thêm vào giỏ hàng"/></center>
                            </form>
                            <%}%>



                            <!--<button type="button" class="btn btn-success">Mua ngay</button>-->
                        </div>
                    </div>
                </div>
            </div>
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
