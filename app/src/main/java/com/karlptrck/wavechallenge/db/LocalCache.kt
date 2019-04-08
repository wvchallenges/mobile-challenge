package com.karlptrck.wavechallenge.db

import androidx.paging.DataSource
import com.karlptrck.wavechallenge.model.Product
import org.jetbrains.anko.AnkoLogger
import org.jetbrains.anko.debug
import java.util.concurrent.Executor


class LocalCache(
        private val productDao : ProductDao,
        private val ioExecutor : Executor) : AnkoLogger {

    fun insert(products : List<Product>, insertFinished : () -> Unit) {
        ioExecutor.execute {
            debug("inserting ${products.size} products" )
            productDao.insert(products)
            insertFinished()
        }
    }

    fun getProducts() : DataSource.Factory<Int, Product>{
        return productDao.getProducts()
    }

}