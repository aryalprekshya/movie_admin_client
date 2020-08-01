/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.prekshya.adminapplication.servlets;

import com.prekshya.adminapplication.conversion.ImageConversion;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import soap.Exception_Exception;
import soap.Genre;
import soap.MovieService;
import soap.MovieServiceService;
import soap.Movies;


/**
 *
 * @author prekshya
 */
@MultipartConfig
@WebServlet(name = "DeleteMovieServlet", urlPatterns = {"/delete"})
public class DeleteMovieServlet extends HttpServlet {
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MovieServiceService movieService = new MovieServiceService();
           MovieService port = movieService.getMovieServicePort();

            
       
        if(request.getParameter("id")!= null){
            int id = Integer.parseInt(request.getParameter("id"));
           
            port.deleteById(id);
             
        }
           List<Movies> movies = port.getAll();
             
        request.setAttribute("movies", movies);
             
        RequestDispatcher dispatcher = request.getRequestDispatcher("./browseMovie.jsp");
        dispatcher.forward(request, response);
    }
    
  
    

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
