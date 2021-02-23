package com.kannan.sample.waveapp.util;

import android.content.Context;
import android.net.ConnectivityManager;

public class ConnectionUtil {
    public static boolean isConnectivityAvailable (Context context) {
        ConnectivityManager connectivityManager = ((ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE));
        return connectivityManager != null && connectivityManager.getActiveNetworkInfo() != null && connectivityManager.getActiveNetworkInfo().isConnected();
    }
}
