package android.sample.wavechallenge.api

import android.sample.wavechallenge.api.datasource.RemoteDataSource
import android.sample.wavechallenge.model.Product
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import retrofit2.HttpException
import android.sample.wavechallenge.model.Result

class WaveRemoteDataSource private constructor(private val waveApi: WaveApi) :
    RemoteDataSource {

    override suspend fun getProducts(businessId: String): Result<List<Product>> = withContext(Dispatchers.IO) {
        val request = waveApi.getProductsAsync(businessId)
        try {
            val response = request.await()
            if (response.isNotEmpty()) {
                Result.Success(response)
            } else {
                Result.Error(RemoteDataNotFoundException())
            }
        } catch (ex: HttpException) {
            Result.Error(RemoteDataNotFoundException())
        } catch (ex: Throwable) {
            Result.Error(RemoteDataNotFoundException())
        }

    }

    companion object {
        fun newInstance() = WaveRemoteDataSource(ApiFactory.waveApi)
    }
}
