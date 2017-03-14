<%-- 
    Document   : date
    Created on : Mar 13, 2017, 2:16:21 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ngayf thang nam</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <link href="css/bootstrap-datepicker.css" rel="stylesheet" />
        <script src="js/bootstrap-datepicker.js"></script>
    </head>
    <body>
        
        <div class="ngay">
        <p>Ngày tháng năm sinh</p>
        <input type="text" class="form-control input-datepicke datepicker" id="custom_datepicker" placeholder="Ngày" style="width: 300px">
    </div>
        <script>
	    
	    //Add datepicker
	    $('.datepicker').datepicker({
	        'format': 'dd.mm.yyyy',
	        'autoclose': true
	    });
	</script>
    </body>
</html>
