package com.jameschoi.wave;

import android.os.Bundle;
import android.support.design.widget.CoordinatorLayout;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.ListView;
import android.widget.ProgressBar;

import com.jameschoi.wave.adapter.ProductsAdapter;
import com.jameschoi.wave.utils.Utils;
import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;

import org.json.JSONArray;

import cz.msebera.android.httpclient.Header;

public class MainActivity extends AppCompatActivity {

    // Debug.
    private final String TAG = "MainActivity";

    // Members.
    private CoordinatorLayout mCoorLayout;
    private ProgressBar mProgressBar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        mCoorLayout = (CoordinatorLayout) findViewById(R.id.am_coordinatorlayout);
        mProgressBar = (ProgressBar) findViewById(R.id.amc_progressbar);
    }

    @Override
    protected void onResume() {
        super.onResume();

        // Check data connection.
        if (!Utils.hasDataConnection(this)) {
            showNoDataSnackbar();
            mProgressBar.setVisibility(View.GONE);
        } else {
            // Query for products.
            requestAuthentication();
        }
    }

    /*
     * This method creates a SnackBar with no data connection message and displays it.
     */
    private void showNoDataSnackbar() {
        Snackbar sb = Snackbar.make(mCoorLayout, R.string.no_data_connection_msg, Snackbar.LENGTH_INDEFINITE);
        sb.setAction(R.string.retry_text, new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (!Utils.hasDataConnection(MainActivity.this)) {
                    showNoDataSnackbar();
                } else {
                    // Show the progressbar and start the query process.
                    mProgressBar.setVisibility(View.VISIBLE);
                    requestAuthentication();
                }
            }
        });
        sb.show();
    }

    /*
     * This method checks if the access-token is valid.
     */
    private void requestAuthentication() {
        // Create new HTTP client and add access token into header.
        String authURL = "https://api.waveapps.com/user/";
        AsyncHttpClient httpClient = new AsyncHttpClient();
        httpClient.addHeader("Authorization", "Bearer 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm");
        httpClient.get(authURL, new AsyncHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                if (statusCode == 200) {
                    // Authorization was successful.
                    queryProducts();
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {
                if (statusCode == 401) {
                    Snackbar.make(mCoorLayout, R.string.unauthorized_user_msg, Snackbar.LENGTH_LONG).show();
                } else {
                    Snackbar.make(mCoorLayout, R.string.auth_went_wrong_msg, Snackbar.LENGTH_LONG).show();
                }
            }
        });
    }

    /*
     * This method will query for products.
     */
    private void queryProducts() {
        String productsUrl = "https://api.waveapps.com/businesses/89746d57-c25f-4cec-9c63-34d7780b044b/products/";
        AsyncHttpClient httpClient = new AsyncHttpClient();
        httpClient.addHeader("Authorization", "Bearer 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm");
        httpClient.get(productsUrl, new AsyncHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                if (statusCode == 200) {
                    // Query was a success.
                    JSONArray arr = Utils.getProductList(responseBody);
                    // Setup the listview.
                    ProductsAdapter adapter = new ProductsAdapter(arr, MainActivity.this);
                    ListView lv = (ListView) findViewById(R.id.amc_listview);
                    lv.setAdapter(adapter);
                    lv.setVisibility(View.VISIBLE);
                    mProgressBar.setVisibility(View.GONE);
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {
                if (statusCode == 401) {
                    Snackbar.make(mCoorLayout, R.string.unauthorized_user_msg, Snackbar.LENGTH_LONG).show();
                } else if (statusCode == 404) {
                    Snackbar.make(mCoorLayout, R.string.invalid_business_id_msg, Snackbar.LENGTH_LONG).show();
                } else {
                    Snackbar.make(mCoorLayout, R.string.product_query_went_wrong_msg, Snackbar.LENGTH_LONG).show();
                }
            }
        });
    }
}
