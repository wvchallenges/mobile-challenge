package com.example.myproducts.network

import com.example.myproducts.models.Product
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET

interface WaveApi {
    @GET("89746d57-c25f-4cec-9c63-34d7780b044b/products")
    suspend fun getProducts(): List<Product>

    companion object {

        private const val BASE_URL = "https://api.waveapps.com/businesses/"

        private val logger = HttpLoggingInterceptor().apply {
            level = HttpLoggingInterceptor.Level.BODY
        }
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