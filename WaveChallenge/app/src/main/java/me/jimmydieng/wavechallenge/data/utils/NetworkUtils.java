package me.jimmydieng.wavechallenge.data.utils;


import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.util.Log;

import org.json.JSONArray;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import static android.content.ContentValues.TAG;

public class NetworkUtils {
  public static String ACCESS_TOKEN = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm";

  public static boolean isConnected(Context context) {
    ConnectivityManager cm = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
    NetworkInfo netInfo = cm.getActiveNetworkInfo();
    // Should check null because in air plan mode it will be null
    return netInfo != null && netInfo.isConnected();
  }

  public static JSONArray getJsonArray(String myurl, HashMap<String, String> params) {
    InputStream is = null;
    try {
      URL url = new URL(myurl);
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setReadTimeout(10000);
      conn.setConnectTimeout(15000);
      for (String key: params.keySet()) {
        conn.setRequestProperty(key, params.get(key));
      }

      // Starts the query
      conn.connect();
      int response = conn.getResponseCode();
      Log.d(TAG, "The response is: " + response);

      is = conn.getInputStream();
      if (is == null) {
        return new JSONArray();
      }

      BufferedReader reader = new BufferedReader(new InputStreamReader(is));
      StringBuffer buffer = new StringBuffer();
      String line;
      while ((line = reader.readLine()) != null) {
        buffer.append(line + "\n");
      }

      if (buffer.length() != 0) {
        return new JSONArray(buffer.toString());
      }
    } catch (Exception e) {
      Log.e(TAG, e.getLocalizedMessage());
    } finally {
      if (is != null) {
        try{
          is.close();
        } catch (Exception ignore) {
        }
      }
    }
    return new JSONArray();
  }
}
