package com.derekcsm.wave_example._api

import com.derekcsm.wave_example._base.Constants
import okhttp3.HttpUrl
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.adapter.rxjava.RxJavaCallAdapterFactory
import retrofit2.converter.moshi.MoshiConverterFactory

class ApiBuilder {

  fun create(): WaveApi {

    var okHttpClientBuilder: OkHttpClient.Builder = OkHttpClient.Builder()
    okHttpClientBuilder.addInterceptor(OkHttpHeadersInterceptor())
    var okHttpClient = okHttpClientBuilder.build()

    val retrofit = Retrofit.Builder()
        .baseUrl(getBaseUrl())
        .client(okHttpClient)
        .addCallAdapterFactory(RxJavaCallAdapterFactory.create())
        .addConverterFactory(MoshiConverterFactory.create())
        .build()

    return retrofit.create(WaveApi::class.java)
  }

  private fun getBaseUrl(): HttpUrl {
    return HttpUrl.Builder()
        .scheme("https")
        .host(Constants.endpoint)
        .build()
  }
}
