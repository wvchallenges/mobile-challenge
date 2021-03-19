package com.kannan.sample.waveapp.api;

import com.kannan.sample.waveapp.model.Product;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Headers;
import retrofit2.http.Path;


public interface ProductsAPI {
    String ACCESS_TOKEN = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm";

    /**
     * Gets the list of products for the provided businessID
     * @param businessID The business ID for which products need to be fetched
     */
    @Headers("Authorization: Bearer " + ACCESS_TOKEN)
    @GET("businesses/{business_id}/products/")
    Call<List<Product>> getProducts(@Path("business_id") String businessID);
}
