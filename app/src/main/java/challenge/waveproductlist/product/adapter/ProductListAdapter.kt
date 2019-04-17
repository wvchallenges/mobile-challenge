package challenge.waveproductlist.product.adapter

import android.arch.paging.PagedListAdapter
import android.support.v7.util.DiffUtil
import android.support.v7.widget.RecyclerView
import android.view.ViewGroup
import challenge.waveproductlist.product.viewModels.ProductViewModel

class ProductListAdapter() : PagedListAdapter<ProductViewModel, RecyclerView.ViewHolder>(ProductViewModelDiffCallback) {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        return ProductViewHolder.newInstance(parent)
    }

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
        val viewModel = getItem(position) as ProductViewModel
        viewModel.position.set(position)

        var productViewHolder: ProductViewHolder = holder as ProductViewHolder
        productViewHolder.bind(viewModel)
    }

    companion object {
        val ProductViewModelDiffCallback = object : DiffUtil.ItemCallback<ProductViewModel>() {
            override fun areItemsTheSame(oldItem: ProductViewModel, newItem: ProductViewModel): Boolean {
                return oldItem.id == newItem.id
            }

            override fun areContentsTheSame(oldItem: ProductViewModel, newItem: ProductViewModel): Boolean {
                return oldItem == newItem
            }
        }
    }
}