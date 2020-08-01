<%-- 
    Document   : index
    Created on : Jul. 27, 2020, 6:31:00 p.m.
    Author     : prekshya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/index.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container-lg">
    <div class="navbar d-flex justify-content-center">
        <h2 style="color:white">Welcome Admin</h2>
    </div>
    
    <div class="d-flex justify-content-center">
        <div class="form group">
                <div class="text-center" style="margin-top: 30px;margin-bottom: 10px;">
                    <a href="browse" style="width:30%;height:50px;background:orange;color:black;margin-top: 15%; border:none;padding:15px" class="btn btn"><strong>Browse Movies</a>
                </div>
            
                <div class="text-center" style="margin-top:20px">
                    <a href="addmovie" style="width:30%;height:50px;background: orange;color:black; border:none;padding:15px"class="btn btn"><strong>Add New Movies</strong></a>
                </div>     
        <div>
    </div>
</div>

</body>
</html>
