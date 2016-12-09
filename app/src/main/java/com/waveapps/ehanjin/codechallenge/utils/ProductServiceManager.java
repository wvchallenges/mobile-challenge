package com.waveapps.ehanjin.codechallenge.utils;

import android.os.AsyncTask;
import android.text.Html;

import com.waveapps.ehanjin.codechallenge.model.Account;
import com.waveapps.ehanjin.codechallenge.model.Product;
import com.waveapps.ehanjin.codechallenge.model.ProductHolder;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by SJ on 12/7/16.
 */

public class ProductServiceManager {

    private static final String BUSINESS_ID = "89746d57-c25f-4cec-9c63-34d7780b044b";
    private static final String AUTHORITY = "https://api.waveapps.com/businesses/";
    private static final String BASE_PATH_PRODUCTS = "/products/";

    // JSON Node names
    public static final String TAG_ID = "id";
    public static final String TAG_URL = "url";
    public static final String TAG_NAME = "name";
    public static final String TAG_PRICE = "price";
    public static final String TAG_DESCRIPTION = "description";
    public static final String TAG_IS_SOLD = "is_sold";
    public static final String TAG_IS_BOUGHT = "is_bought";
    public static final String TAG_INCOME_ACCOUNT = "income_account";
    public static final String TAG_EXPENSE_ACCOUNT = "expense_account";
    public static final String TAG_ACTIVE = "active";
    public static final String TAG_DEFAULT_SALES_TAXES = "default_sales_taxes";
    public static final String TAG_DATE_CREATED = "date_created";
    public static final String TAG_DATE_MODIFIED = "date_modified";

    private static volatile ProductServiceManager Instance = null;
    public static ProductServiceManager getInstance() {
        ProductServiceManager localInstance = Instance;
        if (localInstance == null) {
            synchronized (ProductServiceManager.class) {
                localInstance = Instance;
                if (localInstance == null) {
                    Instance = localInstance = new ProductServiceManager();
                }
            }
        }
        return localInstance;
    }

    private ProductServiceManager() {
    }

    public boolean downloadProducts(IRequestCallBack callBack) {
        return downloadProducts(AUTHORITY + BUSINESS_ID + BASE_PATH_PRODUCTS, callBack);
    }

    public boolean downloadProducts(String url, IRequestCallBack callBack) {
        // Calling async task to get json
        new AsyncProductDownloader(callBack).execute(url);

        return true;
    }

    // Async task class to get json by making HTTP call
    public static class AsyncProductDownloader extends AsyncTask<String, Integer, List<Product>> {
        private static final String AUTH_HEADER = "Authorization";
        private static final String ACCESS_TOKEN = "Bearer 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm";
        String response = null;
        public final static int GET = 1;
        public final static int POST = 2;
        IRequestCallBack callBack;

        ProductHolder holder;

        public AsyncProductDownloader(IRequestCallBack callBack) {
            this.callBack = callBack;
        }
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            holder = new ProductHolder();
        }

        @Override
        protected List<Product> doInBackground(String... params) {

            String jsonStr = httpRequest(params[0], GET, null);

            if (jsonStr != null) {
                if(!parseJSON(jsonStr)) {
                    callBack.onError();
                }
            } else {
                callBack.onError();
            }
            return null;
        }

        @Override
        protected void onPostExecute(List<Product> result) {
            super.onPostExecute(result);
            callBack.onSuccess(holder);
        }

        public String httpRequest(String url, int method, List<NameValuePair> params) {
            try {
                // http client
                DefaultHttpClient httpClient = new DefaultHttpClient();
                HttpEntity httpEntity = null;
                HttpResponse httpResponse = null;

                // Checking http request method type
                if (method == POST) {
                    HttpPost httpPost = new HttpPost(url);
                    httpPost.setHeader(AUTH_HEADER, ACCESS_TOKEN);
                    if (params != null) {
                        httpPost.setEntity(new UrlEncodedFormEntity(params));
                    }
                    httpResponse = httpClient.execute(httpPost);

                } else if (method == GET) {
                    if (params != null) {
                        String paramString = URLEncodedUtils.format(params, "utf-8");
                        url += "?" + paramString;
                    }
                    HttpGet httpGet = new HttpGet(url);
                    httpGet.addHeader(AUTH_HEADER, ACCESS_TOKEN);
                    httpResponse = httpClient.execute(httpGet);

                }
                httpEntity = httpResponse.getEntity();
                String data = EntityUtils.toString(httpEntity);
                response = Html.fromHtml(data).toString();

                System.out.println("Response Code : "
                        + httpResponse.getStatusLine().getStatusCode());
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            } catch (ClientProtocolException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

            return response;

        }

        private boolean parseJSON(String jsonStr) {
            if (jsonStr != null) {
                try {
                    JSONArray jsonArray = new JSONArray(jsonStr);
                    for (int i=0;i< jsonArray.length(); i++) {
                        JSONObject jsonChild = (JSONObject) jsonArray.get(i);

                        if(jsonChild != null) {
                            Product product = fromJson(jsonChild);
                            holder.addProduct(product);
                        }
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                    return false;
                }
            }
            return true;
        }

        private Product fromJson(JSONObject jsonObject) {
            Product obj = new Product();
            // Deserialize json into object fields
            try {
                obj.setId(jsonObject.getLong(TAG_ID))
                    .setUrl(jsonObject.getString(TAG_URL))
                    .setName(jsonObject.getString(TAG_NAME))
                    .setPrice(jsonObject.getDouble(TAG_PRICE))
                    .setDescription(jsonObject.getString(TAG_DESCRIPTION))
                    .setSold(jsonObject.getBoolean(TAG_IS_SOLD))
                    .setBought(jsonObject.getBoolean(TAG_IS_BOUGHT))
                    .setDateCreated(jsonObject.getString(TAG_DATE_CREATED))
                    .setDateModified(jsonObject.getString(TAG_DATE_MODIFIED));

                try {
                    JSONObject jsonChild = jsonObject.getJSONObject(TAG_INCOME_ACCOUNT);
                    long account_id = jsonChild.getLong(TAG_ID);
                    Account account = holder.getAccount(new Long(account_id));
                    if(account == null) {
                        account = Account.fromJson(jsonChild);
                        holder.addAccount(account);
                    }
                    obj.setIncomeAccount(account);
                } catch (JSONException e) {
                }

                try {
                    JSONObject jsonChild = jsonObject.getJSONObject(TAG_EXPENSE_ACCOUNT);
                    long account_id = jsonChild.getLong(TAG_ID);
                    Account account = holder.getAccount(new Long(account_id));
                    if(account == null) {
                        account = Account.fromJson(jsonChild);
                        holder.addAccount(account);
                    }
                    obj.setExpenseAccount(account);
                } catch (JSONException e) {
                }

            } catch (JSONException e) {
                e.printStackTrace();
                return null;
            }
            return obj;
        }
    }
}
