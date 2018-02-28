package xyz.cdeegan.wavechallenge.repository;

import android.arch.lifecycle.LiveData;

import xyz.cdeegan.wavechallenge.data.service.ProductAPIResponse;

public interface ProductRepositoryInterface
{
	LiveData<ProductAPIResponse> getProducts(String businessID);
}
