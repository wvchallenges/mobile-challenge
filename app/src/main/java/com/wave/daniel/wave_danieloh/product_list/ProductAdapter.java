package com.wave.daniel.wave_danieloh.product_list;

import android.app.Activity;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.wave.daniel.wave_danieloh.R;
import com.wave.daniel.wave_danieloh.models.Product;

import java.text.DecimalFormat;
import java.util.ArrayList;

/**
 * Created by Daniel on 2016-11-12.
 * This is Adapter for Product list in ProductListActivity.java
 */
public class ProductAdapter extends RecyclerView.Adapter<ProductAdapter.ProductViewHolder> {

    private ArrayList<Product> productList;
    private Activity mActivity;

    /**
     * Constructor
     */
    public ProductAdapter(ArrayList<Product> productList, Activity activity) {
        this.productList = productList;
        this.mActivity = activity;

    }

    public void setProductList(ArrayList<Product> productList) {
        this.productList = productList;
    }

    /**
     * create ViewHolder
     */
    @Override
    public ProductViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.product_item_layout, parent, false);
        return new ProductViewHolder(itemView);

    }

    /**
     * bind data with ViewHolder
     */
    @Override
    public void onBindViewHolder(ProductViewHolder holder, int position) {
        Product product = productList.get(position);

        holder.item_tag.setBackgroundColor(ContextCompat.getColor(mActivity,R.color.item_tag_teal));

        holder.titleTextView.setText(product.getName());
//        holder.descTextView.setText(product.getDescription()); // displaying description is not requirement
        DecimalFormat df = new DecimalFormat("0.00");
        holder.priceTextView.setText("$ " + df.format(product.getPrice()));

    }

    @Override
    public int getItemCount() {
        if (productList == null) { return 0; }
        return productList.size();

    }

    /**
     * ViewHolder to contains list item views
     */
    public class ProductViewHolder extends RecyclerView.ViewHolder {

        public RelativeLayout item_tag;
        public TextView titleTextView;
        public TextView descTextView;
        public TextView priceTextView;

        public ProductViewHolder(View view) {
            super(view);
            item_tag = (RelativeLayout) view.findViewById(R.id.item_tag);
            titleTextView = (TextView) view.findViewById(R.id.titleTextView);
            descTextView = (TextView) view.findViewById(R.id.descTextView);
            priceTextView = (TextView) view.findViewById(R.id.priceTextView);

        }

    }


}
