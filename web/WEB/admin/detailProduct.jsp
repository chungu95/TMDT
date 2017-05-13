<%-- 
    Document   : detailProduct
    Created on : Mar 31, 2017, 4:28:08 PM
    Author     : DELL
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Produce"%>
<%@page import="dao.ProduceDAO"%>
<%@page import="dao.ProductsDAO"%>
<%@page import="model.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết sản phẩm</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css">
        <link rel="stylesheet" href="admincss/detailcss.css">
        <%@include file="header.jsp" %>  
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

            <%            try {
                    Products product = (Products) ProductsDAO.getProductByID(request.getParameter("productID"));
                    Produce produce = (Produce) ProduceDAO.getProduceByID(product.getProduceID());
            %>

            <div id="rightContent">
                <h3>THÔNG TIN CHI TIẾT SẢN PHẨM</h3>

                <div class="informasi">
                    SẢN PHẨM
                </div>
                <table class="data">
                    <tr class="data">
                        <th class="data" >Tên sản phẩm</th>
                        <th class="data">Nhà sản xuất</th>
                        <th class="data">Giá</th>
                        <th class="data">Miêu tả</th>
                        <th class="data">Số lượng</th>
                        <th class="data">Hình ảnh</th>
                       
                    </tr>
                    <tr class="data">
                        <td class="data"><%=product.getProductName()%></td>
                        <td class="data"><%=produce.getProduceName()%></td>
                        <td class="data"><%=product.getPrice()%></td>
                        <td class="data"><%=product.getDescription()%></td>
                        <td class="data" ><%=product.getQuantity()%></td>
                        <td class="data" ><%=product.getProductImg()%></td>                         
                    </tr>
                </table>
                <div class="informasi">
                    CHI TIẾT SẢN PHẨM
                </div>
                <table class="data">
                    <tr class="data">
                        <th class="data" >Độ phân giải</th>
                        <th class="data">HDMI</th>
                        <th class="data">USB</th>
                        <th class="data">Model</th>
                        <th class="data">Kích thước màn hình</th>
                        <th class="data">Bảo hành</th>
                        <th  class="data"></th>
                    </tr>
                    <tr class="data">
                        <td class="data"><%=product.getProductInfo().getResolution()%></td>
                        <td class="data"><%=product.getProductInfo().getHdmi()%></td>
                        <td class="data"><%=product.getProductInfo().getUsb()%></td>
                        <td class="data"><%=product.getProductInfo().getModel()%></td>
                        <td class="data" ><%=product.getProductInfo().getSize()%></td>
                        <td class="data" ><%=product.getProductInfo().getWarranty()%></td> 
                        <td>
                           
                            <a href="updateProduct.jsp?productID=<%=product.getProduceID()%>" class="button" data-toggle="collapse" style="background-color: #e4b9c0; size: 15pt;">Sửa</a>                            
                        </td>
                    </tr>
                </table> 

               
            </div>
            <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>
            </div>
        <%} catch (Exception ex) {
                out.print("<center><b style = 'color:red'>Không có sản p //hầm này!</b></center>");
            }
        %>
    </body>
</html>
