package com.derekcsm.wave_example.projectlist

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.RecyclerView
import butterknife.bindView
import com.derekcsm.wave_example.R

class ProductListActivity : AppCompatActivity(), ProductListContract.View {

  private val TAG = "ProductListActivity"
  private lateinit var mActionsListener: ProductListContract.UserActionsListener

  val rvProductList: RecyclerView by bindView(R.id.rv_product_list)

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.act_project_list)

    mActionsListener = ProductListPresenter(this)

    mActionsListener.fetchProductsFromApi()
  }
}
