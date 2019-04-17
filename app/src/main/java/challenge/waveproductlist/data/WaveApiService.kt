package challenge.waveproductlist.data

import challenge.waveproductlist.BuildConfig
import com.google.gson.FieldNamingPolicy
import com.google.gson.GsonBuilder
import io.reactivex.Single
import okhttp3.Interceptor
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import retrofit2.http.Query
import okhttp3.OkHttpClient
import okhttp3.Response
import retrofit2.http.Path
import java.io.IOException

interface WaveApiService {

    @GET("businesses/{business_id}/products/")
    fun getBusinessProducts(
        @Path(value = "business_id", encoded = true) businessId: String,
        @Query("page", encoded = true) page: Int,
        @Query("page_size", encoded = true) pageSize: Int) : Single<List<Product>>

    companion object {
        fun getService(): WaveApiService {
            var client = OkHttpClient.Builder().addInterceptor(object : Interceptor {
                @Throws(IOException::class)
                override fun intercept(chain: Interceptor.Chain): Response {
                    val newRequest = chain.request().newBuilder()
                        .addHeader("Authorization", "Bearer " + BuildConfig.apiKey)
                        .build()
                    return chain.proceed(newRequest)
                }
            }).build()

            val gsonBuilder = GsonBuilder()
            gsonBuilder.serializeNulls()
            gsonBuilder.setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)

            val retrofit = Retrofit.Builder()
                .client(client)
                .baseUrl("https://api.waveapps.com/")
                .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
                .addConverterFactory(GsonConverterFactory.create(gsonBuilder.create()))
                .build()
            return retrofit.create(WaveApiService::class.java)
        }
    }
}