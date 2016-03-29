package com.example.justinkrinke.wavechallenge.service;

import com.example.justinkrinke.wavechallenge.models.Products;
import com.example.justinkrinke.wavechallenge.util.Keys;

import java.util.List;

import retrofit.http.GET;
import retrofit.http.Headers;
import retrofit.http.Path;
import rx.Observable;

/**
 *
 * @Interface
 * @getProducts
 * @getProductById
 */
public interface ProductInterface {
    //set the end point
    String SERVICE_ENDPOINT = "https://api.waveapps.com";

    //Create the rest interface for all products
    /*
    * @Param buisness ID
    * @Param bearer ID
    * */

    @GET("/businesses/{bid}/products/")
    @Headers("Authorization: Bearer a3wgC2KbJlzcoGdDbClUOaFrBgMYAR")
    Observable<List<Products>> getProducts(@Path("bid") String bid ); //return the list of Products.

    /*
    * @Param buisness ID
    * @Param bearer ID
    * @Param product ID
    * */
    //create the rest interface for specific product
    @GET("/businesses/{bid}/products/{id}/")
    @Headers("Authorization: Bearer a3wgC2KbJlzcoGdDbClUOaFrBgMYAR")
    Observable<List<Products>> getProductById(@Path("bid") String bid, @Path("id") int id); //return specific product
}
