package com.alihn.waveapp.main.data

import com.alihn.waveapp.main.data.model.Product
import io.reactivex.Observable

/**
 * Created by 0xAliHn
 */

interface ProductListingRepository {
    /**
     * Get Product list by business_id
     */
    fun getProductList(business_id: String): Observable<List<Product>>
}
