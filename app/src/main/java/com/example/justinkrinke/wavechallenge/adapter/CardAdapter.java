package com.example.justinkrinke.wavechallenge.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.example.justinkrinke.wavechallenge.models.Products;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Currency;
import java.util.List;
import com.example.justinkrinke.wavechallenge.R;


/**
 *  Card adapter for Recycler
 */
public class CardAdapter extends RecyclerView.Adapter<CardAdapter.ViewHolder> {
    private final List<Products> mItems;

    public CardAdapter() {
        super();
        mItems = new ArrayList<>();
    }

    public void addData(Products products) {
        mItems.add(products);
        notifyDataSetChanged();
    }

    public void clear() {
        mItems.clear();
        notifyDataSetChanged();
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        View v = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.recycler_view, viewGroup, false);
        return new ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(ViewHolder viewHolder, int i) {
        Currency usd;
        Products product = mItems.get(i);
        String textName = "Name: "+product.getName();
        //should match USD by default or if present in Json model use that one
        if(product.getIncomeAccount().getCurrency() == null || product.getIncomeAccount().getCurrency().getCode().isEmpty()){
            usd = java.util.Currency.getInstance("USD");
        }else{
            usd = java.util.Currency.getInstance(product.getIncomeAccount().getCurrency().getCode());
        }
        NumberFormat format = java.text.NumberFormat.getCurrencyInstance(java.util.Locale.US);
        format.setCurrency(usd);
        String textPrice = "Price: " + format.format(product.getPrice());
        viewHolder.name.setText(textName);
        viewHolder.price.setText(textPrice);
    }

    @Override
    public int getItemCount() {
        return mItems.size();
    }

    /**
    * Holder for each individual view
    * */
    class ViewHolder extends RecyclerView.ViewHolder {
        public final TextView name;
        public final TextView price;

        public ViewHolder(View itemView) {
            super(itemView);
            name = (TextView) itemView.findViewById(R.id.name);
            price = (TextView) itemView.findViewById(R.id.price);
        }
    }
}
