package com.sample.dhruvmj.waveapp.network;

import com.sample.dhruvmj.waveapp.model.Product;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Headers;
import retrofit2.http.Path;

/**
 * @author Dhruv
 */

public interface WaveAPI {
    String ACCESS_TOKEN = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm";

    /**
     * This method will make RestAPI call to obtain
     * list of products for a certain businessId
     *
     * @param businessId This is the business id for which
     *                   we want to obtain product list
     */
    @Headers("Authorization: Bearer " + ACCESS_TOKEN)
    @GET("businesses/{business_id}/products/")
    Call<List<Product>> getListOfProducts(@Path("business_id") String businessId);
}
