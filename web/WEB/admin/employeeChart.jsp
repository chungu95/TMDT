<%-- 
    Document   : employeeChart
    Created on : Apr 28, 2017, 9:28:29 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông kê số hóa đơn </title>

    <head>
        <title>Google Charts</title>

        <!-- load Google AJAX API -->
        <script type="text/javascript" src="http://www.google.com/jsapi"></script>
        <script type="text/javascript">
            //load the Google Visualization API and the chart
            google.load('visualization', '1', {'packages': ['columnchart']});

            //set callback
            google.setOnLoadCallback(createChart);

            //callback function
            function createChart() {

                //create data table object
                var dataTable = new google.visualization.DataTable();

                //define columns
                dataTable.addColumn('string', 'Quarters 2009');
                dataTable.addColumn('number', 'Số hóa đơn đã lập');

                //define rows of data
//                dataTable.addRows([['JSP & Servlet', 20], ['Spring',12],['Struts',7]]);
                dataTable.addRows([<c:forEach var="item" items="${listItem}">['${item.employeeName}',${item.value}],</c:forEach>]);
                //instantiate our chart object
                var chart = new google.visualization.ColumnChart(document.getElementById('chart'));

                //define options for visualization
                var options = {width: 700, height: 300, is3D: true};

                //draw our chart
                chart.draw(dataTable, options);

            }
        </script>

    </head>
    <body>
        <div >
            <h3><a href="WEB/admin/statistical.jsp">Quay về</a></h3>

            <h2 style="text-align: center;">Biểu đồ số hóa đơn nhân viên đã lập</h2>
            <table >
                <div id="chart" style="text-align: center;"></div>
            </table>
        </div>
    </body>
</html>