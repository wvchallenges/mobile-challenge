package com.derekcsm.wave_example.projectlist

import android.content.Context
import android.os.Bundle
import android.support.v4.widget.SwipeRefreshLayout
import android.support.v7.app.AppCompatActivity
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.widget.Toast
import butterknife.bindView
import com.derekcsm.wave_example.R
import com.derekcsm.wave_example._model.Product
import com.derekcsm.wave_example.projectlist.adapter.ProductsAdapter
import com.derekcsm.wave_example.projectlist.adapter.ProductsAdapterItem
import com.squareup.moshi.Moshi
import java.util.*


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

  override fun onCreate(savedState: Bundle?) {
    super.onCreate(savedState)
    setContentView(R.layout.act_project_list)

    mActionsListener = ProductListPresenter(this)

    setupProductAdapter()
    swipeRefreshLayout.setOnRefreshListener(this)
    swipeRefreshLayout.setColorSchemeResources(R.color.colorAccent, R.color.colorPrimary)

    if (savedState == null) {
      showLoading()
      mActionsListener.fetchProductsFromApi()
    } else if (savedState.containsKey(mActionsListener.KEY_SAVED_PRODUCTS())) {
      // restore state
      mActionsListener.restoreInstanceState(savedState)

    } else {
      showLoading()
      mActionsListener.fetchProductsFromApi()
    }
  }

  override fun onSaveInstanceState(outState: Bundle?) {
    val stringProducts = ArrayList<String>()

    val moshi: Moshi = Moshi.Builder().build()
    val jsonAdapter = moshi.adapter(Product::class.java)

    var i = 0
    while (i < mProductsAdapter.getItems().size) {
      stringProducts.add(jsonAdapter.toJson(mProductsAdapter.getItems().get(i).`object` as Product))
      i++
    }

    outState!!.putStringArrayList(mActionsListener.KEY_SAVED_PRODUCTS(), stringProducts)
    super.onSaveInstanceState(outState)
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
