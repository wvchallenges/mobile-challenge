package com.example.myproducts.ui

import android.icu.text.NumberFormat
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.example.myproducts.R
import com.example.myproducts.models.Product
import java.util.*

class ProductAdapter() : ListAdapter<Product, ProductViewHolder>(DiffUtilCallBack) {

    //Format the price as CAD currency
    private val nf: NumberFormat = NumberFormat.getCurrencyInstance(Locale.CANADA)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ProductViewHolder {
        val view =
            LayoutInflater.from(parent.context).inflate(R.layout.list_product_item, parent, false)
        return ProductViewHolder(view)
    }

    override fun onBindViewHolder(holder: ProductViewHolder, position: Int) {
        val item = currentList[position]

        holder.apply {
            name.text = item.name
            price.text = nf.format(currentList[position].price)
        }
    }

}

class ProductViewHolder(view: View) :
    RecyclerView.ViewHolder(view) {
    val name: TextView = view.findViewById<TextView>(R.id.tvName)
    val price: TextView = view.findViewById<TextView>(R.id.tvPrice)

}

object DiffUtilCallBack : DiffUtil.ItemCallback<Product>() {
    override fun areItemsTheSame(oldItem: Product, newItem: Product): Boolean {
        return oldItem.id == newItem.id
    }

    override fun areContentsTheSame(oldItem: Product, newItem: Product): Boolean {
        return oldItem == newItem
    }
}
