package com.jameschoi.wave.utils;

import android.app.Activity;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

import org.json.JSONArray;
import org.json.JSONObject;

public class Utils {

    /*
     * Checks if the devices has data connections. Returns true if there is, otherwise false.
     */
    public static boolean hasDataConnection(Activity a) {
        ConnectivityManager cm = (ConnectivityManager) a.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo activeNetwork = cm.getActiveNetworkInfo();
        return activeNetwork != null && activeNetwork.isConnectedOrConnecting();
    }

    /*
     * This method convert the data byte array into JSONArray.
     */
    public static JSONArray getProductList(byte[] data) {
        String dataStr = new String(data);
        JSONArray jsonArray = new JSONArray();

        try {
            jsonArray = new JSONArray(dataStr);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return jsonArray;
    }

    /*
     * This method retrieves the string value from the JSON object with the key field.
     */
    public static String getStringData(JSONObject json, String key) {
        String resultCode = "";
        try {
            resultCode = json.getString(key);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultCode;
    }
}
