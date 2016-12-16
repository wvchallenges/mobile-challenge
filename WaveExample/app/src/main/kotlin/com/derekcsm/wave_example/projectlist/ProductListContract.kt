package com.derekcsm.wave_example.projectlist

import android.content.Context
import android.os.Bundle
import com.derekcsm.wave_example.projectlist.adapter.ProductsAdapter

interface ProductListContract {

  interface View {
    fun getProductsAdapter(): ProductsAdapter

    fun showLoading()

    fun hideLoading()

    fun getContext(): Context
  }

  interface UserActionsListener {
    fun KEY_SAVED_PRODUCTS() : String

    fun fetchProductsFromApi()

    fun restoreInstanceState(savedState: Bundle)
  }

}