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
        
        <select>
            <option>Mot</option>
            <option>Hai</option>
        </select><br>
       
       <!-- Single button -->
<div class="btn-group">
  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Action <span class="caret"></span>
  </button>
  <ul class="dropdown-menu">
    <li><a href="#">Action</a></li>
    <li><a href="#">Another action</a></li>
    <li><a href="#">Something else here</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Separated link</a></li>
  </ul>
</div>
       
       <div class="dropup">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Dropup
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
    <li><a href="#">Action</a></li>
    <li><a href="#">Another action</a></li>
    <li><a href="#">Something else here</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Separated link</a></li>
  </ul>
</div>
        
        
        
        
      
    </body>
</html>