package com.example.myproducts.ui

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import com.example.myproducts.MyProductsApp
import com.example.myproducts.R
import com.google.android.material.snackbar.Snackbar

private const val TAG = "ListFragment"

class ProductFragment : Fragment(), ProductAdapter.OnProductClickListener {

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        val productAdapter = ProductAdapter(this)
        val view = inflater.inflate(R.layout.product_list, container, false)
        val recyclerView = view.findViewById<RecyclerView>(R.id.rvProducts)
        val swipeLayout = view.findViewById<SwipeRefreshLayout>(R.id.swipeLayout)

        recyclerView.apply {
            layoutManager = LinearLayoutManager(context)
            setHasFixedSize(true)
            adapter = productAdapter
        }

        val app = requireActivity().application as MyProductsApp
        val repo = app.repository
        val viewModelProvider = ViewModelProvider(this, ProductsViewModelFactory(repo))
        val viewModel = viewModelProvider.get(ProductsViewModel::class.java)

        //Initial Load
        viewModel.getProducts()

        viewModel.products.observe(viewLifecycleOwner) {
            productAdapter.submitList(it)
        }

        viewModel.loading.observe(viewLifecycleOwner) {
            swipeLayout.isRefreshing = it
        }

        viewModel.errorEvent.observe(viewLifecycleOwner, onEvent = {
            Snackbar.make(recyclerView, getString(R.string.connection_error), Snackbar.LENGTH_LONG)
                .setBackgroundTint(resources.getColor(R.color.backgroundTint))
                .setActionTextColor(resources.getColor(R.color.actionTextColor))
                .show()
        })

        swipeLayout.setOnRefreshListener {
            viewModel.getProducts()
        }

        return view
    }

    override fun onProductClick(position: Int) {
        Log.d(TAG, "onProductClick: $position")

    }
}