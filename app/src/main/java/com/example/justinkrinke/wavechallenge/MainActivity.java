package com.example.justinkrinke.wavechallenge;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import com.example.justinkrinke.wavechallenge.adapter.CardAdapter;
import com.example.justinkrinke.wavechallenge.models.Products;
import com.example.justinkrinke.wavechallenge.service.ProductInterface;
import com.example.justinkrinke.wavechallenge.service.ServiceFactory;
import com.example.justinkrinke.wavechallenge.util.Keys;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import rx.Subscriber;
import rx.android.schedulers.AndroidSchedulers;
import rx.schedulers.Schedulers;

public class MainActivity extends AppCompatActivity {

//    private ArrayList<Products> mProducts;
    private  CardAdapter mCardAdapter;
    private ProgressDialog dialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        /**
         *Setup loading diag
        */
        dialog = ProgressDialog.show(MainActivity.this, "", "Loading. Please wait...", true);

        /**
         * setup ui recycler view
         */
        RecyclerView mRecyclerView = (RecyclerView) findViewById(R.id.recycler_view);
        assert mRecyclerView != null;
        mRecyclerView.setHasFixedSize(true);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(this));
        mCardAdapter = new CardAdapter();
        mRecyclerView.setAdapter(mCardAdapter);

        /**
        * Get the list
        * */
        retrieveProducts();

    }

    private void retrieveProducts(){
        //call the factory passing the ProductInterface
        ProductInterface service = ServiceFactory.createRetrofitService(ProductInterface.class, ProductInterface.SERVICE_ENDPOINT);

        dialog.show();
        //call the method of the observable object
        //pass the constants Keys business id and bearer id
        service.getProducts(Keys.getbId())
                .subscribeOn(Schedulers.newThread())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(new Subscriber<List<Products>>() {
                    @Override
                    public final void onCompleted() {
                        // do nothing
                        dialog.hide();
                    }

                    @Override
                    public final void onError(Throwable e) {
                        Log.e("WaveChallenge: ", e.getMessage());
                        Log.e("Detail Error", e.toString());
                        dialog.hide();
                    }

                    @Override
                    public final void onNext(List<Products> response) {
                        //clear the list
                        mCardAdapter.clear();

                        Collections.sort(response, new Comparator<Products>() {
                            @Override
                            public int compare(Products lhs, Products rhs) {
                                //sort by number low -> high
                                //return lhs.getPrice().compareTo(rhs.getPrice());
                                //sort by apha
                                return lhs.getName().compareTo(rhs.getName());
                            }
                        });

                        //take the responses and them to the adapter for the recycler view
                        //perform sorts on response if needed.
                        for (int i = 0; i < response.size(); i++) {
                            mCardAdapter.addData(response.get(i));
                        }

                    }
                });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_get) {
            retrieveProducts();
            return true;
        }else if(id == R.id.action_reset){
            mCardAdapter.clear();
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
