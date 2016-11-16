package me.jimmydieng.wavechallenge.products;


import android.content.Context;
import android.os.AsyncTask;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import me.jimmydieng.wavechallenge.data.Business;
import me.jimmydieng.wavechallenge.data.Product;
import me.jimmydieng.wavechallenge.data.utils.NetworkUtils;
import me.jimmydieng.wavechallenge.data.utils.ProductJSONConverter;

public class ProductModel {
  private Context context;

  public ProductModel(Context context) {
    this.context = context;
  }

  public void getProducts(Business business, Listener listener) {
    if (NetworkUtils.isConnected(context)) {
      new ProductsTask(listener).execute(business);
    } else {
      listener.onFailure();
    }
  }

  private static class ProductsTask extends AsyncTask<Business, Void, List<Product>> {
    private static final String HOSTNAME = "https://api.waveapps.com/businesses/";
    private Listener listener;

    public ProductsTask(Listener listener) {
      this.listener = listener;
    }

    private static String constructUrl(String businessId) {
      return HOSTNAME + businessId + "/products/";
    }

    private static HashMap<String, String> getParams() {
      HashMap<String, String> params = new HashMap<>(1);
      params.put("Authorization", "Bearer " + NetworkUtils.ACCESS_TOKEN);
      return params;
    }

    @Override
    protected List<Product> doInBackground(Business... businesses) {
      Business business = businesses[0];
      String url = constructUrl(business.getId());

      JSONArray jsonArray = NetworkUtils.getJsonArray(url, getParams());

      List<Product> products = new ArrayList<>();
      try {
        for (int i = 0; i < jsonArray.length(); i++) {
          JSONObject jsonObject = jsonArray.getJSONObject(i);
          products.add(ProductJSONConverter.parse(jsonObject));
        }
      } catch (JSONException e) {
      }
      return products;
    }

    @Override
    protected void onPostExecute(List<Product> products) {
      listener.onSuccess(products);
    }
  }

  public interface Listener {
    void onSuccess(List<Product> products);

    void onFailure();
  }
}
