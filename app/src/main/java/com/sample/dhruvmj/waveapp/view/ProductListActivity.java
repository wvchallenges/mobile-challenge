package com.sample.dhruvmj.waveapp.view;

import android.arch.lifecycle.Observer;
import android.arch.lifecycle.ViewModelProviders;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.ProgressBar;

import com.sample.dhruvmj.waveapp.R;
import com.sample.dhruvmj.waveapp.model.Product;
import com.sample.dhruvmj.waveapp.util.NetworkUtil;
import com.sample.dhruvmj.waveapp.viewmodel.ProductListViewModel;

import java.util.List;

public class ProductListActivity extends AppCompatActivity {
    private RecyclerView productListRecyclerView;
    private ProgressBar progressBar;
    private ProductListViewModel productListViewModel;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_list);
        productListRecyclerView = findViewById(R.id.rv_product_list);
        progressBar = findViewById(R.id.pb_loading);
        productListRecyclerView.setAdapter(new ProductListAdapter(this));
        productListRecyclerView.setLayoutManager(new LinearLayoutManager(this));

        productListViewModel = ViewModelProviders.of(this).get(ProductListViewModel.class);
        productListViewModel.observe(this, new Observer<List<Product>>() {
            @Override
            public void onChanged(@Nullable List<Product> products) {
                progressBar.setVisibility(View.GONE);
                ((ProductListAdapter) productListRecyclerView.getAdapter()).setItems(products);
            }
        });
        if (NetworkUtil.isNetworkConnected(this)) {
            progressBar.setVisibility(View.VISIBLE);
            productListViewModel.fetchProductList();
        }
    }

    @Override
    protected void onDestroy() {
        productListRecyclerView = null;
        progressBar = null;
        productListViewModel = null;
        super.onDestroy();
    }
}
