package com.example.visaahan.wavecodingchallenge;

/**
 * Created by Visaahan on 2016-03-16.
 */
public class WaveURLGenerator {
    final static String baseURL = "https://api.waveapps.com/businesses/";
    final static String productString = "products";
    final static String OAuthString ="?access_token=";
    final static char separator = '/';

    public static String getProductListURL(String businessId, String OAuthToken){
        StringBuilder buff = new StringBuilder(100);
        buff.append(baseURL).append(businessId).append(separator).append(productString).append(OAuthString).append(OAuthToken);
        return buff.toString();
    }
}
