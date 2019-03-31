package android.sample.wavechallenge.api.datasource

import android.sample.wavechallenge.model.Product
import android.sample.wavechallenge.model.Result

interface RemoteDataSource {
    suspend fun getProducts(businessId: String): Result<List<Product>>
}