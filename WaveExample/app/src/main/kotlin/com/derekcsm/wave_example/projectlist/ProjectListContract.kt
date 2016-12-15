package com.derekcsm.wave_example.projectlist

interface ProjectListContract {

  interface View {

  }

  interface UserActionsListener {
    fun fetchProductsFromApi()
  }

}