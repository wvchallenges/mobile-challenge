package com.stevehan.wavemobilesteve;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by schan on 16-03-10.
 */
public class ProductAdapter extends BaseAdapter {
    private LayoutInflater mInflater;
    private List<Product> mProducts;

    public ProductAdapter(Context context, List<Product> products) {
        this.mInflater = LayoutInflater.from(context);
        if (products == null) {
            products = new ArrayList<Product>();
        }
        this.mProducts = products;
    }

    @Override
    public int getCount() {
        return mProducts.size();
    }

    @Override
    public Object getItem(int position) {
        return mProducts.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View view, ViewGroup parent) {
        Product product = mProducts.get(position);
        if (view == null) {
            view = mInflater.inflate(R.layout.product_item_layout, null);
        }

        TextView nameTv = (TextView) view.findViewById(R.id.itemName);
        TextView priceTv = (TextView) view.findViewById(R.id.itemPrice);

        String name = product.getName();
        if (name != null) {
            nameTv.setText(name);
        }

        String price = product.getFormattedPrice();
        if (price != null) {
            priceTv.setText(price);
        }

        return view;
    }

    public void setProductList(List<Product> list) {
        mProducts.clear();
        if (list != null) {
            mProducts.addAll(list);
        }
        notifyDataSetChanged();
    }
}
