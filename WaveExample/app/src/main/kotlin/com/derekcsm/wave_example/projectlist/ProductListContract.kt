package com.derekcsm.wave_example.projectlist

import android.content.Context
import com.derekcsm.wave_example.projectlist.adapter.ProductsAdapter

interface ProductListContract {

  interface View {
    fun getProductsAdapter(): ProductsAdapter

    fun showLoading()

    fun hideLoading()

    fun getContext(): Context
  }

  interface UserActionsListener {
    fun fetchProductsFromApi()
  }

}