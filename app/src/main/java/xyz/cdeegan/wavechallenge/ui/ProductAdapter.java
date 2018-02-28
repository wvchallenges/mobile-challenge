package xyz.cdeegan.wavechallenge.ui;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import java.util.List;

import xyz.cdeegan.wavechallenge.R;
import xyz.cdeegan.wavechallenge.data.entity.Product;

public class ProductAdapter extends RecyclerView.Adapter<ProductListViewholder>
{
	private List<Product> products;

	ProductAdapter(List<Product> products)
	{
		this.products = products;
	}

	@NonNull
	@Override
	public ProductListViewholder onCreateViewHolder(@NonNull ViewGroup parent, int viewType)
	{
		View v = LayoutInflater.from(parent.getContext())
				.inflate(R.layout.list_item_product, parent, false);
		return new ProductListViewholder(v);
	}

	@Override
	public void onBindViewHolder(@NonNull ProductListViewholder holder, int position)
	{
		Product product = products.get(position);
		holder.productNameTextView.setText(product.getName());
		holder.productPriceTextView.setText(String.format("$%.2f", product.getPrice()));
	}

	@Override
	public int getItemCount()
	{
		return products.size();
	}

	public void setItems(List<Product> products)
	{
		this.products = products;
		notifyDataSetChanged();
	}
}
