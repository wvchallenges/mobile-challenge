package android.sample.wavechallenge.api

import android.sample.wavechallenge.Constants
import com.jakewharton.retrofit2.adapter.kotlin.coroutines.CoroutineCallAdapterFactory
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object ApiFactory {

    private val authInterceptor = Interceptor { chain ->
        val newRequest = chain.request()
            .newBuilder()
            .addHeader("Authorization", "Bearer " + Constants.WAVE_API_KEY)
            .build()

        chain.proceed(newRequest)
    }

    private val logger = HttpLoggingInterceptor().setLevel(HttpLoggingInterceptor.Level.BASIC)

    private val waveClient = OkHttpClient().newBuilder()
        .addInterceptor(logger)
        .addInterceptor(authInterceptor)
        .build()


    private fun retrofit(): Retrofit = Retrofit.Builder()
        .client(waveClient)
        .baseUrl(Constants.WAVE_API_URL)
        .addConverterFactory(GsonConverterFactory.create())
        .addCallAdapterFactory(CoroutineCallAdapterFactory())
        .build()


    val waveApi: WaveApi = retrofit().create(WaveApi::class.java)
}