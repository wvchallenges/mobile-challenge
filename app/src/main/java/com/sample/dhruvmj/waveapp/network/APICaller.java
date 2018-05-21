package com.sample.dhruvmj.waveapp.network;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sample.dhruvmj.waveapp.model.Product;

import java.util.List;

import retrofit2.Callback;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * @author Dhruv
 */

public class APICaller {
    private static final String WAVE_BASE_URL = "https://api.waveapps.com/";
    private Retrofit retrofitBuilder;

    public APICaller() {
        Gson gson = new GsonBuilder()
                .setLenient()
                .create();

        retrofitBuilder = new Retrofit.Builder()
                .baseUrl(WAVE_BASE_URL)
                .addConverterFactory(GsonConverterFactory.create(gson))
                .build();
    }

    /**
     * This method is used to get list of products
     * for a specific business_id
     *
     * @param businessId This is the business id for which
     *                   we want to obtain product list
     * @param callback   This is a response callback that
     *                   contains success and error callbacks
     */
    public void getListOfProducts(String businessId, Callback<List<Product>> callback) {
        retrofitBuilder.create(WaveAPI.class)
                .getListOfProducts(businessId)
                .enqueue(callback);
    }
}
