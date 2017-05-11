<%-- 
    Document   : orderDate
    Created on : May 10, 2017, 11:05:31 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>nhập ngày đặt</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css">
        <%@include file="header.jsp" %>  
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <form method="post" action="<%=request.getContextPath()%>/OrderByDate">
                        <h2>Mời bạn nhập khoảng thời gian muốn xem hóa đơn theo mẫu (ngày-tháng-năm)</h2>
                        <div class="form-group">
                            <label for="from">Từ ngày : </label>
                            <input type="text" class="form-control" name="from">
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="to">Đến ngày : </label>
                            <input type="text" class="form-control" name="to">
                        </div>
                        <br>
                        <button type="submit" class="button" name="sub" value="date">Xem</button>
                    </form>
                </div>
                <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
