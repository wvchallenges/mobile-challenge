package com.kannan.sample.waveapp.viewmodel;

import android.app.Application;

import androidx.annotation.NonNull;
import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.Observer;

import com.kannan.sample.waveapp.contract.ViewModelContract;
import com.kannan.sample.waveapp.facade.ProductsApiFacade;
import com.kannan.sample.waveapp.model.Product;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class ProductsViewModel  extends AndroidViewModel implements ViewModelContract {
    private ProductsApiFacade productsApiFacade = new ProductsApiFacade();
    private MutableLiveData<List<Product>> productListLiveData = new MutableLiveData<>();

    public ProductsViewModel(@NonNull Application application) {
        super(application);
    }

    //Test Hook
    ProductsViewModel(@NonNull Application application, ProductsApiFacade productsApiFacade, MutableLiveData<List<Product>> productListLiveData) {
        super(application);
        this.productsApiFacade = productsApiFacade;
        this.productListLiveData = productListLiveData;
    }

    public void getProducts(String BUSINESS_ID) {
        productsApiFacade.getProducts(BUSINESS_ID, new Callback<List<Product>>() {
            @Override
            public void onResponse(Call<List<Product>> call, Response<List<Product>> response) {
                productListLiveData.setValue(response.body());
            }

            @Override
            public void onFailure(Call<List<Product>> call, Throwable t) {
                productListLiveData.setValue(null);
            }
        });
    }

    public void observe(LifecycleOwner lifecycleOwner, Observer<List<Product>> observer) {
        productListLiveData.observe(lifecycleOwner, observer);
    }
}
