package ai.victorl.wavechallengeapp.ui;

import android.os.Bundle;
import android.support.v4.widget.ContentLoadingProgressBar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;

import java.util.List;

import javax.inject.Inject;

import ai.victorl.wavechallengeapp.BuildConfig;
import ai.victorl.wavechallengeapp.R;
import ai.victorl.wavechallengeapp.di.WaveChallengeApplication;
import ai.victorl.wavechallengeapp.services.wave.BusinessProduct;
import ai.victorl.wavechallengeapp.services.wave.ProductsService;
import butterknife.BindView;
import butterknife.ButterKnife;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class ProductsActivity extends AppCompatActivity {
    private static final String DEMO_BUSINESS_ID = BuildConfig.WAVE_BUSINESS_ID;
    private static final String DEMO_WAVE_API_KEY = BuildConfig.WAVE_ACCESS_TOKEN;

    @BindView(R.id.toolbar) Toolbar toolbar;
    @BindView(R.id.products_recyclerview) RecyclerView productsRecyclerView;
    @BindView(R.id.products_progressbar) ContentLoadingProgressBar productsProgressBar;

    @Inject ProductsService productsService;
    @Inject ProductsAdapter productsAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_products);

        ButterKnife.bind(this);
        WaveChallengeApplication.from(this).getApplicationComponent().inject(this);

        setSupportActionBar(toolbar);

        productsRecyclerView.setLayoutManager(new LinearLayoutManager(this));
        productsRecyclerView.setAdapter(productsAdapter);

        productsProgressBar.show();
        productsService.getBusinessProducts(DEMO_BUSINESS_ID, DEMO_WAVE_API_KEY).enqueue(new Callback<List<BusinessProduct>>() {
            @Override
            public void onResponse(Call<List<BusinessProduct>> call, Response<List<BusinessProduct>> response) {
                productsAdapter.setProducts(response.body());
                productsProgressBar.hide();
            }

            @Override
            public void onFailure(Call<List<BusinessProduct>> call, Throwable t) {
                productsAdapter.clearProducts();
                productsProgressBar.hide();
            }
        });
    }
}
