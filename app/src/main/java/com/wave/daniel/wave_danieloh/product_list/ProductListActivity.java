package com.wave.daniel.wave_danieloh.product_list;


import android.os.Bundle;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.ProgressBar;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.wave.daniel.wave_danieloh.BaseActivity;
import com.wave.daniel.wave_danieloh.R;
import com.wave.daniel.wave_danieloh.engine.Engine;
import com.wave.daniel.wave_danieloh.engine.url_manager.UrlManager;
import com.wave.daniel.wave_danieloh.engine.volley_manager.VolleyResponse;
import com.wave.daniel.wave_danieloh.models.Product;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductListActivity extends BaseActivity {


    private static final String BUSINESS_ID = "89746d57-c25f-4cec-9c63-34d7780b044b";
    private static final String AUTHORIZATION_HEADER = "Authorization";
    private static final String AUTHORIZATION_TOKEN = "Bearer 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm";



    private Toolbar mToolbar;
    private RecyclerView productListView;
    private ArrayList<Product> productList;
    private ProductAdapter mAdapter;
    private ProgressBar progressBar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.product_list_layout);

        this.productList = new ArrayList<Product>();

        initUI();
        getDataFromServer();

    }

    /**
     * initialize toolbar
     * */
    private void initToolbar() {
        mToolbar = (Toolbar) findViewById(R.id.toolbar);
        mToolbar.setTitleTextColor(ContextCompat.getColor(this, android.R.color.white));
        setSupportActionBar(mToolbar);

    }

    /**
     * inflate View
     * */
    private void initUI() {
        initToolbar();

        super.mainView = findViewById(R.id.product_list_main_view);

        progressBar = (ProgressBar)findViewById(R.id.progressBar);
        productListView = (RecyclerView) findViewById(R.id.product_list_view);
        mAdapter = new ProductAdapter(productList, this);
        productListView.setAdapter(mAdapter);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getApplicationContext());
        productListView.setLayoutManager(mLayoutManager);

    }


    /**
    * Extract data from Server
    * */
    private void getDataFromServer() {

        if (!isConnectedToInternet || !isNetworkAvailable(this)) {
            showSnackBar(getString(R.string.network_error_msg));
            return;
        }

        progressBar.setVisibility(View.VISIBLE);
        VolleyResponse<String> volleyResponse = new VolleyResponse<>(new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                //Parsing Json data
                Type listType = new TypeToken<List<Product>>() {}.getType();
                productList = new Gson().fromJson(response, listType);

                populateDataOnUi();// populate data on the screen

                progressBar.setVisibility(View.GONE);
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e("onErrorResponse", " " + error.toString());

                progressBar.setVisibility(View.GONE);
                showSnackBar(error.toString()); // if something goes wrong display error message with Snackbar

            }
        });

        Map<String, String> params = new HashMap<>();
        params.put(AUTHORIZATION_HEADER, AUTHORIZATION_TOKEN);
        String url = UrlManager.getBusinessListUrl(BUSINESS_ID);
        Engine.getVolleyManager().sendStringRequest(Request.Method.GET, url, volleyResponse ,null, params);

    }


    /**
     * populate data on the screen
     * */
    private void populateDataOnUi() {
        mAdapter.setProductList(productList);
        mAdapter.notifyDataSetChanged();

    }


    @Override
    protected void onStop() {
        super.onStop();

        Engine.getVolleyManager().cancelAllRequest(); // stop all server requests

    }


}
