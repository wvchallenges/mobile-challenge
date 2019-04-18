package challenge.waveproductlist.product.adapter

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.ViewGroup
import android.databinding.DataBindingUtil
import challenge.waveproductlist.R
import challenge.waveproductlist.product.viewModels.ProductViewModel
import challenge.waveproductlist.databinding.ProductCardViewLayoutBinding

class ProductViewHolder(private val binding: ProductCardViewLayoutBinding) : RecyclerView.ViewHolder(binding.root)  {

    fun bind(viewModel: ProductViewModel) {
        binding.viewModel = viewModel
        binding.executePendingBindings()
    }

    companion object {
        fun newInstance(parent: ViewGroup): ProductViewHolder {
            var binding : ProductCardViewLayoutBinding =
                DataBindingUtil.inflate(LayoutInflater.from(parent.getContext()), R.layout.product_card_view_layout, parent, false)
            return ProductViewHolder(binding);
        }
    }
}