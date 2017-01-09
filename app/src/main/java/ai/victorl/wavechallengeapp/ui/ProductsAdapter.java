package ai.victorl.wavechallengeapp.ui;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import ai.victorl.wavechallengeapp.R;
import ai.victorl.wavechallengeapp.services.wave.BusinessProduct;
import butterknife.BindView;
import butterknife.ButterKnife;

public class ProductsAdapter extends RecyclerView.Adapter<ProductsAdapter.ProductViewHolder> {

    private final List<BusinessProduct> products = new ArrayList<>();

    public void setProducts(List<BusinessProduct> newProducts) {
        products.clear();
        products.addAll(newProducts);
        notifyDataSetChanged();
    }

    public void clearProducts() {
        products.clear();
        notifyDataSetChanged();
    }

    @Override
    public ProductViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        return new ProductViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.item_product, parent, false));
    }

    @Override
    public void onBindViewHolder(ProductViewHolder holder, int position) {
        final BusinessProduct product = products.get(position);
        holder.nameTextView.setText(product.name);
        holder.priceTextView.setText(String.format(Locale.getDefault(), "$%.2f", product.price));
    }

    @Override
    public int getItemCount() {
        return products.size();
    }

    static class ProductViewHolder extends RecyclerView.ViewHolder {
        @BindView(R.id.product_name) TextView nameTextView;
        @BindView(R.id.product_price) TextView priceTextView;

        ProductViewHolder(View itemView) {
            super(itemView);
            ButterKnife.bind(this, itemView);
        }
    }
}
