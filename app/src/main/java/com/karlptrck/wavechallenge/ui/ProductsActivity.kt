package com.karlptrck.wavechallenge.ui

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import androidx.paging.PagedList
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.karlptrck.wavechallenge.InjectionProvider
import com.karlptrck.wavechallenge.R
import com.karlptrck.wavechallenge.model.Product
import kotlinx.android.synthetic.main.activity_main.*
import org.jetbrains.anko.AnkoLogger
import org.jetbrains.anko.debug


class ProductsActivity : AppCompatActivity(), AnkoLogger {

    private lateinit var viewModel: ProductsViewModel
    private val adapter = ProductsAdapter()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        viewModel = ViewModelProviders.of(this,
                    InjectionProvider.provideViewModelFactory(this))
                    .get(ProductsViewModel::class.java)

        initRecyclerView()
        viewModel.getProducts()
    }

    private fun initRecyclerView(){
        recyclerView.layoutManager = LinearLayoutManager(this)
        recyclerView.addItemDecoration(DividerItemDecoration(this, DividerItemDecoration.VERTICAL))
        recyclerView.adapter = adapter

        viewModel.products.observe(this, Observer <PagedList<Product>> {
            adapter.submitList(it)
            showHideEmptyData(it.size)
        })

    }

    private fun showHideEmptyData(itemCount : Int){
        if(itemCount > 0){
            tvNoData.visibility = View.GONE
            recyclerView.visibility = View.VISIBLE
        }else {
            tvNoData.visibility = View.VISIBLE
            recyclerView.visibility = View.GONE
        }
    }


}
