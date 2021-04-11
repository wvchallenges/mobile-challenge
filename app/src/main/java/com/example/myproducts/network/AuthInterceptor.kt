package com.example.myproducts.network

import okhttp3.Interceptor
import okhttp3.Response

//Adds the Authorization Header to all outgoing requests
class AuthInterceptor:Interceptor {
    override fun intercept(chain: Interceptor.Chain): Response {
        val newRequest = chain.request()
            .newBuilder()
            .addHeader("Authorization","Bearer 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm")
            .build()
        return chain.proceed(newRequest)
    }
}