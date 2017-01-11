package com.adeel.waveapp;

import android.content.Context;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.NumberFormat;
import java.util.Locale;

public class MainActivity extends AppCompatActivity {

//    private static final String LOG_TAG = MainActivity.class.getSimpleName();

    private static final String WAVE_ACCESS_TOKEN = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm";
    private static final String WAVE_AUTHORIZATION_TOKEN = "Bearer " + WAVE_ACCESS_TOKEN;
    private static final String WAVE_BUSINESS_ID = "89746d57-c25f-4cec-9c63-34d7780b044b";
    private static final String LIST_OBJECT_STATE = "selected";
    private static final String LIST_STRING_KEY = "list_string_key";
    private static final String LIST_SUM_KEY = "list_sum_key";

    private RecyclerView mRecyclerView;
    private ProductAdapter mAdapter;
    private Context mContext;
    private JSONArray mList;
    private double mSum = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mContext = this;
        mList = new JSONArray();
        mRecyclerView = (RecyclerView) findViewById(R.id.activity_main_recyclerview);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(mContext));

        String productsURL = Utility.WAVE_BASE_URL + String.format(Utility.WAVE_PRODUCT_ENDPOINT,
                WAVE_BUSINESS_ID);
        try {
            if (savedInstanceState != null && savedInstanceState.containsKey(LIST_STRING_KEY)) {
                mList = new JSONArray(savedInstanceState.getString(LIST_STRING_KEY));
                mAdapter = new ProductAdapter();
                mRecyclerView.setAdapter(mAdapter);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        if (mList.length() == 0) {
            Utility.GETRequest(productsURL, WAVE_AUTHORIZATION_TOKEN, new TaskCompletionInterface() {
                @Override
                public void onSuccess(String result) {
                    try {
                        mList = new JSONArray(result);
                        mAdapter = new ProductAdapter();
                        mRecyclerView.setAdapter(mAdapter);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }

                @Override
                public void onError(int result) {

                }
            });
        }
    }

    private void setTotal() {
        mRecyclerView.getAdapter().notifyItemChanged(mList.length());
    }

    @Override
    public void onSaveInstanceState(Bundle savedInstanceState) {
        savedInstanceState.putDouble(LIST_SUM_KEY, mSum);
        savedInstanceState.putString(LIST_STRING_KEY, mList.toString());
        super.onSaveInstanceState(savedInstanceState);
    }

    @Override
    public void onRestoreInstanceState(Bundle savedInstanceState) {
        super.onRestoreInstanceState(savedInstanceState);
        mSum = savedInstanceState.getDouble(LIST_SUM_KEY);
        try {
            mList = new JSONArray(savedInstanceState.getString(LIST_STRING_KEY));
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public class ProductAdapter extends RecyclerView.Adapter<ProductAdapter.ProductViewHolder> {

        @Override
        public ProductViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            View itemView = LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.list_item_product, parent, false);

            return new ProductViewHolder(itemView);
        }

        @Override
        public int getItemCount() {
            return mList.length() + 1;
        }

        @Override
        public void onBindViewHolder(final ProductViewHolder holder, int position) {

            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(Locale.US);

            if (position == mList.length()) {
                holder.nameTextView.setText(mContext.getResources().getString(R.string.list_view_total));
                String priceString = currencyFormat.format(mSum) + " ";
                holder.priceTextView.setText(priceString);
                holder.checkBox.setVisibility(View.GONE);
                return;
            }

            try {
                holder.checkBox.setVisibility(View.VISIBLE);
                JSONObject productObject = mList.getJSONObject(position);

                holder.nameTextView.setText(productObject.getString("name"));
                Double price = productObject.getDouble("price");
                String priceString = currencyFormat.format(price) + " ";
                holder.priceTextView.setText(priceString);

                if (productObject.has(LIST_OBJECT_STATE) && productObject.getBoolean(LIST_OBJECT_STATE))
                    holder.checkBox.setChecked(true);
                else
                    holder.checkBox.setChecked(false);

                holder.checkBox.setTag(position);
                holder.checkBox.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                    @Override
                    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                        toggleCheckedState(isChecked, (int) buttonView.getTag());
                    }
                });

            } catch (JSONException e) {
                e.printStackTrace();
            }
        }

        private void toggleCheckedState(boolean isChecked, int position) {
            try {
                JSONObject productObject = mList.getJSONObject(position);
                Double price = productObject.getDouble("price");
                if (isChecked) {
                    mSum += price;
                    productObject.put(LIST_OBJECT_STATE, true);
                } else {
                    mSum -= price;
                    productObject.put(LIST_OBJECT_STATE, false);
                }
                setTotal();

            } catch (JSONException e) {
                e.printStackTrace();
            }
        }

        public class ProductViewHolder extends RecyclerView.ViewHolder {
            public TextView nameTextView, priceTextView;
            public CheckBox checkBox;

            public ProductViewHolder(View view) {
                super(view);
                nameTextView = (TextView) view.findViewById(R.id.list_item_product_name);
                priceTextView = (TextView) view.findViewById(R.id.list_item_product_price);
                checkBox = (CheckBox) view.findViewById(R.id.list_item_checkbox);
            }
        }
    }
}