package com.eslimaf.mobilechallenge.infrastructure.waveapi;


import com.eslimaf.mobilechallenge.model.Product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import okhttp3.Request;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MockCallApi implements Call<List<Product>> {
    private List<Product> emptyList = new ArrayList<>();

    @Override
    public void enqueue(Callback<List<Product>> callback) {
        Response<List<Product>> response = Response.success(emptyList);
        callback.onResponse(null, response);
    }

    @Override
    public Response<List<Product>> execute() throws IOException {
        return null;
    }

    @Override
    public boolean isExecuted() {
        return false;
    }

    @Override
    public void cancel() {

    }

    @Override
    public boolean isCanceled() {
        return false;
    }

    @Override
    public Call<List<Product>> clone() {
        return null;
    }

    @Override
    public Request request() {
        return null;
    }
}
