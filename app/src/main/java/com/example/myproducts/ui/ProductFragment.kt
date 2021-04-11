package com.example.myproducts.ui

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.myproducts.MyProductsApp
import com.example.myproducts.R
import com.example.myproducts.network.Repository


private const val TAG = "ListFragment"

class ProductFragment : Fragment(), ProductAdapter.OnMovieClickListener {

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        val productAdapter = ProductAdapter(this)
        val view = inflater.inflate(R.layout.product_list, container, false)
        val recyclerView = view.findViewById<RecyclerView>(R.id.rvProducts)

        recyclerView.apply {
            layoutManager = LinearLayoutManager(context)
            setHasFixedSize(true)
            adapter = productAdapter
        }

        val app = requireActivity().application as MyProductsApp
        val repo = app.repository
        val viewModelProvider = ViewModelProvider(this,ProductsViewModelFactory(repo))
        val viewModel = viewModelProvider.get(ProductsViewModel::class.java)

        viewModel.products.observe(viewLifecycleOwner) {
            productAdapter.submitList(it)
        }
        viewModel.getProducts()
        return view
    }

    override fun onMovieClick(position: Int) {
        Log.d(TAG, "onMovieClick: $position")
    }
}