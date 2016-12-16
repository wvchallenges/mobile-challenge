package com.derekcsm.wave_example.projectlist.adapter

import android.support.annotation.IntDef

class ProductsAdapterItem<T>(var `object`: T?, @ProductsAdapterItem.ViewType var viewType: Int) {

  companion object {
    const val PRODUCT = 0.toLong()
  }

  @IntDef(PRODUCT)
  annotation class ViewType
}

