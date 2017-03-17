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
        <link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/mycss.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
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
        
        <select>
            <option>Mot</option>
            <option>Hai</option>
        </select><br>
       

        <div class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown">
                dropdown <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="">trinh 1</a></li>
                <li><a href="">trinh 1</a></li>
            </ul>
        </div>
        
      
    </body>
</html>
