package com.derekcsm.wave_example.projectlist.adapter

import android.content.Context
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import butterknife.bindView
import com.derekcsm.wave_example.R
import com.derekcsm.wave_example._model.Product
import java.text.NumberFormat

class ProductViewHolder private constructor(itemView: View) : RecyclerView.ViewHolder(itemView) {

  val tvTitle: TextView by bindView(R.id.tv_product_title)
  val tvPrice: TextView by bindView(R.id.tv_price)

  init {
  }

  fun onBind(item: ProductsAdapterItem<Product>, listener: ProductsAdapter.ClickListener) {
    val product = item.`object` as Product

    tvTitle.text = product.name

    val formatter = NumberFormat.getNumberInstance()
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    val formattedPrice = formatter.format(product.price)
    tvPrice.text = itemView.context.getString(R.string.price, formattedPrice)

    itemView.setOnClickListener { listener.onProductClicked(item) }
  }

  companion object {
    fun create(context: Context, viewGroup: ViewGroup): ProductViewHolder {
      return ProductViewHolder(LayoutInflater.from(context).inflate(R.layout.item_product, viewGroup, false))
    }
  }
}
