<%-- 
    Document   : addMovie
    Created on : Jul. 30, 2020, 7:05:09 p.m.
    Author     : prekshya
--%>

<%@page import="java.util.List"%>
<%@page import="soap.Genre"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Adding Movie</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/index.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container-lg">
    <div class="navbar">
      <h2 style="color:white">Edit Movie</h2>
    </div>
    
  <form class="form-horizontal" method="post" action="edit" enctype="multipart/form-data">
      
      <input type="hidden" name="id" value="<%= request.getAttribute("id") %>">
    <div class="form-group">
      <label class="control-label col-sm-4" for="name">Movie Name:</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="name" placeholder="Enter movie name" name="name" value="<%= request.getAttribute("name") %>">
        </div>
    </div>
<!--    <div class="form-group">
      <label class="control-label col-sm-4" for="releaseYear">Release Year</label>
      <div class="col-sm-4">          
        <input type="date" class="form-control" id="releaseYear" placeholder="Release Year" name="releaseYear">
      </div>
    </div>-->
      <div class="form-group">
      <label class="control-label col-sm-4" for="duration">Duration</label>
      <div class="col-sm-4">          
        <input type="number" class="form-control" id="duration" placeholder="Duration" name="duration">
      </div>
    </div>
      
    <div class="form-group">
      <label class="control-label col-sm-4" for="genre">Genre</label>
      <div class="col-sm-4"> 
        <select id="genre" class="form-control" name="genre">
          <option  selected disabled>Choose</option>          
              <%
                  List<Genre> genreList = (List<Genre>)request.getAttribute("genreList");
                  for(Genre genre: genreList){ %>
               
                <option value="<%= genre.getId() %>"><%= genre.getTitle() %></option>
             <%}%>
        </select>
      </div>
    </div>
      
    <div class="form-group">
      <label class="control-label col-sm-4" for="director">Director</label>
      <div class="col-sm-4">          
        <input type="year" class="form-control" id="director" placeholder="Director" name="director">
      </div>
    </div>
      
    <div class="form-group"> 
      <label class="control-label col-sm-4" for="producer">Producer</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="producer" placeholder="Producer" name="producer">
      </div>
    </div>
     <div class="form-group">
         <label class="control-label col-sm-4" for="customFile">Choose file</label>
        <div class="custom-file col-sm-4"> 
            <input type="file" class="form-control" id="customFile" name="image">
        </div>
     </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button  style="margin-top:30px"class="btn1" class="col-md-4" type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>
      
      
  </form>
</div>

</body>
</html>

