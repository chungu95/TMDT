<%-- 
    Document   : insertProducer
    Created on : Apr 20, 2017, 2:35:56 PM
    Author     : DELL
--%>

<%@page import="dao.ProduceDAO"%>
<%@page import="model.Produce"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>thêm nhà sản xuất</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css"> 
        <%@include file="header.jsp" %>  
    </head>
    <body>

        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <div class="informasi">
                        CÁC NHÀ SẢN XUẤT ĐÃ CÓ
                    </div>
                    <table width="95%">
                        <tr class="data">
                            <th class="data">STT</th>
                            <th class="data" >Mã Nhà SX</th>
                            <th class="data">Tên Nhà SX</th>                               
                        </tr>
                        <tr>
                        <%            ArrayList<Produce> produce = ProduceDAO.getProduce();

                            for (int i = 0; i < produce.size(); i++) {
                        %>
                        <td class="data"><%=i + 1%></td>
                        <td class="data"><%=produce.get(i).getProduceID()%></td>
                        <td class="data"><%=produce.get(i).getProduceName()%></td>
                    </tr>
                    <% }%>
                </table>
                <div class="informasi">
                    THÊM NHÀ SẢN XUẤT MỚI
                </div>
                <form method="post" action="<%=request.getContextPath()%>/insertProduce" >
                    <table width="95%">
                        <tr><td width="125px"><b>Nhập tên nhà sx: </b></td><td><input type="text" class="pendek" name="produceName" required="" ></td></tr>
                        <tr><td> <button type="submit" class="button" name="sub" value="insert">Thêm</button></td></tr>
                    </table>
                </form>
            </div>
            <div class="clear"></div>
            <%
                if (request.getParameter("error") != null && request.getParameter("error").equals("existed")) {
                    out.print("<b style='color:red'><center>Tên nhà sản xuất đã tồn tại!</center></b><br />");
                }
            %>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
