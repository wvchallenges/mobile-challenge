package com.sample.dhruvmj.waveapp.util;

import android.content.Context;
import android.net.ConnectivityManager;

/**
 * @author Dhruv
 */

public class NetworkUtil {
    /**
     * This method will check whether the internet is connected
     *
     * @param context This is the context from which
     *                this method is invoked
     * @return a boolean flag
     */
    public static boolean isNetworkConnected(Context context) {
        ConnectivityManager connectivityManager = ((ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE));
        return connectivityManager != null && connectivityManager.getActiveNetworkInfo() != null && connectivityManager.getActiveNetworkInfo().isConnected();
    }
}
