package com.dhamu.waveproject.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.dhamu.waveproject.R;
import com.dhamu.waveproject.model.Product;
import java.util.ArrayList;

/**
 * Created by dhame on 3/2/2018.
 */
public class ProductAdapter extends BaseAdapter {

    private Context context;
    private ArrayList<Product> arrlstProduct;

    public ProductAdapter(Context context, ArrayList<Product> arrlstProduct) {
        this.context = context;
        this.arrlstProduct = arrlstProduct;
    }

    @Override
    public int getCount() {
        return arrlstProduct.size();
    }

    @Override
    public Object getItem(int position) {
        return arrlstProduct.get(position);
    }

    @Override
    public long getItemId(int position) {
        return arrlstProduct.indexOf(getItem(position));
    }

    private class ViewHolder {
        private TextView tvProductName, tvPrice;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder = null;
        LayoutInflater mInflater = (LayoutInflater) context.getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
        if (convertView == null) {
            convertView = mInflater.inflate(R.layout.list_item_product, null);
            holder = new ViewHolder();
            holder.tvProductName = (TextView) convertView.findViewById(R.id.tvProductName);
            holder.tvPrice = (TextView) convertView.findViewById(R.id.tvPrice);
            convertView.setTag(holder);
        } else {
            holder = (ViewHolder) convertView.getTag();
        }

        final Product productInfo = (Product) getItem(position);
        holder.tvProductName.setText(productInfo.getName());
        holder.tvPrice.setText("$" + productInfo.getPrice());

        return convertView;
    }
}