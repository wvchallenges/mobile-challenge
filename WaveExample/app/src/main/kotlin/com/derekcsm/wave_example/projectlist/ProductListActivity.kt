package com.derekcsm.wave_example.projectlist

import android.content.Context
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v4.widget.SwipeRefreshLayout
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.widget.Toast
import butterknife.bindView
import com.derekcsm.wave_example.R
import com.derekcsm.wave_example._model.Product
import com.derekcsm.wave_example.projectlist.adapter.ProductsAdapter
import com.derekcsm.wave_example.projectlist.adapter.ProductsAdapterItem

class ProductListActivity : AppCompatActivity(), ProductListContract.View,
    ProductsAdapter.ClickListener, SwipeRefreshLayout.OnRefreshListener {

  private val TAG = "ProductListActivity"
  private lateinit var mActionsListener: ProductListContract.UserActionsListener

  val rvProductList: RecyclerView by bindView(R.id.rv_product_list)
  val swipeRefreshLayout: SwipeRefreshLayout by bindView(R.id.swiperefresh_product)

  private lateinit var mProductsAdapter: ProductsAdapter
  override fun getProductsAdapter(): ProductsAdapter {
    return mProductsAdapter
  }

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.act_project_list)

    mActionsListener = ProductListPresenter(this)

    setupProductAdapter()
    swipeRefreshLayout.setOnRefreshListener(this)
    swipeRefreshLayout.setColorSchemeResources(R.color.colorAccent, R.color.colorPrimary)

    if(savedInstanceState == null) {
      showLoading()
      mActionsListener.fetchProductsFromApi()
    }
  }

  private fun setupProductAdapter() {
    mProductsAdapter = ProductsAdapter(this)
    rvProductList.layoutManager = LinearLayoutManager(this)
    rvProductList.adapter = mProductsAdapter
  }

  override fun onRefresh() {
    showLoading()
    mActionsListener.fetchProductsFromApi()
  }

  override fun showLoading() {
    swipeRefreshLayout.isRefreshing = true
  }

  override fun hideLoading() {
    swipeRefreshLayout.isRefreshing = false
  }

  override fun onProductClicked(item: ProductsAdapterItem<Product>) {
    val product = item.`object` as Product
    Toast.makeText(this, product.name, Toast.LENGTH_SHORT).show()
  }

  override fun getContext(): Context {
    return this
  }
}
