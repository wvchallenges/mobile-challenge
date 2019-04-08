package com.karlptrck.wavechallenge.data

import android.content.Context
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.paging.PagedList
import com.karlptrck.wavechallenge.api.WaveService
import com.karlptrck.wavechallenge.api.getProducts
import com.karlptrck.wavechallenge.db.LocalCache
import com.karlptrck.wavechallenge.model.Product
import com.karlptrck.wavechallenge.util.NetworkUtil
import org.jetbrains.anko.AnkoLogger
import org.jetbrains.anko.toast

class ProductBoundaryCallback(private val service: WaveService,
                              private val cache: LocalCache,
                              private val context : Context) : PagedList.BoundaryCallback<Product> (), AnkoLogger {

    companion object {
        private const val NETWORK_PAGE_SIZE = 50
    }

    private var lastRequestedPage = 1
    private var isRequestInProgress = false
    private val _networkErrors = MutableLiveData<String>()
    val networkErrors : LiveData<String> get() = _networkErrors


    private fun requestAndSaveData(){
        if(isRequestInProgress) return

        if(!NetworkUtil.isConnectionAvailable(context)){
            context.toast("No internet connection.")
            return
        }

        isRequestInProgress = true
        getProducts(service, lastRequestedPage, NETWORK_PAGE_SIZE, { products ->
            cache.insert(products, {
                lastRequestedPage++
                isRequestInProgress = false
            })
        }, { error ->
            _networkErrors.postValue(error)
            isRequestInProgress = false

        })
    }

    override fun onZeroItemsLoaded() {
        requestAndSaveData()
    }

    override fun onItemAtEndLoaded(itemAtEnd: Product) {
        requestAndSaveData()
    }
}