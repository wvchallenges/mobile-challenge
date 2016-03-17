package com.example.visaahan.wavecodingchallenge;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;

/**
 * Created by Visaahan on 2016-03-16.
 */
public class WaveRequest {

    public static StringRequest createGETRequest(final MainActivity ma, final String url){
        return new StringRequest(Request.Method.GET, url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        ma.populateScreen(response,false);
                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                ma.populateScreen("ERROR: " + error.getMessage(), true);
            }
        });
    }
}
