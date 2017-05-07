<%-- 
    Document   : productChart
    Created on : Apr 23, 2017, 10:55:07 PM
    Author     : DELL
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông kê sản phẩm theo NXS</title>

        <!-- load Google AJAX API -->
        <script type="text/javascript" src="http://www.google.com/jsapi"></script>
        <script type="text/javascript">
            // Load the Visualization API and the piechart package.
            google.load('visualization', '1', {'packages': ['columnchart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.    
                var data = google.visualization.arrayToDataTable([
                    ['Country', 'Area(square km)'],
            <c:forEach var="item" items="${listItem}">['${item.productName}',${item.value}],</c:forEach>
                ]);
                // Set chart options
                var options = {
//                    'title': 'THỐNG KÊ SẢN PHẨM THEO NSX',
                    is3D: true,
                    pieSliceText: 'label',
                    tooltip: {showColorCode: true},
                    'width': 700,
                    'height': 300
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('Chart'));
                chart.draw(data, options);
            }
        </script>

    </head>
    <body>
        <div >
            <h3><a href="WEB/admin/statistical.jsp">Quay về</a></h3>

            <h2 style="text-align: center;">Biểu đồ sản phẩm theo Nhà sản xuất</h2>
            <table >
                <div id="Chart" style="text-align: center;"></div>
            </table>
        </div>
    </body>
</html>
