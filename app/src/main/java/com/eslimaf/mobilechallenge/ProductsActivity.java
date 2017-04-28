package com.eslimaf.mobilechallenge;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.widget.ListView;

import com.eslimaf.mobilechallenge.infrastructure.waveapi.WaveApiService;
import com.eslimaf.mobilechallenge.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductsActivity extends AppCompatActivity implements ProductsContract.View {
    private static final String BUNDLE_PRODUCTS_KEY = "retrieved_products";
    private ProductsContract.Presenter mPresenter;
    private ProductsListAdapter mProductsListAdapter;
    private ArrayList<Product> mProductArrayList = new ArrayList<>();
    private ProgressDialog mProgressDialog;
    private boolean isLoading;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_products);

        if (savedInstanceState != null && savedInstanceState.containsKey(BUNDLE_PRODUCTS_KEY)) {
            mProductArrayList = savedInstanceState.getParcelableArrayList(BUNDLE_PRODUCTS_KEY);
        }

        //This presenter could be injected using Dagger2
        mPresenter = new ProductsPresenter(WaveApiService.getInstance());

        mProductsListAdapter = new ProductsListAdapter(this, mProductArrayList);
        ListView productListView = (ListView) findViewById(R.id.products_list);
        productListView.setAdapter(mProductsListAdapter);
    }

    @Override
    public void onSaveInstanceState(Bundle outState) {
        outState.putParcelableArrayList(BUNDLE_PRODUCTS_KEY, mProductArrayList);
        super.onSaveInstanceState(outState);
    }

    @Override
    protected void onResume() {
        super.onResume();
        mPresenter.attachView(this);
        if (mProductArrayList.isEmpty()) {
            isLoading = true;
            mPresenter.getProducts();
        }
    }

    @Override
    protected void onPause() {
        mPresenter.detachView();
        super.onPause();
    }

    @Override
    public void showProducts(List<Product> products) {
        if (null != products) {
            mProductArrayList.addAll(products);
            mProductsListAdapter.notifyDataSetChanged();
            isLoading = false;
        }
    }

    @Override
    public void showProgress() {
        if (null == mProgressDialog) {
            mProgressDialog = new ProgressDialog(this, ProgressDialog.STYLE_SPINNER);
            mProgressDialog.setIndeterminate(true);
            mProgressDialog.setTitle(getString(R.string.please_wait));
            mProgressDialog.setMessage(getString(R.string.retrieving_products));
        }

        mProgressDialog.show();
    }

    @Override
    public void hideProgress() {
        if (null != mProgressDialog && mProgressDialog.isShowing()) {
            mProgressDialog.dismiss();
        }
    }

    @Override
    public void showErrorDialog() {
        final AlertDialog alertDialog = new AlertDialog.Builder(this).create();
        alertDialog.setTitle(getString(R.string.ops));
        alertDialog.setMessage(getString(R.string.check_connection));
        alertDialog.setButton(DialogInterface.BUTTON_NEGATIVE, "Cancel", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                alertDialog.dismiss();
            }
        });
        alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, "Retry", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                mPresenter.getProducts();
            }
        });
        alertDialog.show();
    }

    public boolean isLoading() {
        return isLoading;
    }
}
