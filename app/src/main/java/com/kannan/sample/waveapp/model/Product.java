package com.kannan.sample.waveapp.model;

import androidx.databinding.BaseObservable;
import androidx.databinding.Bindable;

import java.text.NumberFormat;
import java.util.Locale;

public class Product extends BaseObservable {
    private String name;
    private int price;

    public Product(String name, int price) {
        this.name = name;
        this.price = price;
    }

    @Bindable
    public String getName() {
        return name;
    }

    @Bindable
    public String getPrice() {
        return NumberFormat.getCurrencyInstance(Locale.getDefault()).format(price);
    }

}
