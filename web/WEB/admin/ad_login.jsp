<%-- 
    Document   : login
    Created on : Mar 31, 2017, 10:27:02 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css"> 
    </head>
    <body>
        <%
            if (session.getAttribute("Employee") != null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <div id="header">
            <div class="inHeaderLogin"></div>
        </div>

        <div id="loginForm">
            <div class="headLoginForm">
                Login Administrator
            </div>
            <div class="fieldLogin">
                <form method="POST" action="<%=request.getContextPath()%>/EmployeeLoginController"> 
                    <label>Tên đăng nhập</label><br>
                    <input type="text" name="username" class="login"><br>
                    <label>Mật khẩu</label><br>
                    <input type="password" name="password" class="login"><br>
                    <input type="submit" class="button" value="Đăng nhập">                 
                </form>
            </div>
            <%
                if (request.getParameter("error") != null) {
                    out.print("<br /><center><b style = 'color:red'>Đăng nhập sai!</b></center> ");
                }
            %>
        </div>
    </body>
</html>
