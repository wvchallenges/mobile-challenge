package com.eslimaf.mobilechallenge.infrastructure.waveapi;

import com.eslimaf.mobilechallenge.model.Product;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;

public interface WaveApi {
    String WAVEAPI_BASE_URL = "https://api.waveapps.com";

    @GET("businesses/{businessId}/products")
    Call<List<Product>> getProductsByBusinessId(@Path("businessId") String businessId);
}
