package com.karlptrck.wavechallenge.ui

import android.view.ViewGroup
import androidx.paging.PagedListAdapter
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.RecyclerView
import com.karlptrck.wavechallenge.model.Product

class ProductsAdapter : PagedListAdapter<Product, RecyclerView.ViewHolder>(PRODUCT_COMPARATOR){

    companion object {
        private val PRODUCT_COMPARATOR = object : DiffUtil.ItemCallback<Product>(){
            override fun areContentsTheSame(oldItem: Product, newItem: Product): Boolean = oldItem == newItem

            override fun areItemsTheSame(oldItem: Product, newItem: Product): Boolean = oldItem.name == newItem.name
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        return ProductViewHolder.create(parent)
    }

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
        val item = getItem(position)
        if(item != null){
            (holder as ProductViewHolder).bind(item)
        }
    }
}