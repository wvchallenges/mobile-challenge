package com.alihn.waveapp.network

import okhttp3.Interceptor
import okhttp3.Response
import java.io.IOException
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Created by 0xAliHn
 */

@Singleton
class RequestInterceptor @Inject constructor() : Interceptor {

    @Throws(IOException::class)
    override fun intercept(chain: Interceptor.Chain): Response {
        val original = chain.request()
        val originalHttpUrl = original.url()

        val url = originalHttpUrl.newBuilder()
                .build()

        val request = original.newBuilder()
                .url(url)
                .addHeader(AUTHORIZATION, "Bearer $ACCESS_TOKEN")
                .build()

        return chain.proceed(request)
    }

    companion object {
        private const val AUTHORIZATION = "Authorization"
        private const val ACCESS_TOKEN = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
    }
}
