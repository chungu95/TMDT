<%-- 
    Document   : updateProduct
    Created on : May 8, 2017, 10:45:08 PM
    Author     : DELL
--%>

<%@page import="dao.ProductsDAO"%>
<%@page import="model.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProduceDAO"%>
<%@page import="model.Produce"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sửa sản phẩm</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css"> 
        <script src="<c:url value="/WEB/ckeditor/ckeditor.js" />"></script>
        <%@include file="header.jsp" %>  
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
            <form method="post" action="<%=request.getContextPath()%>/updateProduct">
                <%            try {
                        Products product = (Products) ProductsDAO.getProductByID(request.getParameter("productID"));
                        Produce produce = (Produce) ProduceDAO.getProduceByID(product.getProductID());
                %>
                <div id="rightContent">
                    <h3>SỬA SẢN PHẨM</h3>
                    <div class="informasi">
                        SẢN PHẨM
                    </div>

                    <table width="95%">
                        <input type="hidden" name="productID" value="<%=product.getProductID()%>" />
                        <tr><td width="125px"><b>Nhập tên sản phẩm</b></td><td><input type="text" class="pendek" name="productName" value="<%=product.getProductName()%>" required=""></td></tr>

                        <tr><td><b>Chọn nhà sản xuất</b></td><td>                               
                                <select name="produceID" required="">
                                    <option value="<%=produce.getProduceID()%>" selected=""><%=produce.getProduceName()%></option>
                                    <%            ArrayList<Produce> pro = ProduceDAO.getProduce();

                                        for (int i = 0; i < pro.size(); i++) {
                                    %>
                                    <option value="<%=pro.get(i).getProduceID()%>" >
                                        <%=pro.get(i).getProduceName()%>
                                    </option>
                                    <%  }%>
                                </select>
                            </td></tr>
                        <tr><td><b>Giá sản phẩm</b></td><td><input type="number"  value="<%=product.getPrice()%>" class="sedang" name="price" required=""></td></tr>   
                        <tr><td><b>Miêu tả</b></td>
                            <td>

                                <textarea class="form-textarea" id="content" name="description" required="" ><%=product.getDescription()%></textarea>
                                <script type="text/javascript" language="javascript">
                                    CKEDITOR.replace('content', {width: '500px', height: '300px'});
                                </script>
                            </td>
                        </tr>
                        <tr><td><b>Số lượng </b></td><td><input type="number" class="sedang" value="<%=product.getQuantity()%>" name="quantity" required=""></td></tr> 
<!--                        <tr><td><b>Hình ảnh</b></td><td><input type="file" name="productImage" accept="image/*" value="<%=product.getProductImg()%>" required=""/></td></tr>  -->
                    </table>
                    <div class="informasi">
                        THÔNG TIN CHI TIẾT SẢN PHẨM
                    </div>
                    <table width="95%">
                        <tr><td width="125px"><b>Nhập loại tivi</b></td><td><input type="text" name="productType"  value="<%=product.getProductInfo().getProductType()%>" class="pendek" required=""></td></tr>
                        <tr><td width="125px"><b>Độ phân giải</b></td><td><input type="text" name="resolution" value="<%=product.getProductInfo().getResolution()%>" class="pendek" required=""></td></tr>                        
                        <tr><td width="125px"><b>HDMI</b></td><td><input type="text" name="hdmi" class="pendek" value="<%=product.getProductInfo().getHdmi()%>" required=""></td></tr>
                        <tr><td width="125px"><b>USB</b></td><td><input type="text"  name="usb" value="<%=product.getProductInfo().getUsb()%>" class="pendek" required=""></td></tr>
                        <tr><td width="125px"><b>Model</b></td><td><input type="text" name="Model" value="<%=product.getProductInfo().getModel()%>" class="pendek" required=""></td></tr>
                        <tr><td><b>Kích thước màn hình Tivi</b></td><td>
                                <input type="radio" name="size" id="radio" value="<%=product.getProductInfo().getSize()%>" checked=""><%=product.getProductInfo().getSize()%>
                                <input type="radio" name="size" id="radio" value="32 inch" >32 inch
                                <input type="radio" name="size" id="radio" value="40 inch">40 inch
                                <input type="radio" name="size" id="radio" value="43 inch">43 inch
                                <input type="radio" name="size" id="radio" value="48 inch">48 inch
                                <input type="radio" name="size" id="radio" value="49 inch">49 inch
                                <input type="radio" name="size" id="radio" value="50 inch">50 inch
                                <input type="radio" name="size" id="radio" value="55 inch">55 inch
                                <input type="radio" name="size" id="radio" value="60 inch">60 inch
                                <input type="radio" name="size" id="radio" value="65 inch">65 inch
                                <input type="radio" name="size" id="radio" value="70 inch">70 inch
                            </td></tr>
                        <tr><td><b>Thời gian bảo hành</b></td><td>
                                <select name="warranty" required="">
                                    <option selected="" value="<%=product.getProductInfo().getWarranty()%>"><%=product.getProductInfo().getWarranty()%></option>
                                    <option value="12 tháng">12 tháng</option>
                                    <option value="24 tháng">24 tháng</option>
                                    <option value="48 tháng">48 tháng</option>
                                </select>

                        <tr><td></td><td>                               
                                <button type="submit" class="button" name="sub" value="update">Sửa</button>

                            </td></tr>
                    </table>
                </div>
                <div class="clear"></div>
            </form>
            <jsp:include page="footer.jsp"></jsp:include>
            </div>
        <%} catch (Exception ex) {
                out.print("<center><b style = 'color:red'>Không có sản phẩm này!</b></center>");
            }
        %>
    </body>
</html>
