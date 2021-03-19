package com.kannan.sample.waveapp.view.activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.lifecycle.ViewModelProviders;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.kannan.sample.waveapp.R;
import com.kannan.sample.waveapp.contract.ViewModelContract;
import com.kannan.sample.waveapp.model.Product;
import com.kannan.sample.waveapp.util.ConnectionUtil;
import com.kannan.sample.waveapp.view.adapter.ProductsListAdapter;
import com.kannan.sample.waveapp.viewmodel.ProductsViewModel;

import java.util.List;

public class HomeActivity extends AppCompatActivity {
    private RecyclerView productsRecyclerView;
    private ProgressBar progressBar;
    private TextView errorTextView;
    private ViewModelContract viewModel;
    private static final String BUSINESS_ID = "89746d57-c25f-4cec-9c63-34d7780b044b";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setupView();
        initialize();
    }

    private void setupView (){
        setContentView(R.layout.activity_home);
        errorTextView = findViewById(R.id.tv_error);
        productsRecyclerView = findViewById(R.id.rv_products_list);
        progressBar = findViewById(R.id.pb_spinner);
        productsRecyclerView.setAdapter(new ProductsListAdapter(this));
        productsRecyclerView.setLayoutManager(new LinearLayoutManager(this));
    }

    private void initialize() {
        viewModel = ViewModelProviders.of(this).get(ProductsViewModel.class);
        viewModel.observe(this, products -> { updateView(products); });

        if (ConnectionUtil.isConnectivityAvailable(this)) {
            progressBar.setVisibility(View.VISIBLE);
            viewModel.getProducts(BUSINESS_ID);
        } else {
            errorTextView.setText(R.string.no_connection);
            errorTextView.setVisibility(View.VISIBLE);
        }
    }

    private void updateView(List<Product> products) {
        progressBar.setVisibility(View.GONE);
        if (products == null) {
            errorTextView.setText(R.string.api_failure);
            errorTextView.setVisibility(View.VISIBLE);
        } else {
            errorTextView.setVisibility(View.GONE);
            ((ProductsListAdapter) productsRecyclerView.getAdapter()).setItems(products);
        }
    }

    @Override
    protected void onDestroy() {
        productsRecyclerView = null;
        progressBar = null;
        viewModel = null;
        super.onDestroy();
    }
}