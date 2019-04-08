package com.alihn.waveapp.main.ui


import android.arch.lifecycle.Observer
import android.arch.lifecycle.ViewModelProviders
import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.alihn.waveapp.BaseApplication
import com.alihn.waveapp.R
import com.alihn.waveapp.main.data.model.Product
import com.alihn.waveapp.main.viewmodel.ProductListingViewModel
import com.alihn.waveapp.main.viewmodel.ViewModelProviderFactory
import com.alihn.waveapp.util.NetworkChecker
import kotlinx.android.synthetic.main.fragment_product.*
import timber.log.Timber
import javax.inject.Inject

/**
 * Created by 0xAliHn
 */

class ProductListingFragment : Fragment() {
    @Inject
    internal lateinit var factory: ViewModelProviderFactory

    private lateinit var productListingViewModel: ProductListingViewModel

    private var adapter: RecyclerView.Adapter<ProductListingAdapter.ProductViewHolder>? = null
    private var productList: MutableList<Product> = ArrayList(30)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Timber.d("View onCreate. ")
        (activity?.application as BaseApplication).createListingComponent()?.inject(this)
        productListingViewModel = ViewModelProviders.of(this, factory).get(ProductListingViewModel::class.java)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_product, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        Timber.d("View created. ")
        initRecyclerViewAdapterLayout()

        if (NetworkChecker.isNetworkAvailable(context) && savedInstanceState == null) {
            productListingViewModel.fetchProductList()
        }
        productListingViewModel.productFetchingLiveData.observe(this, Observer { it?.let { it1 -> updateAdapterWithFetchedData(it1) } })
    }


    private fun initRecyclerViewAdapterLayout() {
        product_listing_recyclerview.setHasFixedSize(true)
        val layoutManager = LinearLayoutManager(context)
        product_listing_recyclerview.layoutManager = layoutManager
        adapter = ProductListingAdapter(productList)
        product_listing_recyclerview.adapter = adapter
    }

    private fun updateAdapterWithFetchedData(productList: List<Product>) {
        Timber.i("Updating Adapter with fetched product list. Size: %s", productList.size)
        this.productList.clear()
        this.productList.addAll(productList)
        adapter?.notifyDataSetChanged()
    }


    override fun onDestroy() {
        Timber.e("View onDestroy. ")
        (activity?.application as BaseApplication).releaseListingComponent()
        super.onDestroy()
    }


}
