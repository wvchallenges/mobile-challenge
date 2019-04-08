package com.karlptrck.wavechallenge.data

import android.content.Context
import androidx.paging.LivePagedListBuilder
import com.karlptrck.wavechallenge.api.WaveService
import com.karlptrck.wavechallenge.db.LocalCache
import com.karlptrck.wavechallenge.model.Product
import com.karlptrck.wavechallenge.model.ProductsResult


class WaveRepository(private val service : WaveService,
                     private val cache : LocalCache,
                     private val context : Context){

    companion object {
        const val DB_PAGE_SIZE = 25
    }

    fun getProducts() : ProductsResult {

        val dataSourceFactory = cache.getProducts()
        val boundaryCallback = ProductBoundaryCallback(service, cache, context)
        val data = LivePagedListBuilder(dataSourceFactory, DB_PAGE_SIZE)
            .setBoundaryCallback(boundaryCallback)
            .build()
        return ProductsResult(data, boundaryCallback.networkErrors)
    }

}