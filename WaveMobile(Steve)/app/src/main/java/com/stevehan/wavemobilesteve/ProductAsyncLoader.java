package com.stevehan.wavemobilesteve;

import android.content.AsyncTaskLoader;
import android.content.Context;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by schan on 16-03-10.
 */
public class ProductAsyncLoader extends AsyncTaskLoader<List<Product>> {
    private final String WAVE_BASE_URL =
            "https://api.waveapps.com/";
    private final String LOG_TAG = "ProductAsyncLoader";

    public ProductAsyncLoader(Context context) {
        super(context);
    }

    @Override
    public List<Product> loadInBackground() {
        HttpURLConnection urlConnection = null;
        BufferedReader reader = null;

        String productsJsonStr = null;

        try {
            final String BUSINESS_PARAM = "businesses/";
            final String PRODUCTS_PARAM = "products/";
            final String ACCESS_TOKEN_PARAM = "?access_token=";
            String strUrl = WAVE_BASE_URL + BUSINESS_PARAM + BuildConfig.BUSINESS_ID + "/"
                    + PRODUCTS_PARAM + ACCESS_TOKEN_PARAM + BuildConfig.ACCESS_TOKEN;

            //https://api.waveapps.com/businesses/89746d57-c25f-4cec-9c63-34d7780b044b/products/?access_token=9IL9uJe3KIlWjGKhvHk731ARQaCVK6
            URL url = new URL(strUrl);

            urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            urlConnection.connect();

            InputStream inputStream = urlConnection.getInputStream();
            StringBuffer buffer = new StringBuffer();
            if (inputStream == null) {
                return null;
            }
            reader = new BufferedReader(new InputStreamReader(inputStream));

            String line;
            while ((line = reader.readLine()) != null) {
                buffer.append(line + "\n");
            }

            productsJsonStr = buffer.toString();
            return getProductListFromJson(productsJsonStr);
        } catch (IOException e) {
            Log.e(LOG_TAG, "Error ", e);
        } catch (JSONException e) {
            Log.e(LOG_TAG, e.getMessage(), e);
            e.printStackTrace();
        } finally {
            if (urlConnection != null) {
                urlConnection.disconnect();
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (final IOException e) {
                    Log.e(LOG_TAG, "Error closing stream", e);
                }
            }
        }

        return null;
    }

    private List<Product> getProductListFromJson(String productsJsonStr) throws JSONException {
        final String KEY_NAME = "name";
        final String KEY_PRICE = "price";

        List<Product> productList = new ArrayList<Product>();

        try {
            JSONArray productArray = new JSONArray(productsJsonStr);
            for (int i = 0; i < productArray.length(); i++) {
                JSONObject productObj = productArray.getJSONObject(i);
                String name = productObj.getString(KEY_NAME);
                double price = productObj.getDouble(KEY_PRICE);
                Product product = new Product(name, price);
                productList.add(product);
            }

        } catch (JSONException e) {
            Log.e(LOG_TAG, e.getMessage(), e);
            e.printStackTrace();
        }

        return productList;
    }
}
