package com.eslimaf.mobilechallenge;

import android.support.annotation.Nullable;

import com.eslimaf.mobilechallenge.infrastructure.Credentials;
import com.eslimaf.mobilechallenge.infrastructure.waveapi.WaveApi;
import com.eslimaf.mobilechallenge.model.Product;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class ProductsPresenter implements ProductsContract.Presenter {

    @Nullable
    private ProductsContract.View mView;
    private WaveApi mWaveApi;

    public ProductsPresenter(WaveApi waveApi) {
        mWaveApi = waveApi;
    }

    @Override
    public void attachView(ProductsContract.View view) {
        mView = view;
    }

    @Override
    public void detachView() {
        if (null != mView) {
            mView = null;
        }
    }

    @Override
    public void getProducts() {
        if (null != mView) {
            mView.showProgress();
        }

        mWaveApi.getProductsByBusinessId(Credentials.BUSINESS_ID)
                .enqueue(new Callback<List<Product>>() {
                    @Override
                    public void onResponse(Call<List<Product>> call, Response<List<Product>> response) {
                        if (null != mView) {
                            mView.showProducts(response.body());
                            mView.hideProgress();
                        }
                    }

                    @Override
                    public void onFailure(Call<List<Product>> call, Throwable t) {
                        if (null != mView) {
                            mView.hideProgress();
                            mView.showErrorDialog();
                        }
                    }
                });
    }
}
