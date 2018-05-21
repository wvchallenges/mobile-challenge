package com.sample.dhruvmj.waveapp.model;

import android.databinding.BaseObservable;
import android.databinding.Bindable;

import com.google.gson.annotations.SerializedName;

import java.text.NumberFormat;
import java.util.Locale;

/**
 * @author Dhruv
 */

public class Product extends BaseObservable {
    @SerializedName("name")
    private String productName;
    private int price;

    public Product(String productName, int price) {
        this.productName = productName;
        this.price = price;
    }

    @Bindable
    public String getProductName() {
        return productName;
    }

    @Bindable
    public String getPrice() {
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(Locale.getDefault());
        return currencyFormat.format(price);
    }
}
