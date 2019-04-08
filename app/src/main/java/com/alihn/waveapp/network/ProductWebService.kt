package com.alihn.waveapp.network

import com.alihn.waveapp.main.data.model.Product
import io.reactivex.Observable
import retrofit2.http.GET
import retrofit2.http.Path

/**
 * Created by 0xAliHn
 */

interface ProductWebService {

    @GET("businesses/{business_id}/products/")
    fun getProductList(@Path("business_id") businessId: String): Observable<List<Product>>
}
