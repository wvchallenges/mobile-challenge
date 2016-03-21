package com.jameschoi.wave.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.jameschoi.wave.MainActivity;
import com.jameschoi.wave.R;
import com.jameschoi.wave.utils.Utils;

import org.json.JSONArray;
import org.json.JSONObject;

public class ProductsAdapter extends BaseAdapter {

    // Members.
    private JSONArray mProductsArray;
    private MainActivity mActivity;

    // Constants.
    private final String KEY_NAME = "name";
    private final String KEY_PRICE = "price";

    public ProductsAdapter(JSONArray arr, MainActivity a) {
        mProductsArray = arr;
        mActivity = a;
    }

    @Override
    public int getCount() {
        return mProductsArray.length();
    }

    @Override
    public Object getItem(int position) {
        JSONObject obj = new JSONObject();
        try {
            obj = mProductsArray.getJSONObject(position);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return obj;
    }

    @Override
    public long getItemId(int position) {
        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        // Create new view container if it hasn't already done do.
        if (convertView == null) {
            LayoutInflater inflater = (LayoutInflater) mActivity.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            convertView = inflater.inflate(R.layout.container_product_item, parent, false);
        }

        JSONObject json = (JSONObject) getItem(position);

        // Set the correct info into the container.
        TextView nameTv = (TextView) convertView.findViewById(R.id.cpi_name_textview);
        nameTv.setText(Utils.getStringData(json, KEY_NAME));
        TextView priceTv = (TextView) convertView.findViewById(R.id.cpi_price_textview);
        StringBuffer sb = new StringBuffer("$");
        sb.append(Utils.getStringData(json, KEY_PRICE));
        priceTv.setText(sb.toString());

        return convertView;
    }
}
