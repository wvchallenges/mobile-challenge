package com.derekcsm.wave_example.projectlist

import com.derekcsm.wave_example.projectlist.adapter.ProductsAdapter

interface ProductListContract {

  interface View {
    fun getProductsAdapter(): ProductsAdapter
  }

  interface UserActionsListener {
    fun fetchProductsFromApi()
  }

}