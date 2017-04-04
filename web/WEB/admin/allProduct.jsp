<%-- 
    Document   : allProduct
    Created on : Mar 31, 2017, 12:42:45 PM
    Author     : DELL
--%>

<%@page import="dao.ProduceDAO"%>
<%@page import="model.Produce"%>
<%@page import="dao.ProductsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xem các sản phẩm</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css">
    </head>
    <body>
        <%@include file="header.jsp" %>  
        <div class="rightbar" style="margin: 30px 30px;">
                <input type="text" placeholder="Nhập Model sản phẩm" id="" name="" value="" style="padding: 10px; margin-right: 5px;">
                <input type="submit" value="Tìm Kiếm"> 
            </div>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <div class="tab-content">
                        <div class="tab-pane fade active in" style="margin-left: 150px;">
                        <%
                            String sql = "SELECT * FROM Products ORDER BY ProductName ;";

                            ArrayList<Products> product = ProductsDAO.getAllProduct(sql);
                            int maxProductDisplay = 3;
                            if (request.getParameter("max") != null) {
                                maxProductDisplay = Integer.parseInt(request.getParameter("max"));
                            }
                            for (int i = 0; i < maxProductDisplay; i++) {
                        %>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%=request.getContextPath()%>/Product/Images/<%=product.get(i).getProductImg()%>" style="width: 50%;">
                                        <% Produce pr = (Produce) ProduceDAO.getProduceByID(product.get(i).getProduceID());%>
                                        <h3 style="color: red;"><%=product.get(i).getProductName()%>    <%=pr.getProduceName()%></h3>                                    
                                        <a href="detailProduct.jsp?productID=<%=product.get(i).getProductID()%>" style="font-size: 15pt;">Thông tin chi tiết</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% }%>
                    </div>
                    <%
                        if (maxProductDisplay < product.size() && (maxProductDisplay + 3) < product.size()) {
                            maxProductDisplay += 3;
                            out.print("<center> <a href='?max=" + maxProductDisplay + "'>Xem thêm sản phẩm</a></center>");
                        } else if (maxProductDisplay < product.size()) {
                            maxProductDisplay += product.size() - maxProductDisplay;
                            out.print("<center> <a href='?max=" + maxProductDisplay + "'>Xem thêm sản phẩm</a></center>");
                        }
                    %>
                </div>
            </div>
            <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>

    </body>
</html>
