package me.jimmydieng.wavechallenge.data.utils;


import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import me.jimmydieng.wavechallenge.data.Product;


public class ProductJSONConverter {
  private static final String TAG = "ProductJSONConverter";
  private static final String NAME_KEY = "name";
  private static final String PRICE_KEY = "price";

  public static Product parse(JSONObject jsonObject) {
    try {
      String name = jsonObject.getString(NAME_KEY);
      Double price = jsonObject.getDouble(PRICE_KEY);
      return new Product(name, price);
    } catch (JSONException jsonException) {
      Log.e(TAG, jsonException.getLocalizedMessage());
    }
    return null;
  }
}
