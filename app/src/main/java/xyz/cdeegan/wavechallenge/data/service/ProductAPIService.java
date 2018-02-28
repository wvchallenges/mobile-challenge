package xyz.cdeegan.wavechallenge.data.service;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Header;
import retrofit2.http.Path;
import xyz.cdeegan.wavechallenge.data.entity.Product;

public interface ProductAPIService
{
	@GET("/businesses/{business_id}/products/")
	Call<List<Product>> getProductList(@Header("Authorization") String authHeader, @Path("business_id") String businessID);
}
