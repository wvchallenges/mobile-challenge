package com.kannan.sample.waveapp.view.adapter;


import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.databinding.DataBindingUtil;
import androidx.recyclerview.widget.RecyclerView;

import com.kannan.sample.waveapp.R;
import com.kannan.sample.waveapp.databinding.ProductListItemBinding;
import com.kannan.sample.waveapp.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductsListAdapter extends RecyclerView.Adapter<ProductsListAdapter.ProductViewHolder> {
    private List<Product> productList = new ArrayList<>();
    private Context context;

    public ProductsListAdapter(Context context) {
        this.context = context;
    }

    public void setItems(List<Product> productList) {
        if (productList != null) {
            this.productList.clear();
            this.productList.addAll(productList);
            notifyDataSetChanged();
        }
    }

    @NonNull
    @Override
    public ProductViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        ProductListItemBinding binding = DataBindingUtil.inflate(LayoutInflater.from(context), R.layout.product_list_item, parent, false);
        return new ProductViewHolder(binding.getRoot());
    }

    @Override
    public void onBindViewHolder(@NonNull ProductViewHolder holder, int position) {
        if (position != RecyclerView.NO_POSITION) {
            Product product = productList.get(position);
            holder.productListItemViewBinding.setProduct(product);
        }
    }

    @Override
    public int getItemCount() {
        return productList.size();
    }

    class ProductViewHolder extends RecyclerView.ViewHolder {
        ProductListItemBinding productListItemViewBinding;

        ProductViewHolder(View itemView) {
            super(itemView);
            productListItemViewBinding = DataBindingUtil.bind(itemView);
        }
    }
}

