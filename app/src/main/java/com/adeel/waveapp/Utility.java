package com.adeel.waveapp;

import android.os.AsyncTask;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import javax.net.ssl.HttpsURLConnection;

/**
 * Created by Adeel on 09-Jan-17.
 * Utility class
 */

public class Utility {

//    private static final String LOG_TAG = Utility.class.getSimpleName();

    public static final String WAVE_BASE_URL = "https://api.waveapps.com";
    public static final String WAVE_PRODUCT_ENDPOINT = "/businesses/%s/products/"; //req: business id

    public static void GETRequest(final String urlString, final String accessToken,
                                  final TaskCompletionInterface taskCompletion) {

        new AsyncTask<String, Void, Integer>() {

            String mResponseString;

            @Override
            protected Integer doInBackground(String... params) {
                try {
                    URL url = new URL(urlString);
                    URLConnection urlConnection = url.openConnection();
                    urlConnection.setRequestProperty("Authorization", accessToken);

                    int responseCode;
                    HttpsURLConnection conn = (HttpsURLConnection) urlConnection;
                    conn.setRequestMethod("GET");
                    responseCode = conn.getResponseCode();

                    if (responseCode != HttpsURLConnection.HTTP_OK)
                        return responseCode;

                    mResponseString = "";
                    String line;
                    BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
                    while ((line = br.readLine()) != null) {
                        mResponseString += line;
                    }
                    return responseCode;

                } catch (IOException e) {
                    e.printStackTrace();
                }
                return -1;
            }

            @Override
            protected void onPostExecute(Integer result) {
                if (taskCompletion != null) {
                    if (result == HttpsURLConnection.HTTP_OK)
                        taskCompletion.onSuccess(mResponseString);
                    else
                        taskCompletion.onError(result);
                }
            }
        }.execute();
    }

}
