package com.example.myproducts.network

import com.example.myproducts.models.Product
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import retrofit2.http.Path

interface WaveApi {

    @GET("businesses/{businessId}/products")
    suspend fun getProducts(@Path("businessId") businessId: String): List<Product>

    companion object {

        private const val BASE_URL = "https://api.waveapps.com/"

        //Logs requests to Logcat
        private val logger = HttpLoggingInterceptor().apply {
            level = HttpLoggingInterceptor.Level.BODY
        }

        //Injects the Auth Header
        private val authInterceptor = AuthInterceptor()

        private val client = OkHttpClient.Builder()
            .addInterceptor(authInterceptor)
            .addInterceptor(logger)
            .build()

        operator fun invoke(): WaveApi {
            return Retrofit.Builder()
                .baseUrl(BASE_URL)
                .client(client)
                .addConverterFactory(GsonConverterFactory.create())
                .build()
                .create(WaveApi::class.java)
        }
    }

}