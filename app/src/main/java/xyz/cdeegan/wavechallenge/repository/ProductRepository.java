package xyz.cdeegan.wavechallenge.repository;

import android.arch.lifecycle.LiveData;
import android.arch.lifecycle.MutableLiveData;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;
import xyz.cdeegan.wavechallenge.data.entity.Product;
import xyz.cdeegan.wavechallenge.data.service.ProductAPIResponse;
import xyz.cdeegan.wavechallenge.data.service.ProductAPIService;

public class ProductRepository implements ProductRepositoryInterface
{
	private static final String WAVE_BASE_URL = "https://api.waveapps.com";
	private static final String WAVE_API_TOKEN = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm";
	private ProductAPIService productAPIService;

	public ProductRepository()
	{
		Retrofit retrofit = new Retrofit.Builder()
				.baseUrl(WAVE_BASE_URL)
				.addConverterFactory(GsonConverterFactory.create())
				.build();

		this.productAPIService = retrofit.create(ProductAPIService.class);
	}

	@Override
	public LiveData<ProductAPIResponse> getProducts(String businessID)
	{
		final MutableLiveData<ProductAPIResponse> liveData = new MutableLiveData<>();
		Call<List<Product>> call = productAPIService.getProductList("Bearer " + WAVE_API_TOKEN, businessID);
		call.enqueue(new Callback<List<Product>>()
		{
			@Override
			public void onResponse(Call<List<Product>> call, Response<List<Product>> response)
			{
				liveData.setValue(new ProductAPIResponse(response.body()));
			}

			@Override
			public void onFailure(Call<List<Product>> call, Throwable t)
			{
				liveData.setValue(new ProductAPIResponse(t));
			}
		});
		return liveData;
	}
}
