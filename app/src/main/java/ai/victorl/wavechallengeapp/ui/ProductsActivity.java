package ai.victorl.wavechallengeapp.ui;

import android.os.Bundle;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import ai.victorl.wavechallengeapp.R;
import ai.victorl.wavechallengeapp.WaveChallengeApplication;
import ai.victorl.wavechallengeapp.services.wave.BusinessProduct;
import ai.victorl.wavechallengeapp.services.wave.ProductsService;
import ai.victorl.wavechallengeapp.services.wave.WaveApi;
import butterknife.BindView;
import butterknife.ButterKnife;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * The BusinessProducts activity screen which shows a list of products owned by the business id.
 */
public class ProductsActivity extends AppCompatActivity {
    @BindView(R.id.toolbar) Toolbar toolbar;
    @BindView(R.id.products_swipefreshlayout) SwipeRefreshLayout productsSwipeRefreshLayout;
    @BindView(R.id.products_recyclerview) RecyclerView productsRecyclerView;

    @Inject ProductsService productsService;
    @Inject ProductsAdapter productsAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_products);

        ButterKnife.bind(this);
        WaveChallengeApplication.from(this).getApplicationComponent().inject(this);

        setSupportActionBar(toolbar);

        productsSwipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                loadProducts();
            }
        });

        productsRecyclerView.setLayoutManager(new LinearLayoutManager(this));
        productsRecyclerView.setAdapter(productsAdapter);

        loadProducts();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.products_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.menu_refresh:
                loadProducts();
                return true;
            case R.id.menu_businessid:
                showBusinessId();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    private void loadProducts() {
        productsSwipeRefreshLayout.setRefreshing(true);
        productsService.getBusinessProducts(WaveApi.DEMO_BUSINESS_ID, WaveApi.DEMO_WAVE_API_KEY)
                .enqueue(new Callback<List<BusinessProduct>>() {
            @Override
            public void onResponse(Call<List<BusinessProduct>> call, Response<List<BusinessProduct>> response) {
                productsAdapter.setProducts(response.body());
                productsSwipeRefreshLayout.setRefreshing(false);
            }

            @Override
            public void onFailure(Call<List<BusinessProduct>> call, Throwable t) {
                productsAdapter.clearProducts();
                productsSwipeRefreshLayout.setRefreshing(false);
            }
        });
    }

    private void showBusinessId() {
        new AlertDialog.Builder(this)
                .setTitle(R.string.dialog_businessid_title)
                .setMessage(String.format(Locale.getDefault(), "%s", WaveApi.DEMO_BUSINESS_ID))
                .show();
    }
}
