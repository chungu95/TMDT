<%-- 
    Document   : regsuccess
    Created on : Mar 10, 2017, 3:27:19 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký thành công</title>
        <%@include file = "header.jsp" %> 
    </head>
    <body>
        <% 
            if (session.getAttribute("customer") == null) {
                response.sendRedirect("reg.jsp");
            }
        %>
    <center>
        <b><font color = "red">Đăng ký thành công! Mời bạn quay về </font><a href = "index.jsp">Trang chủ</a></b><br /> 
        <b>Tự động chuyển trang sau <font color="red"><span id="time"></span></font> giây ...</b> 
    </center>
    <META http-equiv="refresh" content="10 ; URL=index.jsp"> 
    <script type = "text/javascript">
        function startTimer(duration, display) {
            function timer() {
                display.textContent = duration;
                if (duration > 0) {
                    duration--;
                }
            }
            ;
            timer();
            setInterval(timer, 1000);
        }
        window.onload = function () {
            var time = 10,
                    display = document.querySelector('#time');
            startTimer(time, display);
        };
    </script>
</body>
<footer>
    <%@include file="footer.jsp" %>
</footer>
</html>
