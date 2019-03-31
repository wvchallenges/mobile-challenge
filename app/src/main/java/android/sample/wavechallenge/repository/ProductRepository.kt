package android.sample.wavechallenge.repository

import android.sample.wavechallenge.api.datasource.RemoteDataSource
import android.sample.wavechallenge.model.Product
import android.sample.wavechallenge.model.Result
import androidx.lifecycle.MutableLiveData
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.lang.Exception

class ProductRepository(private val waveRemoteDataSource: RemoteDataSource) {

    val products: MutableLiveData<List<Product>> by lazy {
        MutableLiveData<List<Product>>()
    }

    suspend fun refreshProducts(businessId: String) {
        withContext(Dispatchers.IO) {
            try {
                val result = waveRemoteDataSource.getProducts(businessId)
                if (result is Result.Success) {
                    products.postValue(result.data)
                }

            } catch (error: Exception) {
                throw ProductsRefreshError(error)
            }
        }
    }

    /**
     * Thrown when there was a error fetching products
     */
    class ProductsRefreshError(cause: Throwable) : Throwable(cause.message, cause)

    companion object {
        private var INSTANCE: ProductRepository? = null

        @JvmStatic
        fun getInstance(remoteDataSource: RemoteDataSource): ProductRepository {
            return INSTANCE ?: ProductRepository(remoteDataSource).apply { INSTANCE = this }
        }

        @JvmStatic
        fun destroyInstance() {
            INSTANCE = null
        }
    }
}