package com.waveapps.ehanjin.codechallenge.view;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.waveapps.ehanjin.codechallenge.R;
import com.waveapps.ehanjin.codechallenge.model.Product;
import com.waveapps.ehanjin.codechallenge.utils.Utils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by SJ on 12/7/16.
 */

public class ProductAdapter extends RecyclerView.Adapter<ProductAdapter.ViewHolder> {

    private List<Product> list;
    protected Context context;

    public class ViewHolder extends RecyclerView.ViewHolder {
        public View container;
        public TextView title;
        public TextView description;
        public TextView price;

        public ViewHolder(View view) {
            super(view);
            container = view;
            title = (TextView) view.findViewById(R.id.title);
            description = (TextView) view.findViewById(R.id.description);
            price = (TextView) view.findViewById(R.id.price);
        }
    }

    public ProductAdapter(Context context) {
        this.list = new ArrayList<>();
        this.context = context;
    }

    public ProductAdapter(List<Product> list, Context context) {
        this.list = list;
        this.context = context;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.product_list_item, parent, false);

        return new ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, final int position) {
        final Product product = list.get(position);
        holder.title.setText(product.getName());
        holder.description.setText(product.getDescription());
        holder.price.setText(Utils.convertToDollarFormat(product.getPrice()));

        holder.container.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Utils.showProductInfoDialog(context, product);
            }
        });
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    public void setList(List list) {
        this.list = list;
        notifyDataSetChanged();
    }

    public void reset() {
        this.list.clear();
        notifyDataSetChanged();
    }
}
