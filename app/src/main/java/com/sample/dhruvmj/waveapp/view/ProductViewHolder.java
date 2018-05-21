package com.sample.dhruvmj.waveapp.view;

import android.databinding.DataBindingUtil;
import android.support.v7.widget.RecyclerView;
import android.view.View;

import com.sample.dhruvmj.waveapp.databinding.ProductListItemViewBinding;

/**
 * @author Dhruv
 */

class ProductViewHolder extends RecyclerView.ViewHolder {
    ProductListItemViewBinding productListItemViewBinding;

    ProductViewHolder(View itemView) {
        super(itemView);
        productListItemViewBinding = DataBindingUtil.bind(itemView);
    }
}
