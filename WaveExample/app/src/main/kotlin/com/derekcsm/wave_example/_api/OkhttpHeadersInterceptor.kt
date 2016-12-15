package com.derekcsm.wave_example._api

import android.util.Log
import com.derekcsm.wave_example._base.Constants
import okhttp3.Interceptor
import okhttp3.Response
import java.io.IOException

class OkHttpHeadersInterceptor constructor() : Interceptor {
  private val TAG = "OkHttpHeadersIntercept"

  @Throws(IOException::class)
  override fun intercept(chain: Interceptor.Chain): Response {
    val builder = chain.request().newBuilder()
    builder.addHeader("Connection", "Keep-Alive")
    builder.addHeader("Accept-Charset", "UTF-8")
    if (chain.request().header("Accept") == null)
      builder.addHeader("Accept", "application/json")
    builder.addHeader("Content-Type", "application/json")

    // add authorization header to request and proceed
    builder.addHeader("Authorization", "Bearer " + Constants.ACCESS_TOKEN)
    var response = chain.proceed(builder.build())

    // -- TODO
    // -- everything below this point is not doing anything
    // -- if I were to implement Oauth2 correctly we'd have refresh/proceed setup

    Log.d(TAG, "intercept: response=" + response.code() + " url=" + response.request().url().toString())
    if ((response.code() == 401) and !response.request().url().toString().contains("/oauth/token")) {
      //response = chain.proceed(retryOAuthAuthentication(builder))
    }

    // Hypothetically speaking if after retrying auth, still 401 then notify unauthorized
    if ((response.code() == 401) and response.request().url().toString().contains("oauth/token")) {
      Log.d(TAG, "intercept NOTIFY UNAUTHORIZED: response=" + response.code()
          + " url=" + response.request().url().toString())
    }
    return response
  }

  private fun retryOAuthAuthentication() {
    // in a perfect world this should refresh the auth token but I just don't have time in this example
  }

}
