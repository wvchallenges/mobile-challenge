package com.karlptrck.wavechallenge.ui

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.karlptrck.wavechallenge.R
import com.karlptrck.wavechallenge.model.Product

class ProductViewHolder(view : View) : RecyclerView.ViewHolder(view){
    private val name : TextView = view.findViewById(R.id.tvName)
    private val price : TextView = view.findViewById(R.id.tvPrice)

    companion object {
        fun create(parent : ViewGroup) : ProductViewHolder {
            return ProductViewHolder(LayoutInflater.from(parent.context)
                .inflate(R.layout.item_product, parent, false))
        }
    }

    fun bind(product : Product?){
        if(product != null){
            name.text = product.name
            price.text = "$" + product.price.toString()
        }
    }

}