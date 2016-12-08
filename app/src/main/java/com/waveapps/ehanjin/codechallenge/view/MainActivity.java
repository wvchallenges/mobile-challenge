package com.waveapps.ehanjin.codechallenge.view;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.DividerItemDecoration;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ProgressBar;

import com.waveapps.ehanjin.codechallenge.R;
import com.waveapps.ehanjin.codechallenge.model.Product;
import com.waveapps.ehanjin.codechallenge.model.ProductHolder;
import com.waveapps.ehanjin.codechallenge.utils.IRequestCallBack;
import com.waveapps.ehanjin.codechallenge.utils.ProductServiceManager;

public class MainActivity extends AppCompatActivity {

    private ProductHolder productHolder = null;
    private RecyclerView recyclerView;
    private ProgressBar progressBar;
    private ProductAdapter productAdapter;

    private IRequestCallBack<ProductHolder> callBack;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        progressBar = (ProgressBar) findViewById(R.id.progress_bar);
        recyclerView = (RecyclerView) findViewById(R.id.recycler_view);
        productAdapter = new ProductAdapter(this);
        recyclerView.setHasFixedSize(true);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getApplicationContext());
        recyclerView.setLayoutManager(mLayoutManager);
        recyclerView.addItemDecoration(new DividerItemDecoration(this, LinearLayoutManager.VERTICAL));
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        recyclerView.setAdapter(productAdapter);

        callBack = new IRequestCallBack<ProductHolder>() {
            @Override
            public void onSuccess(ProductHolder holder) {
                productHolder = holder;
                productAdapter.setList(productHolder.getProductList());
                progressBar.setVisibility(View.GONE);
            }

            @Override
            public void onError() {
                progressBar.setVisibility(View.GONE);
            }
        };

        progressBar.setVisibility(View.VISIBLE);
        ProductServiceManager.getInstance().downloadProducts(callBack);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_refresh) {
            productAdapter.reset();
            progressBar.setVisibility(View.VISIBLE);
            ProductServiceManager.getInstance().downloadProducts(callBack);
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
