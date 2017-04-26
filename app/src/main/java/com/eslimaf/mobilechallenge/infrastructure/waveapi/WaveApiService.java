package com.eslimaf.mobilechallenge.infrastructure.waveapi;


import com.eslimaf.mobilechallenge.model.Product;

import java.io.IOException;
import java.util.List;

import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import retrofit2.Call;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;
import retrofit2.http.Path;

public class WaveApiService implements WaveApi {
    private static WaveApiService sInstance;
    private WaveApi mWaveApi;

    private WaveApiService() {

        OkHttpClient okHttpClient = new OkHttpClient.Builder()
                .addInterceptor(new Interceptor() {
                    @Override
                    public Response intercept(Chain chain) throws IOException {
                        Request request = chain.request();
                        request = request.newBuilder()
                                .addHeader("Authorization","Bearer 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm")
                                .build();
                        return chain.proceed(request);
                    }
                }).build();

        Retrofit retrofit = new Retrofit.Builder()
                .client(okHttpClient)
                .baseUrl(WAVEAPI_BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        mWaveApi = retrofit.create(WaveApi.class);
    }

    public static synchronized WaveApiService getInstance() {
        if (null == sInstance) {
            sInstance = new WaveApiService();
        }
        return sInstance;
    }

    @Override
    public Call<List<Product>> getProductsByBusinessId(@Path("businessId") String businessId) {
        return mWaveApi.getProductsByBusinessId(businessId);
    }
}
