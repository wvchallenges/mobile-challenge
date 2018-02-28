package xyz.cdeegan.wavechallenge.ui;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.TextView;

import xyz.cdeegan.wavechallenge.R;

public class ProductListViewholder extends RecyclerView.ViewHolder
{
	TextView productNameTextView;
	TextView productPriceTextView;

	public ProductListViewholder(View itemView)
	{
		super(itemView);
		productNameTextView = itemView.findViewById(R.id.textview_product_name);
		productPriceTextView = itemView.findViewById(R.id.textview_product_price);
	}
}
