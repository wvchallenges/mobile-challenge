package xyz.cdeegan.wavechallenge.ui;

import android.arch.lifecycle.LiveData;
import android.arch.lifecycle.MediatorLiveData;
import android.arch.lifecycle.ViewModel;

import xyz.cdeegan.wavechallenge.data.service.ProductAPIResponse;
import xyz.cdeegan.wavechallenge.repository.ProductRepository;
import xyz.cdeegan.wavechallenge.repository.ProductRepositoryInterface;

public class ProductListViewModel extends ViewModel
{
	private MediatorLiveData<ProductAPIResponse> productAPIResponse;
	private ProductRepositoryInterface productRepository;

	public ProductListViewModel()
	{
		productAPIResponse = new MediatorLiveData<>();
		productRepository = new ProductRepository();
	}

	public LiveData<ProductAPIResponse> loadProducts(String businessID)
	{
		productAPIResponse.addSource(productRepository.getProducts(businessID),
				response -> productAPIResponse.setValue(response));
		return productAPIResponse;
	}
}
