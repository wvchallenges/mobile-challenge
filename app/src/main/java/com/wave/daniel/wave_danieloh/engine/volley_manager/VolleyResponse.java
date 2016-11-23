package com.wave.daniel.wave_danieloh.engine.volley_manager;

import com.android.volley.Response;

/**
 * Created by Daniel on 2016-11-12.
 * This class designed to handle Response data from Server
 */
public class VolleyResponse<T> {

    public Response.Listener<T> responseListener = null;
    public Response.ErrorListener errorListener = null;

    public VolleyResponse(Response.Listener<T> responseListener, Response.ErrorListener errorListener) {
        this.responseListener = responseListener;
        this.errorListener = errorListener;

    }

}
