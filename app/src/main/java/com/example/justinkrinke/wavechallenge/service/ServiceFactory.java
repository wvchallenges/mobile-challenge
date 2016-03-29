package com.example.justinkrinke.wavechallenge.service;

import retrofit.RestAdapter;

/**
 * Template factory for Retrofit returns a rest adapter
 */
public class ServiceFactory {
    public static <T> T createRetrofitService(final Class<T> templateClass, final String endPoint) {
        final RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(endPoint).build();
        return restAdapter.create(templateClass);
    }
}