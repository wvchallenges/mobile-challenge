package com.karlptrck.wavechallenge.api

import com.karlptrck.wavechallenge.BuildConfig
import com.karlptrck.wavechallenge.model.Product

import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import org.jetbrains.anko.AnkoLogger
import org.jetbrains.anko.debug
import org.jetbrains.anko.error
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query


interface WaveService {

    @GET("/businesses/{businessId}/products/")
    fun getProducts(@Path("businessId") businessId : String,
                    @Query("page") page : Int,
                    @Query("page_size") pageSize : Int) : Call<List<Product>>

    companion object {
        private const val BASE_URL = "https://api.waveapps.com"

        fun create() : WaveService {
            val logger = HttpLoggingInterceptor()
            logger.level = HttpLoggingInterceptor.Level.BASIC

            val client = OkHttpClient.Builder()
                .addInterceptor(WaveRequestInterceptor(BuildConfig.WAVE_API_KEY))
                .addInterceptor(logger)
                .build()


            return Retrofit.Builder()
                .baseUrl(BASE_URL)
                .client(client)
                .addConverterFactory(GsonConverterFactory.create())
                .build()
                .create(WaveService::class.java)
        }
    }
}

val logger = AnkoLogger("API")

fun getProducts(
    service: WaveService,
    page : Int,
    page_size : Int,
    onSuccess : (products : List<Product>) -> Unit,
    onError : (error : String) -> Unit){

    service.getProducts(BuildConfig.WAVE_BUSINESS_ID, page, page_size).enqueue(
        object : Callback<List<Product>> {
            override fun onFailure(call: Call<List<Product>>?, t: Throwable) {
                logger.error { "Failed to get data!" }
                onError(t.message ?: "unknown error")
            }

            override fun onResponse(
                call: Call<List<Product>>?,
                response: Response<List<Product>>
            ) {
                logger.debug { "got a response $response" }

                if (response.isSuccessful) {
                    val products = response.body() ?: emptyList()
                    onSuccess(products)
                } else {
                    onError(response.errorBody()?.string() ?: "Unknown error")
                }
            }
        }
    )



}