package com.dhamu.waveproject;

import android.app.ProgressDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;
import com.dhamu.waveproject.adapter.ProductAdapter;
import com.dhamu.waveproject.model.Product;
import com.dhamu.waveproject.retro.ApiClient;
import com.dhamu.waveproject.retro.ApiInterface;
import com.dhamu.waveproject.utils.Constant;
import com.dhamu.waveproject.utils.WifiDetector;
import java.util.ArrayList;
import retrofit2.Call;
import retrofit2.Response;

public class MainActivity extends AppCompatActivity {

    private ListView lvProduct;
    private ArrayList<Product> arrlstProduct;
    private ProgressDialog loDialog;
    private ProductAdapter adpProduct;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        setViews();

    }

    public void setViews() {
        lvProduct = (ListView) findViewById(R.id.lvProduct);
        loDialog = new ProgressDialog(MainActivity.this);
        arrlstProduct = new ArrayList<>();
        getProductList(Constant.BUSINESS_ID, Constant.ACCESS_TOKEN);
    }

    private void getProductList(String businessId, String accessToken) {

        if(loDialog != null) {
            loDialog.setCancelable(false);
            loDialog.setMessage("Loading...");
            loDialog.show();
        }

        if (new WifiDetector(MainActivity.this).isNetworkAvailable()) {
            ApiInterface apiService = ApiClient.getClient().create(ApiInterface.class);

            Call<ArrayList<Product>> call = apiService.getProductList("businesses/" + businessId + "/products?access_token=" + accessToken);

            call.enqueue(new retrofit2.Callback<ArrayList<Product>>() {
                @Override
                public void onResponse(Call<ArrayList<Product>> call, Response<ArrayList<Product>> response) {

                    ArrayList<Product> products = response.body();

                    if (loDialog != null && loDialog.isShowing()) {
                        loDialog.dismiss();
                    }

                    try {
                        if (products != null && products.size() > 0) {
                            if (arrlstProduct.size() > 0) {
                                arrlstProduct.addAll(products);
                                adpProduct.notifyDataSetChanged();
                            } else {
                                arrlstProduct = (ArrayList<Product>) products;
                                adpProduct = new ProductAdapter(MainActivity.this, arrlstProduct);
                                lvProduct.setAdapter(adpProduct);
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                }

                @Override
                public void onFailure(Call<ArrayList<Product>> call, Throwable t) {
                    if (loDialog != null && loDialog.isShowing()) {
                        loDialog.dismiss();
                    }
                }
            });
        }
        else {
            if (loDialog != null && loDialog.isShowing()) {
                loDialog.dismiss();
            }
        }

    }

}
