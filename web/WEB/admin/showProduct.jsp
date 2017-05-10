<%-- 
    Document   : showProduct
    Created on : May 9, 2017, 3:13:11 PM
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
          <%@include file="header.jsp" %>  
    </head>
    <body>
         <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <div class="gagal" style="position: center; ">
                        DANH SÁCH CÁC SẢN PHẨM             
                    </div>

                    <form action=".." method="post" class="form" role="form">
                        <table class="data" style="font-size: 15px;">
                            <tr class="data">
                                <th class="data">STT</th>
                                <th class="data" >Tên sản phẩm</th>
                                <th class="data">Nhà sản xuất</th> 
                                <th  class="data">Hình ảnh</th>
                                
                                 <th class="data"></th>
                            </tr>
                            <tr class="data">
                            <%
                                 String sql = "SELECT * FROM Products ORDER BY ProductName ;";
                                 ArrayList<Products> product = ProductsDAO.getAllProduct(sql);
                                for (int i = 0; i < product.size(); i++) {
                                            Produce pr = (Produce) ProduceDAO.getProduceByID(product.get(i).getProduceID());
                            %>
                            <td class="data"><%=i + 1%></td>
                            <td class="data" ><%=product.get(i).getProductName()%></td>
                            <td class="data" ><%=pr.getProduceName()%></td>                           
                            <td class="data" >
                                <img src="<%=request.getContextPath()%>/Product/Images/<%=product.get(i).getProductImg()%>" style="width: 30%; margin-left: 20px;">
                            </td>                            
                            <td><a href="detailProduct.jsp?productID=<%=product.get(i).getProductID()%>">Xem chi tiết</a></td>
                        </tr>
                        <%}%>

                    </table>
                </form>
            </div>
            <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
