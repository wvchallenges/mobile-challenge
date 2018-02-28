package xyz.cdeegan.wavechallenge.ui;

import android.arch.lifecycle.ViewModelProviders;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.DividerItemDecoration;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;

import java.util.ArrayList;

import xyz.cdeegan.wavechallenge.R;

public class ProductListActivity extends AppCompatActivity
{
	private RecyclerView productListView;
	private ProductAdapter productAdapter;
	private ProductListViewModel productListViewModel;
	private static final String BUSINESS_ID = "89746d57-c25f-4cec-9c63-34d7780b044b";

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_product_list);

		productListView = findViewById(R.id.product_list_view);

		//set recyclerview adapter
		productAdapter = new ProductAdapter(new ArrayList<>());
		productListView.setAdapter(productAdapter);

		//set layout manager
		LinearLayoutManager layoutManager = new LinearLayoutManager(getApplicationContext(), LinearLayoutManager.VERTICAL, false);
		productListView.setLayoutManager(layoutManager);

		//set divider decoration
		final DividerItemDecoration dividerItemDecoration = new DividerItemDecoration(productListView
				.getContext(), layoutManager.getOrientation());
		productListView.addItemDecoration(dividerItemDecoration);

		//attach viewmodel to recyclerview
		productListViewModel = ViewModelProviders.of(this).get(ProductListViewModel.class);
		productListViewModel.loadProducts(BUSINESS_ID)
				.observe(this, products -> productAdapter.setItems(products.getProducts()));
	}
}
