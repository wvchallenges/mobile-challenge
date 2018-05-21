package com.sample.dhruvmj.waveapp.view;

import android.content.Context;
import android.databinding.DataBindingUtil;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.ViewGroup;

import com.sample.dhruvmj.waveapp.R;
import com.sample.dhruvmj.waveapp.databinding.ProductListItemViewBinding;
import com.sample.dhruvmj.waveapp.model.Product;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Dhruv
 */

public class ProductListAdapter extends RecyclerView.Adapter<ProductViewHolder> {
    private List<Product> productList;
    private Context context;

    ProductListAdapter(Context context) {
        this.context = context;
        productList = new ArrayList<>();
    }

    void setItems(List<Product> productList) {
        if (productList != null) {
            this.productList.clear();
            this.productList.addAll(productList);
            notifyDataSetChanged();
        }
    }

    @NonNull
    @Override
    public ProductViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        ProductListItemViewBinding binding = DataBindingUtil.inflate(LayoutInflater.from(context), R.layout.product_list_item_view, parent, false);
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
}
