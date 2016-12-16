package com.derekcsm.wave_example.projectlist

import android.os.Bundle
import android.util.Log
import android.widget.Toast
import com.derekcsm.wave_example._api.ApiBuilder
import com.derekcsm.wave_example._api.WaveApi
import com.derekcsm.wave_example._base.Constants
import com.derekcsm.wave_example._model.Product
import com.derekcsm.wave_example.projectlist.adapter.ProductsAdapterItem
import com.squareup.moshi.Moshi
import rx.Subscriber
import rx.android.schedulers.AndroidSchedulers
import rx.schedulers.Schedulers
import java.util.*

class ProductListPresenter constructor(mView: ProductListContract.View) :
    ProductListContract.UserActionsListener {

  private val TAG = "ProductListPresenter"
  private val KEY_SAVED_PRODUCTS = "saved_products"
  override fun KEY_SAVED_PRODUCTS(): String {
    return KEY_SAVED_PRODUCTS
  }
  private val mView: ProductListContract.View
  private val waveApi: WaveApi

  init {
    this.mView = mView
    waveApi = ApiBuilder().create()
  }

  override fun restoreInstanceState(savedState: Bundle) {
    var productsAdapterItems = ArrayList<ProductsAdapterItem<*>>()
    val stringProducts = savedState.getStringArrayList(KEY_SAVED_PRODUCTS)

    val moshi: Moshi = Moshi.Builder().build()
    val jsonAdapter = moshi.adapter(Product::class.java)

    var i = 0
    while (i < stringProducts.size) {

      val nProduct = jsonAdapter.fromJson(stringProducts.get(i))

      val productAdapterItem = ProductsAdapterItem(nProduct,
          ProductsAdapterItem.PRODUCT.toInt())
      productsAdapterItems.add(productAdapterItem)
      i++
    }

    mView.getProductsAdapter().addItems(productsAdapterItems)
    mView.getProductsAdapter().notifyDataSetChanged()
  }

  override fun fetchProductsFromApi() {
    waveApi.getProducts(Constants.BUSINESS_ID)
        .subscribeOn(Schedulers.io())
        .observeOn(AndroidSchedulers.mainThread())
        .subscribe(object : Subscriber<List<Product>>() {
          override fun onCompleted() {
            Log.d(TAG, "onCompleted ")
            mView.hideLoading()
          }

          override fun onError(e: Throwable) {
            Log.d(TAG, "onError " + e.message)
            Toast.makeText(mView.getContext(), "Error loading: " + e.message, Toast.LENGTH_LONG).show()
            mView.hideLoading()
          }

          override fun onNext(products: List<Product>?) {
            Log.d(TAG, "onNext " + products)
            if (products != null) {
              populateAdapter(products)
            }
          }
        })
  }

  private fun populateAdapter(products: List<Product>) {

    val productsAdapterItems = ArrayList<ProductsAdapterItem<*>>()

    var i = 0
    while (i < products.size) {
      val productAdapterItem = ProductsAdapterItem(products.get(i),
          ProductsAdapterItem.PRODUCT.toInt())
      productsAdapterItems.add(productAdapterItem)
      i++
    }

    mView.getProductsAdapter().addItems(productsAdapterItems)
    mView.getProductsAdapter().notifyDataSetChanged()
  }

}