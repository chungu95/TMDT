<%-- 
    Document   : employee
    Created on : Apr 3, 2017, 10:10:03 PM
    Author     : DELL
--%>

<%@page import="dao.EmployeeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nhân viên</title>
        <link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> 
        <link rel="stylesheet" type="text/css" href="admincss/mos-style.css">
        <%@include file="header.jsp" %>  
    </head>
    <body>
        <%
            if (!employee.getRole().equals("Admin")) {
                response.sendRedirect(request.getContextPath() + "/EmployeeLogout");
                return;
            }
        %>

        <div id="">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="">
                    <h1 style="position: center; margin-top: 50px;">DANH SÁCH NHÂN VIÊN</h3>

                        <table class="data">
                            <tr class="data">
                                <th class="data">STT</th>
                                <th class="data" >Mã Nhân viên</th>
                                <th class="data">Họ tên</th>
                                <th class="data">Nhóm quyền</th>                            
                                <th  class="data">Tên Đăng nhập</th>
                                <th  class="data">Mật khẩu</th>
                                <th class="data"></th>
                            </tr>
                            <tr class="data">
                            <%
                                ArrayList<Employees> emp = EmployeeDAO.getAllEmployees();

                                for (int i = 0; i < emp.size(); i++) {
                            %>
                        <form method="post" action="<%=request.getContextPath()%>/employeeControl">
                            <input type="hidden" name="employeeID" value="<%=emp.get(i).getEmployeeID()%>" />
                            <td class="data"><%=i + 1%></td>
                            <td class="data" ><%=emp.get(i).getEmployeeID()%></td>
                            <td class="data"><input type="text" class="form-control"  name="employeeName" value="<%=emp.get(i).getName()%>"></td>
                            <td class="data">
                                <select class="form-control"  name="role" value="<%=emp.get(i).getRole()%>">
                                    <%
                                        if (emp.get(i).getRole().equals("Admin")) {
                                            out.print("<option value='Admin' selected>Admin</option>"
                                                    + "<option value='sale'>sale</option>");
                                        } else{
                                            out.print("<option value='Admin' >Admin</option>"
                                                    + "<option value='sale' selected>sale</option>");
                                        }
                                    %>

                                </select>
                            </td>                            
                            <td  class="data"><input type="text" class="form-control"  name="username" value="<%=emp.get(i).getUsername()%>"></td>
                            <td  class="data"><input type="text" class="form-control"  name="pass"  placeholder="Mật khẩu"></td>
                            <td> 
                                <button type="submit" class="button" name="sub" value="updateInfo">Sửa</button>
                                <button type="submit" class="button" name="sub" value="pass">Đổi mật khẩu</button>                                
                            </td>    </form>                        
                        </tr>
                        <%}%>
                    </table>

            </div>
            <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>

    </body>
</html>
