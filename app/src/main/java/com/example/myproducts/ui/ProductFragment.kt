package com.example.myproducts.ui

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.LinearLayout
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.myproducts.MyProductsApp
import com.example.myproducts.R
import com.example.myproducts.network.Repository
import com.google.android.material.snackbar.Snackbar


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
        val loader =view.findViewById<LinearLayout>(R.id.loader)

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

        viewModel.spinner.observe(viewLifecycleOwner) {
            Log.d(TAG, "spinner:: $it ")
            loader.visibility = if (it) View.VISIBLE else View.GONE
        }

        viewModel.errorEvent.observe(viewLifecycleOwner, onEvent = {
            //Toast.makeText(requireContext(), it, Toast.LENGTH_LONG).show()


            Snackbar.make(recyclerView, "There was a connection error.", Snackbar.LENGTH_LONG)
                .setBackgroundTint(resources.getColor(R.color.backgroundTint))
                .setActionTextColor(resources.getColor(R.color.actionTextColor))
                .show()
        })



        viewModel.getProducts()
        return view
    }

    override fun onMovieClick(position: Int) {
        Log.d(TAG, "onMovieClick: $position")
    }
}