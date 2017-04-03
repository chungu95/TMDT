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
        <link rel="stylesheet" href="<%=request.getContextPath()%>css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="admincss/detailcss.css">

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

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
                         <th  class="data"></th>
                    </tr>
                    <tr class="data">
                        <td class="data"><%=product.getProductName()%></td>
                        <td class="data"><%=produce.getProduceName()%></td>
                        <td class="data"><%=product.getPrice()%></td>
                        <td class="data"><%=product.getDescription()%></td>
                        <td class="data" ><%=product.getQuantity()%></td>
                        <td class="data" ><%=product.getProductImg()%></td> 
                        <td> 
                            <a href="#edit" class="button" data-toggle="collapse" style="background-color: #e4b9c0; size: 15pt;">Sửa</a>
                            <a href="#del" class="button" data-toggle="collapse" style="background-color: #e4b9c0; size: 15pt;">Xóa</a>
                        </td>
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
                            <a href="#edit" class="button" data-toggle="collapse" style="background-color: #e4b9c0; size: 15pt;">Sửa</a>
                            <a href="#del" class="button" data-toggle="collapse" style="background-color: #e4b9c0; size: 15pt;">Xóa</a>
                        </td>
                    </tr>
                </table> 

                <form>
                    <div id="edit" class="collapse" style="margin-top: 100px;">
                        <div class="informasi">
                            SẢN PHẨM
                        </div>

                        <table width="95%">
                            <tr><td width="125px"><b>Nhập tên sản phẩm</b></td><td><input type="text" class="pendek" name="productName"></td></tr>

                            <tr><td><b>Chọn nhà sản xuất</b></td><td>                               
                                    <select name="produceID">
                                        <%            ArrayList<Produce> pr = ProduceDAO.getProduce();

                                            for (int i = 0; i < pr.size(); i++) {
                                        %>
                                        <option value="<%=pr.get(i).getProduceID()%>" selected>
                                            <%=pr.get(i).getProduceName()%>
                                        </option>
                                        <%  }%>
                                    </select>
                                </td></tr>
                            <tr><td><b>Giá sản phẩm</b></td><td><input type="number" class="sedang" name="price"></td></tr>   
                            <tr><td><b>Miêu tả</b></td><td><textarea name="description"></textarea></td></tr>
                            <tr><td><b>Số lượng thêm vào</b></td><td><input type="number" class="sedang" name="quantity"></td></tr> 
                            <tr><td><b>Hình ảnh</b></td><td><input type="text" name="productImg" class="sedang"></td></tr> 
                        </table>
                        <div class="informasi">
                            THÔNG TIN CHI TIẾT SẢN PHẨM
                        </div>
                        <table width="95%">
                            <tr><td width="125px"><b>Nhập loại tivi</b></td><td><input type="text" name="productType" class="pendek"></td></tr>
                            <tr><td width="125px"><b>Độ phân giải</b></td><td><input type="text" name="resolution"  class="pendek"></td></tr>                        
                            <tr><td width="125px"><b>HDMI</b></td><td><input type="text" name="hdmi" class="pendek"></td></tr>
                            <tr><td width="125px"><b>USB</b></td><td><input type="text"  name="usb" class="pendek"></td></tr>
                            <tr><td width="125px"><b>Model</b></td><td><input type="text" name="Model" class="pendek"></td></tr>
                            <tr><td><b>Kích thước màn hình Tivi</b></td><td>
                                    <input type="radio" name="size" id="radio" value="32 inch">32 inch
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
                                    <select name="warranty">
                                        <option selected value="24 tháng">24 tháng</option>
                                        <option value="48 tháng">48 tháng</option>
                                    </select>

                            <tr><td></td><td>                               
                                    <input type="submit" class="button" value="Lưu">                                
                                </td></tr>
                        </table>
                    </div>
                </form>
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
