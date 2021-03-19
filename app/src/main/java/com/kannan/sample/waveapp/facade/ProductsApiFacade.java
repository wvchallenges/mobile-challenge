package com.kannan.sample.waveapp.facade;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kannan.sample.waveapp.api.ProductsAPI;
import com.kannan.sample.waveapp.model.Product;
import java.util.List;
import retrofit2.Callback;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class ProductsApiFacade {
    private static final String BASE_URL = "https://api.waveapps.com/";
    private Retrofit retrofit;

    public ProductsApiFacade() {
        Gson gson = new GsonBuilder()
                .setLenient()
                .create();
        retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create(gson))
                .build();
    }

    public void getProducts(String businessID, Callback<List<Product>> callback) {
        retrofit.create(ProductsAPI.class)
                .getProducts(businessID)
                .enqueue(callback);


    }
}
