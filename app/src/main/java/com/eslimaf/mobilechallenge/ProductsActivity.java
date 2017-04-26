package com.eslimaf.mobilechallenge;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

import com.eslimaf.mobilechallenge.infrastructure.waveapi.WaveApiService;
import com.eslimaf.mobilechallenge.model.Product;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class ProductsActivity extends AppCompatActivity {

    private ProductsContract.Presenter mPresenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_products);

        //TODO: Remove this call and inject
        mPresenter = new ProductsPresenter();
    }

    @Override
    protected void onResume() {
        super.onResume();
        mPresenter.getProducts();
    }


    public void setPresenter(ProductsContract.Presenter presenter){
        mPresenter = presenter;
    }
}
