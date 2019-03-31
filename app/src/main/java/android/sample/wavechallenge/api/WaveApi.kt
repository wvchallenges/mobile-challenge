package android.sample.wavechallenge.api

import android.sample.wavechallenge.model.Product
import kotlinx.coroutines.Deferred
import retrofit2.http.GET
import retrofit2.http.Path

//A retrofit Network Interface for the Wave Api
interface WaveApi{
    @GET("businesses/{business_id}/products/")
    fun getProductsAsync(@Path("business_id") businessId: String): Deferred<List<Product>>
}