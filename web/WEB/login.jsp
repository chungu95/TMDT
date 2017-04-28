<%-- 
    Document   : login
    Created on : Mar 9, 2017, 1:19:49 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ĐĂNG NHẬP</title>
        <link rel="stylesheet" href="../WEB/css/bootstrap.min.css">
        <link rel="stylesheet" href="../WEB/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../WEB/css/logincss.css">
        <script type="text/javascript" src="./WEB/js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="./WEB/js/bootstrap.min.js"></script>
         
        <%@include file = "header.jsp"%>   
        
    </head>
    <body>
        <%
            if (session.getAttribute("customer") != null) {
                response.sendRedirect("index.jsp");
            }
            String actionLink = "../LoginController";
            if(request.getParameter("act")!=null&&request.getParameter("act").equals("payment")){ 
                actionLink = "../PayLogin"; 
            }
        %>  
        <section id="main" >
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-ofset-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4> ĐĂNG NHẬP </h4>
                            </div>
                            <div class="panel-body">
                                <form action="<%=actionLink%>" method="post" role="form">                        
                                    <div class="form-group">
                                        <label for="username">Tên đăng nhập</label>
                                        <input type="text" class="form-control" name="username" placeholder="nhập tên đăng nhập" required=""/>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Mật khẩu</label>
                                        <input type="password" class="form-control" name="password" placeholder="nhập mật khẩu" required=""/>
                                    </div>
                                    <center><b><font color="red"><%
                                        if (request.getParameter("error") != null) {
                                            out.print("Sai tên đăng nhập hoặc mật khẩu");
                                        }%> </b></center>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
                                        </div>
                                        <div class="col-lg-6">
                                            <a href="reg.jsp" class="btn btn-link"> Bạn chưa có tài khoản ? </a>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer>
            <%@include file = "footer.jsp" %> 
        </footer>

    </body>
</html>
