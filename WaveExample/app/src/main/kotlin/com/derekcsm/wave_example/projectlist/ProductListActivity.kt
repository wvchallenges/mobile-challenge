package com.derekcsm.wave_example.projectlist

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import butterknife.bindView
import com.derekcsm.wave_example.R
import com.derekcsm.wave_example._model.Product
import com.derekcsm.wave_example.projectlist.adapter.ProductsAdapter
import com.derekcsm.wave_example.projectlist.adapter.ProductsAdapterItem

class ProductListActivity : AppCompatActivity(), ProductListContract.View,
    ProductsAdapter.ClickListener {

  private val TAG = "ProductListActivity"
  private lateinit var mActionsListener: ProductListContract.UserActionsListener

  val rvProductList: RecyclerView by bindView(R.id.rv_product_list)

  private lateinit var mProductsAdapter: ProductsAdapter
  override fun getProductsAdapter(): ProductsAdapter {
    return mProductsAdapter
  }

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.act_project_list)

    mActionsListener = ProductListPresenter(this)

    setupProductAdapter()
    mActionsListener.fetchProductsFromApi()
  }

  private fun setupProductAdapter() {
    mProductsAdapter = ProductsAdapter(this)
    rvProductList.layoutManager = LinearLayoutManager(this)
    rvProductList.adapter = mProductsAdapter
  }

  override fun onProductClicked(item: ProductsAdapterItem<Product>) {
    // todo
  }
}
