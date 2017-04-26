package com.eslimaf.mobilechallenge.infrastructure.waveapi;


import com.eslimaf.mobilechallenge.infrastructure.Credentials;
import com.eslimaf.mobilechallenge.model.Product;

import org.junit.Test;

import java.io.IOException;
import java.util.List;

import retrofit2.Call;
import retrofit2.Response;

import static junit.framework.Assert.assertTrue;

public class WaveApiCallTest {

    @Test
    public void testGetProductsApiCall() {
        Call<List<Product>> call = WaveApiService.getInstance()
                .getProductsByBusinessId(Credentials.BUSINESS_ID);

        try {
            Response<List<Product>> response = call.execute();
            assertTrue(response.isSuccessful() && response.body().size() > 0);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
