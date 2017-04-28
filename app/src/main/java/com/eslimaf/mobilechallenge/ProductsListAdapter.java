package com.eslimaf.mobilechallenge;


import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.eslimaf.mobilechallenge.model.Product;

import java.util.ArrayList;

class ProductsListAdapter extends ArrayAdapter<Product> {
    private ArrayList<Product> mProductsArrayList = new ArrayList<>();

    ProductsListAdapter(Context context, ArrayList<Product> products) {
        super(context, R.layout.item_product, products);
        mProductsArrayList = products;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        Product product = getItem(position);
        ViewHolder viewHolder;
        if (null == convertView) {
            viewHolder = new ViewHolder();
            LayoutInflater inflater = LayoutInflater.from(getContext());
            convertView = inflater.inflate(R.layout.item_product, parent, false);
            viewHolder.productImage = (ImageView) convertView.findViewById(R.id.product_item_image);
            viewHolder.productName = (TextView) convertView.findViewById(R.id.product_item_name);
            viewHolder.productPrice = (TextView) convertView.findViewById(R.id.product_item_price);
            convertView.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) convertView.getTag();
        }
        assert product != null;

        viewHolder.productName.setText(product.getName());
        viewHolder.productPrice.setText(product.getPriceInDollarFormat());

        return convertView;
    }


    private static class ViewHolder {
        ImageView productImage;
        TextView productName;
        TextView productPrice;
    }
}
