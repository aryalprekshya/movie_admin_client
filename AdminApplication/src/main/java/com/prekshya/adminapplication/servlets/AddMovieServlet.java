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
@WebServlet(name = "AddMovieServlet", urlPatterns = {"/addmovie"})
public class AddMovieServlet extends HttpServlet {
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         MovieServiceService movieService = new MovieServiceService();
           MovieService port = movieService.getMovieServicePort();
            List<Genre> genreList = port.getGenre();
             
        request.setAttribute("genreList", genreList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("./addMovie.jsp");
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String released = request.getParameter("released");
        int duration = Integer.parseInt(request.getParameter("duration"));
        int genreId = Integer.parseInt(request.getParameter("genre")); 
      
             Part part= request.getPart("image");
            String filename = part.getSubmittedFileName();
            System.out.println(filename);
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] buffer = new byte[(int)part.getSize()];
            part.getInputStream().read(buffer,0,buffer.length);
            bytes.write(buffer);
            //convert image to 64
            byte[] image = Base64.getEncoder().encode(buffer);
           
            String producer = request.getParameter("producer");  
            String director = request.getParameter("director");
            
           MovieServiceService movieService = new MovieServiceService();
           MovieService port = movieService.getMovieServicePort();
           
           
        try {
             
       
            port.add(name, duration, genreId, director, producer, image);
            
            
            
            List<Movies> movies = port.getAll();
             request.setAttribute("movies", movies);
             RequestDispatcher dispatcher = request.getRequestDispatcher("./browseMovie.jsp");
             dispatcher.forward(request, response);
            
        } catch (Exception_Exception ex) {
            Logger.getLogger(AddMovieServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
