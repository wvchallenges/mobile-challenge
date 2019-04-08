package com.alihn.waveapp.main.viewmodel

import android.arch.lifecycle.LiveData
import android.arch.lifecycle.MutableLiveData
import android.arch.lifecycle.ViewModel
import com.alihn.waveapp.main.data.ProductListingRepository
import com.alihn.waveapp.main.data.model.Product
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.disposables.Disposable
import io.reactivex.schedulers.Schedulers
import timber.log.Timber
import javax.inject.Inject

/**
 * Created by 0xAliHn
 */

class ProductListingViewModel @Inject constructor(private val productListingRepository: ProductListingRepository) : ViewModel() {
    private val _productFetchingLiveData = MutableLiveData<List<Product>>()
    internal val productFetchingLiveData: LiveData<List<Product>>
        get() = _productFetchingLiveData

    private var fetchDisposable: Disposable? = null

    // Fetching for product list and updating mutable livedata
    internal fun fetchProductList() {
        Timber.d("Fetching for Product list. ")
        fetchDisposable = productListingRepository.getProductList(BUSINESS_ID)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe({ productList ->
                    Timber.i("Product list fetching success. ")
                    _productFetchingLiveData.value = productList
                }, { e ->
                    _productFetchingLiveData.value = null
                    Timber.e("Product list fetching failed. Error: %s", e.message)
                })
    }

    override fun onCleared() {
        Timber.e("ViewModel has been Cleared. ")
        fetchDisposable?.dispose()
        super.onCleared()
    }

    companion object {
        private const val BUSINESS_ID = "89746d57-c25f-4cec-9c63-34d7780b044b"
    }

}
