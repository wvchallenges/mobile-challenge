package com.alihn.waveapp.main.data

import com.alihn.waveapp.main.data.model.Product
import com.alihn.waveapp.network.ProductWebService

import io.reactivex.Observable
import javax.inject.Inject

/**
 * Created by 0xAliHn
 */

open class ProductListingRepositoryImpl @Inject constructor(private val productWebService: ProductWebService) : ProductListingRepository {

    override fun getProductList(business_id: String): Observable<List<Product>> {

        return productWebService.getProductList(business_id)

    }

}
