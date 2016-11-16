package me.jimmydieng.wavechallenge.products;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

import me.jimmydieng.wavechallenge.R;
import me.jimmydieng.wavechallenge.data.Product;


public class ProductsRecyclerAdapter extends RecyclerView.Adapter<ProductsRecyclerAdapter.ProductViewHolder> {
  private List<Product> products;

  public ProductsRecyclerAdapter() {
    products = new ArrayList<>();
  }

  public ProductsRecyclerAdapter(List<Product> products) {
    this.products = products;
  }

  public void setData(List<Product> newProducts) {
    products = newProducts;
    notifyDataSetChanged();
  }

  @Override
  public ProductViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
    View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.viewholder_product, parent, false);
    return new ProductViewHolder(v);
  }

  @Override
  public void onBindViewHolder(ProductViewHolder holder, int position) {
    Product product = products.get(position);
    holder.productText.setText(product.getName() + " - $" + product.getPriceFormatted());
  }

  @Override
  public int getItemCount() {
    return products.size();
  }

  public class ProductViewHolder extends RecyclerView.ViewHolder {
    public TextView productText;

    public ProductViewHolder(View view) {
      super(view);
      productText = (TextView) view.findViewById(R.id.tv_product_viewholder);
    }
  }
}
