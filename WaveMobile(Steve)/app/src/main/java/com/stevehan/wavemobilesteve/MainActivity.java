package com.stevehan.wavemobilesteve;

import android.app.LoaderManager;
import android.content.Loader;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity implements LoaderManager.LoaderCallbacks<List<Product>>{
    private ListView mListView;
    private TextView mEmptyView;
    private ProductAdapter mAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        init();
        refreshData();
    }

    private void init() {
        mListView = (ListView) findViewById(R.id.listView);
        mEmptyView = (TextView) findViewById(R.id.emptyView);
        mAdapter = new ProductAdapter(this, new ArrayList<Product>());
        mListView.setEmptyView(mEmptyView);
        mListView.setAdapter(mAdapter);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.action_refresh) {
            refreshData();
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    private void refreshData() {
        getLoaderManager().initLoader(0, null, this).forceLoad();
    }

    @Override
    public Loader<List<Product>> onCreateLoader(int id, Bundle args) {
        return new ProductAsyncLoader(MainActivity.this);
    }

    @Override
    public void onLoadFinished(Loader<List<Product>> loader, List<Product> data) {
        mAdapter.setProductList(data);
    }

    @Override
    public void onLoaderReset(Loader<List<Product>> loader) {
        mAdapter.setProductList(new ArrayList<Product>());
    }
}
