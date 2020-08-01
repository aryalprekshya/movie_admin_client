<%-- 
    Document   : browseMovie
    Created on : Jul. 30, 2020, 11:44:15 p.m.
    Author     : prekshya
--%>

<%@page import="java.util.List"%>
<%@page import="soap.Movies"%>
<%@page import="soap.Genre"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie List</title>
    </head>
    <style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 80%;
  
}

td, th {
  border: 1px solid #dddddd;
  text-align: center;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
.center {
  margin-left: auto;
  margin-right: auto;
  margin-top: 40px;
}
.navbar{
  margin-top: 20px;
  width: 100%;
  height: 5%;
  background: black;
  border-bottom: 2px solid white;
  display: flex;
  padding: 0.25em 1em;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
    <body>
        <div class=" container" style="width:100%">
            <div class="navbar">
                <h2 style="color:white">Movie List</h2>
            </div>
            <table class="center">
                <thead>
                    <tr>
                        <th>Movie Id</th>
                        <th>Movie Name</th>
                        <th></th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                 
<!--                    <tr>
                        <td>{movies.Id}</td>
                        <td>{movies.name}</td>
                        <td><form action="editMovie.jsp"/><input type="submit" value="Edit"/></td>
                        <td>
                        <span class="table-remove"><button type="button"
                            class="btn btn-danger btn-rounded btn-sm my-0">Delete</button></span>
                      </td>
                    </tr>-->
               </tbody>
               
                
                
                
                 <%
                  List<Movies> movies = (List<Movies>)request.getAttribute("movies");
                  for(Movies movie :movies){ %>
                        <tr>
                            <td><%= movie.getId()%></td>
                             <td><%= movie.getName()%></td>
                               <td><a href="./edit?id=<%= movie.getId()%>">Edit</a></td>
                             
                                 <td><a href="./delete?id=<%= movie.getId()%>">Delete</a></td>
                             
                         </tr>
                <%}%>
            </table>
        </div>
    
   
    </body>
</html>
