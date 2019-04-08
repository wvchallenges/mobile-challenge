package com.karlptrck.wavechallenge.api

import okhttp3.Interceptor
import okhttp3.Response

class WaveRequestInterceptor (private val accessToken : String) : Interceptor{

    override fun intercept(chain: Interceptor.Chain): Response {
        val request = chain.request()

        val url = request.url().newBuilder()
            .addQueryParameter("access_token", accessToken)
            .build()

        val newRequest = request.newBuilder()
            .url(url)
            .build()

        return chain.proceed(newRequest)
    }
}