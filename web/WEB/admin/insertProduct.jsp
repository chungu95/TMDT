<%-- 
    Document   : insertProduct
    Created on : Mar 31, 2017, 10:49:36 AM
    Author     : DELL
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProduceDAO"%>
<%@page import="model.Produce"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>thêm sản phẩm</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css"> 
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <form method="post" action="<%=request.getContextPath()%>/insertProduct" >
                    <div id="rightContent">
                        <h3>THÊM SẢN PHẨM</h3>

                        <div class="informasi">
                            SẢN PHẨM
                        </div>

                        <table width="95%">
                            <tr><td width="125px"><b>Nhập tên sản phẩm</b></td><td><input type="text" class="pendek" name="productName" required=""></td></tr>

                            <tr><td><b>Chọn nhà sản xuất</b></td><td>                               
                                    <select name="produceID" required="">
                                    <%            ArrayList<Produce> produce = ProduceDAO.getProduce();

                                        for (int i = 0; i < produce.size(); i++) {
                                    %>
                                    <option value="<%=produce.get(i).getProduceID()%>" selected>
                                        <%=produce.get(i).getProduceName()%>
                                    </option>
                                    <%  }%>
                                </select>
                            </td></tr>
                            <tr><td><b>Giá sản phẩm</b></td><td><input type="number" class="sedang" name="price" required=""></td></tr>   
                            <tr><td><b>Miêu tả</b></td><td><textarea name="description" required=""></textarea></td></tr>
                            <tr><td><b>Số lượng thêm vào</b></td><td><input type="number" class="sedang" name="quantity" required=""></td></tr> 
                        <tr><td><b>Hình ảnh</b></td><td><input type="text" name="productImg" class="sedang" required=""></td></tr> 
                    </table>
                    <div class="informasi">
                        THÔNG TIN CHI TIẾT SẢN PHẨM
                    </div>
                    <table width="95%">
                        <tr><td width="125px"><b>Nhập loại tivi</b></td><td><input type="text" name="productType" class="pendek" required=""></td></tr>
                        <tr><td width="125px"><b>Độ phân giải</b></td><td><input type="text" name="resolution"  class="pendek" required=""></td></tr>                        
                        <tr><td width="125px"><b>HDMI</b></td><td><input type="text" name="hdmi" class="pendek" required=""></td></tr>
                        <tr><td width="125px"><b>USB</b></td><td><input type="text"  name="usb" class="pendek" required=""></td></tr>
                        <tr><td width="125px"><b>Model</b></td><td><input type="text" name="Model" class="pendek" required=""></td></tr>
                        <tr><td><b>Kích thước màn hình Tivi</b></td><td>
                                <input type="radio" name="size" id="radio" value="32 inch" checked="" >32 inch
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
                                    <option selected value="12 tháng">12 tháng</option>
                                    <option value="24 tháng">24 tháng</option>
                                    <option value="48 tháng">48 tháng</option>
                                </select>

                        <tr><td></td><td>                               
                                <input type="submit" class="button" value="Thêm">
                                <input type="reset" class="button" value="xóa dữ liệu">
                            </td></tr>
                    </table>
                </div>
                <div class="clear"></div>
            </form>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
