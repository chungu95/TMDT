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
            if (session.getAttribute("epl") != null) {
                response.sendRedirect("allProduct.jsp");
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
                <form method="POST" action="<%=request.getContextPath()%>/Login_ad">
                    <label>Tên đăng nhập</label><br>
                    <input type="text" class="login" name="username"><br>
                    <label>Mật khẩu</label><br>
                    <input type="password" class="login" name="password"><br>
                    
                    <input type="submit" class="button" value="Đăng nhập">
                </form>
                <center><b><font color="red"><%
                                        if (request.getParameter("error") != null) {
                                            out.print("Sai tên đăng nhập hoặc mật khẩu");
                                        }%> </b></center>
            </div>
        </div>
    </body>
</html>
