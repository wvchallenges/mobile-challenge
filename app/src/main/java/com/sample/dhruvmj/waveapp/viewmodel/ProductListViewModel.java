package com.sample.dhruvmj.waveapp.viewmodel;

import android.app.Application;
import android.arch.lifecycle.AndroidViewModel;
import android.arch.lifecycle.LifecycleOwner;
import android.arch.lifecycle.MutableLiveData;
import android.arch.lifecycle.Observer;
import android.support.annotation.NonNull;

import com.sample.dhruvmj.waveapp.model.Product;
import com.sample.dhruvmj.waveapp.network.APICaller;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * @author Dhruv
 */

public class ProductListViewModel extends AndroidViewModel {
    private static final String BUSINESS_ID = "89746d57-c25f-4cec-9c63-34d7780b044b";
    private MutableLiveData<List<Product>> productListLiveData = new MutableLiveData<>();

    public ProductListViewModel(@NonNull Application application) {
        super(application);
    }

    /**
     * This method will fetch list of products using APICaller
     */
    public void fetchProductList() {
        APICaller apiCaller = new APICaller();
        apiCaller.getListOfProducts(BUSINESS_ID, new Callback<List<Product>>() {
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
