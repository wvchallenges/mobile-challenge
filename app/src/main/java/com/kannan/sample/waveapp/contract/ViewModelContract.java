package com.kannan.sample.waveapp.contract;

import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.Observer;

import com.kannan.sample.waveapp.model.Product;

import java.util.List;

public interface ViewModelContract {
    void observe(LifecycleOwner lifecycleOwner, Observer<List<Product>> observer);
    void getProducts(String BUSINESS_ID);
}
