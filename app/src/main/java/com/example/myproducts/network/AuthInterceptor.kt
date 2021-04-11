package com.example.myproducts.network

import okhttp3.Interceptor
import okhttp3.Response

//Adds the Authorization Header to all outgoing requests
class AuthInterceptor : Interceptor {
    override fun intercept(chain: Interceptor.Chain): Response {

        //In a real application the token would be stored somewhere like SharedPrefs, we would retrieve it here.
        val tokenManager = TokenManager()

        val newRequest = chain.request()
            .newBuilder()
            .addHeader("Authorization", "Bearer ${tokenManager.getToken()}")
            .build()
        return chain.proceed(newRequest)
    }
}