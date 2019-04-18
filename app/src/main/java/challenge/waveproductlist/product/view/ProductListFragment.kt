package challenge.waveproductlist.product.view

import android.arch.lifecycle.Observer
import android.arch.lifecycle.ViewModelProviders
import android.arch.paging.PagedList
import android.os.Bundle
import android.support.constraint.ConstraintLayout
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import challenge.waveproductlist.R
import challenge.waveproductlist.data.ProductDataManager
import challenge.waveproductlist.product.adapter.ProductListAdapter
import challenge.waveproductlist.product.viewModels.ProductListViewModel
import challenge.waveproductlist.product.viewModels.ProductListViewModelFactory
import challenge.waveproductlist.product.viewModels.ProductViewModel
import kotlinx.android.synthetic.main.product_list_fragment_layout.*

class ProductListFragment : android.support.v4.app.Fragment() {

    private val productDataManager: ProductDataManager = ProductDataManager()
    private lateinit var adapterProductList: ProductListAdapter
    private lateinit var viewModel: ProductListViewModel
    private var layout: View? = null

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        if (layout == null) {
            layout = inflater.inflate(R.layout.product_list_fragment_layout, container, false) as ConstraintLayout
        }
        return layout
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        viewModel = ViewModelProviders.of(this, ProductListViewModelFactory(productDataManager)).get(ProductListViewModel::class.java)
        initAdapter()
    }

    private fun initAdapter() {
        adapterProductList = ProductListAdapter()

        product_list_recycler_view.adapter = adapterProductList
        product_list_recycler_view.layoutManager = LinearLayoutManager(context)

        viewModel.productList.observe(this, Observer<PagedList<ProductViewModel>> { adapterProductList.submitList(it) })
    }

    private fun initRecyclerView() {
        val layoutManager: RecyclerView.LayoutManager = LinearLayoutManager(context)
        product_list_recycler_view.layoutManager = layoutManager
    }

    companion object {
        fun newInstance(): android.support.v4.app.Fragment {
            return ProductListFragment()
        }
    }
}