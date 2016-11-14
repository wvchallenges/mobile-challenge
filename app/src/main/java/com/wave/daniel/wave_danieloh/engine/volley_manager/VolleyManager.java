package com.wave.daniel.wave_danieloh.engine.volley_manager;

import android.content.Context;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.Map;

/**
 * Created by Daniel on 2016-11-12.
 */
public class VolleyManager {

    private static VolleyManager mVolleyManager;
    private static RequestQueue mRequestQueue;
    private static Context mContext;

    /**
     * private constructor for singleton design pattern
     * */
    private VolleyManager(Context ctx) {
        mContext = ctx;
        mRequestQueue = getRequestQueue();

    }

    /**
     * getInstance method for singleton design pattern
     * */
    public static synchronized VolleyManager getInstance(Context context) {
        if (mVolleyManager == null) {
            mVolleyManager = new VolleyManager(context);
        }
        return mVolleyManager;
    }

    /**
     * clear variables
     * */
    public void shutdown() {
        if (mVolleyManager != null) {
            mRequestQueue = null;
            mContext = null;
            mVolleyManager = null;

        }
    }

    public RequestQueue getRequestQueue() {
        if (mRequestQueue == null) {
            mRequestQueue = Volley.newRequestQueue(mContext);
        }

        return mRequestQueue;
    }

    /**
     * Add the request in the Queue
     **/
    public <T> void addToRequestQueue(Request<T> req) {
        getRequestQueue().add(req);

    }

    /**
     * This method create request to get the data from server and add the request in the Queue
     **/
    public void sendStringRequest(int requestMethod, String url, VolleyResponse<String> volleyResponse, String TAG, final Map<String, String> header) {
        getStringRequest(requestMethod, url, volleyResponse, TAG, header);
        addToRequestQueue(getStringRequest(requestMethod, url, volleyResponse, TAG, header));
    }


    /**
     * This method create request to get the data from server
    **/
    public StringRequest getStringRequest(int requestMethod, String url, VolleyResponse<String> volleyResponse, String TAG, final Map<String, String> header) {

        StringRequest stringRequest = new StringRequest(requestMethod, url, volleyResponse.responseListener, volleyResponse.errorListener) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String>  params = header;
                if (header == null) {
                    return super.getHeaders();
                }

                return params;
            }
        };

        if (TAG != null) {
            stringRequest.setTag(TAG);
        }

        return stringRequest;
    }

    /**
     * Cancel request by Tag
     **/
    public void cancelRequestByTag(String TAG) {
        if (mRequestQueue != null) {
            mRequestQueue.cancelAll(TAG);
        }

    }

    /**
     * Cancel all request
     **/
    public static void cancelAllRequest() {
        if(mRequestQueue != null) {
            mRequestQueue.cancelAll(new RequestQueue.RequestFilter() {
                @Override
                public boolean apply(Request<?> request) {
                    return true;

                }
            });
        }

    }


}