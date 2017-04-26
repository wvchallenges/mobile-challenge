package com.eslimaf.mobilechallenge;

import android.util.Log;

import com.eslimaf.mobilechallenge.infrastructure.waveapi.WaveApiService;
import com.eslimaf.mobilechallenge.model.Product;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class ProductsPresenter implements ProductsContract.Presenter{
    @Override
    public void getProducts() {
        WaveApiService.getInstance().getProductsByBusinessId("89746d57-c25f-4cec-9c63-34d7780b044b")
                .enqueue(new Callback<List<Product>>() {
                    @Override
                    public void onResponse(Call<List<Product>> call, Response<List<Product>> response) {
                        Log.d("DEBUG", response.message());
                    }

                    @Override
                    public void onFailure(Call<List<Product>> call, Throwable t) {

                    }
                });
    }
}
