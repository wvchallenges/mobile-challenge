package com.derekcsm.wave_example.projectlist

import android.util.Log
import com.derekcsm.wave_example._api.ApiBuilder
import com.derekcsm.wave_example._api.WaveApi
import com.derekcsm.wave_example._base.Constants
import com.derekcsm.wave_example._model.Product
import rx.Subscriber
import rx.android.schedulers.AndroidSchedulers
import rx.schedulers.Schedulers

class ProjectListPresenter constructor(mView: ProjectListContract.View) :
    ProjectListContract.UserActionsListener {

  private val TAG = "ProjectListPresenter"
  private val mView: ProjectListContract.View

  private lateinit var waveApi: WaveApi

  init {
    this.mView = mView
    waveApi = ApiBuilder().create()
  }

  override fun fetchProductsFromApi() {
    waveApi.getProducts(Constants.BUSINESS_ID)
        .subscribeOn(Schedulers.io())
        .observeOn(AndroidSchedulers.mainThread())
        .subscribe(object : Subscriber<List<Product>>() {
          override fun onCompleted() {
            Log.d(TAG, "onCompleted ")
          }

          override fun onError(e: Throwable) {
            Log.d(TAG, "onError "+ e.message)
          }

          override fun onNext(products: List<Product>?) {
            Log.d(TAG, "onNext "+ products)
          }
        })
  }

}