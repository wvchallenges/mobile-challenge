package android.sample.wavechallenge.adapter

import android.content.Context
import android.sample.wavechallenge.R
import android.sample.wavechallenge.model.Product
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.item_product_layout.view.*

class ProductListAdapter(
    private var context: Context?,
    private var itemList: List<Product>?
) : RecyclerView.Adapter<ProductListAdapter.ItemViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ItemViewHolder {
        val view = LayoutInflater.from(context).inflate(R.layout.item_product_layout, parent, false)
        return ItemViewHolder(view)
    }

    override fun getItemCount(): Int {
        return itemList?.size ?: 0
    }

    override fun onBindViewHolder(holder: ItemViewHolder, position: Int) {
        val product = itemList?.get(position)
        product?.let {
            holder.tvName.text = product.name
            holder.tvPrice.text = context?.getString(R.string.formatted_price, product.price.toString())
        }
    }

    fun updateItems(products: List<Product>) {
        itemList = listOf()
        itemList = products
        notifyDataSetChanged()
    }

    class ItemViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        var tvName: TextView = view.tv_name
        var tvPrice: TextView = view.tv_price
    }
}