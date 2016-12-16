package com.derekcsm.wave_example.projectlist

interface ProductListContract {

  interface View {

  }

  interface UserActionsListener {
    fun fetchProductsFromApi()
  }

}