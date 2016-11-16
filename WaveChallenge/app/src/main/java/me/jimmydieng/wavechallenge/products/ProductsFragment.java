package me.jimmydieng.wavechallenge.products;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.DividerItemDecoration;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import java.util.List;

import me.jimmydieng.wavechallenge.R;
import me.jimmydieng.wavechallenge.data.Business;
import me.jimmydieng.wavechallenge.data.Product;

import static android.view.View.GONE;

public class ProductsFragment extends Fragment implements ProductContract.View {
  private static String TAG = ProductsFragment.class.getCanonicalName();

  private ProductContract.Presenter presenter;
  private ProductsRecyclerAdapter productsAdapter;
  private RecyclerView productsView;

  public ProductsFragment() {
  }

  @Override
  public View onCreateView(LayoutInflater inflater, ViewGroup container,
                           Bundle savedInstanceState) {

    View view = inflater.inflate(R.layout.fragment_main, container, false);
    productsView = (RecyclerView) view.findViewById(R.id.rV_products_list);
    productsView.setLayoutManager(new LinearLayoutManager(getContext()));
    productsView.addItemDecoration(new DividerItemDecoration(getContext().getApplicationContext(), DividerItemDecoration.VERTICAL));
    productsAdapter = new ProductsRecyclerAdapter();
    productsView.setAdapter(productsAdapter);

    setPresenter(new ProductPresenter(this, new ProductModel(getContext().getApplicationContext())));

    return view;
  }

  @Override
  public void onDestroyView() {
    super.onDestroyView();
    presenter.unbind();
    presenter = null;
  }

  @Override
  public void setPresenter(ProductContract.Presenter presenter) {
    this.presenter = presenter;
    this.presenter.setBusiness(new Business("89746d57-c25f-4cec-9c63-34d7780b044b"));
    this.presenter.start();
  }

  @Override
  public void showProducts(List<Product> products) {
    Log.v(TAG, "showProducts");
    productsAdapter.setData(products);
  }

  @Override
  public void showEmpty() {
    Log.v(TAG, "showEmpty");
    productsView.setVisibility(GONE);
  }
}
