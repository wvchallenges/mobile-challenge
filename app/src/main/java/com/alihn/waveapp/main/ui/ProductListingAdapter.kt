package com.alihn.waveapp.main.ui

import android.databinding.DataBindingUtil
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.ViewGroup
import com.alihn.waveapp.R
import com.alihn.waveapp.databinding.ProductItemBinding
import com.alihn.waveapp.main.data.model.Product

/**
 * Created by 0xAliHn
 */

class ProductListingAdapter internal constructor(private val productList: List<Product>) : RecyclerView.Adapter<ProductListingAdapter.ProductViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ProductViewHolder {
        val binding = DataBindingUtil.inflate<ProductItemBinding>(LayoutInflater.from(parent.context), R.layout.product_item, parent, false)
        return ProductViewHolder(binding)
    }

    override fun onBindViewHolder(holder: ProductViewHolder, position: Int) {
        if (position != RecyclerView.NO_POSITION) {
            val product = productList[position]
            holder.bind(product)
        }
    }

    override fun getItemCount(): Int {
        return productList.size
    }


    inner class ProductViewHolder internal constructor(private val productItemBinding: ProductItemBinding) : RecyclerView.ViewHolder(productItemBinding.root) {
        fun bind(product: Product) {
            productItemBinding.product = product
            productItemBinding.executePendingBindings()
        }
    }
}
