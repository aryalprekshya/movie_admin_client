/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.prekshya.clientrs.services;

import com.google.gson.Gson;
import com.prekshya.clientrs.models.Movie;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import soap.MovieService;
import soap.MovieServiceService;
import soap.Movies;

/**
 *
 * @author prekshya
 */

@Path("movies")
@Produces("application/json")
public class MovieClientService {
    
   
    @GET
    public Response Movies()
    {

        MovieServiceService movieService = new MovieServiceService();
        MovieService port = movieService.getMovieServicePort();
         List<Movies> movieList = port.getAll();
         
         List <Movie> myMovieList = new ArrayList();
         for(Movies movie: movieList){
             Movie m = new Movie();
             m.id = movie.getId();
             m.name = movie.getName();
             m.genreTitle = movie.getGenreId().getTitle();
             m.duration = movie.getDuration();
             m.director = movie.getDirector();
             m.producer = movie.getProducer();
             if(movie.getImage() != null){
             m.image = new String(movie.getImage());
             }
             
             myMovieList.add(m);
         }
        
        Gson gson = new Gson();
            //Comment [] commentList = gson.fromJson(output, Comment[].class);
           // List <Comment> commentsArray = Arrays.asList(commentList);
            //commentsArray = commentsArray.stream().limit(count).collect(Collectors.toList());
            return Response.ok(gson.toJson(myMovieList)).build();
       
    }
    
    @GET
    @Path("id/{id}")
    public Response movidById(@PathParam("id") int id){
         MovieServiceService movieService = new MovieServiceService();
        MovieService port = movieService.getMovieServicePort();
        
        Movies movie = port.getById(id);
             Movie m = new Movie();
             m.id = movie.getId();
             m.name = movie.getName();
             m.genreTitle = movie.getGenreId().getTitle();
             m.duration = movie.getDuration();
             m.director = movie.getDirector();
             m.producer = movie.getProducer();
             if(movie.getImage() != null){
                    m.image = new String(movie.getImage());
             }

            Gson gson = new Gson();
            return Response.ok(gson.toJson(m)).build();

    }
}
