package com.example.myproducts.ui

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.example.myproducts.R
import com.example.myproducts.models.Product

class ProductAdapter(private val fragClickListener: OnMovieClickListener) :
    ListAdapter<Product, ProductAdapter.ProductViewHolder>(DiffUtilCallBack) {

    class ProductViewHolder(view: View, onMovieClickListener: OnMovieClickListener) :
        RecyclerView.ViewHolder(view), View.OnClickListener {

        private val onClickListener = onMovieClickListener

        init {
            view.setOnClickListener(this)
        }

        val name: TextView = view.findViewById<TextView>(R.id.tvName)
        val price: TextView = view.findViewById<TextView>(R.id.tvPrice)

        override fun onClick(v: View?) {
            onClickListener.onMovieClick(adapterPosition)
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ProductViewHolder {
        val view =
            LayoutInflater.from(parent.context).inflate(R.layout.list_product_item, parent, false)
        return ProductViewHolder(view, fragClickListener)

    }

    override fun onBindViewHolder(holder: ProductViewHolder, position: Int) {
        holder.name.text = currentList.get(position).name
        holder.price.text = currentList.get(position).price.toString()
    }

    interface OnMovieClickListener {
        fun onMovieClick(position: Int)
    }
}

object DiffUtilCallBack : DiffUtil.ItemCallback<Product>() {
    override fun areItemsTheSame(oldItem: Product, newItem: Product): Boolean {
        return oldItem.id == newItem.id
    }

    override fun areContentsTheSame(oldItem: Product, newItem: Product): Boolean {
        return oldItem == newItem
    }
}
