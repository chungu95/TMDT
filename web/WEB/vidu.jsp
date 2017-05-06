<html>
    <head>
        <title>Google Charts</title>
 
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
                    ['Country', 'Area(square km)'],['JSP & Servlet', 20],['Spring', 8],['Struts', 13]
                ]);
                // Set chart options
                var options = {
                    'title': 'Java Technologies for Web Applications',
                    is3D: true,
                    pieSliceText: 'label',
                    tooltip: {showColorCode: true},
                    'width': 700,
                    'height': 300
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('Chart2'));
                chart.draw(data, options);
            }
        </script>
 
    </head>
 
    <body>

        <div id="Chart2"></div>
 
    </body>
</html>



<%-- 
    Document   : productChart
    Created on : Apr 23, 2017, 10:55:07 PM
    Author     : DELL
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông kê sản phẩm theo NXS</title>

    <c:set var="root" value="${pageContext.request.contextPath}"/>
    <link href="<%=request.getContextPath()%>/admincss/mos-style.css" rel='stylesheet' type='text/css' />

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
//                var data = google.visualization.arrayToDataTable([
//                    ['Country', 'Area(square km)'], 
//                    <c:forEach var="item" items="${listItem}">['${item.productName}',${item.value}],</c:forEach>
//                ]);
// Create the data table.    
            var data = google.visualization.arrayToDataTable([
                ['Country', 'Area(square km)'], ['JSP & Servlet', 20], ['Spring', 8], ['Struts', 13]
            ]);
            // Set chart options
            var options = {
                'title': 'Thống kê danh mục sản phẩm',
                is3D: true,
                pieSliceText: 'label',
                tooltip: {showColorCode: true},
                'width': 700,
                'height': 300
            };

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart'));
            chart.draw(data, options);
        }
    </script>
    <%@include file="header.jsp" %>  
</head>
<body>
    <div id="wrapper">
        <jsp:include page="menu.jsp"></jsp:include>
            <div id="rightContent">
                <h3>Biểu đồ sản phẩm theo Nhà sản xuất</h3>
                <table class="data">

                    <div id="Chart"></div>

                </table>
            </div>

            <div class="clear"></div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
