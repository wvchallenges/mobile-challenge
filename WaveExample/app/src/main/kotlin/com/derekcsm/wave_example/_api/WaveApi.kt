package com.derekcsm.wave_example._api

import com.derekcsm.wave_example._model.Product
import retrofit2.http.GET
import retrofit2.http.Path
import rx.Observable

interface WaveApi {

  @GET("businesses/{business_id}/products")
  fun getProducts(@Path("business_id") businessId: String): Observable<List<Product>>
}