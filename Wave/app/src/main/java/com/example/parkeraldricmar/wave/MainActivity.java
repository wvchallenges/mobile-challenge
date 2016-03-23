package com.example.parkeraldricmar.wave;

import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;


/**
 * https://github.com/parker-mar/mobile-challenge
 *
 * Goal:
 * 1. Your app must retrieve the list of products for the specific business ID sent to you by your Wave contact
 * 2. The list of products should be fetched and shown to the user in a list view when the app is launched.
 * 3. Each product in the list view should show the product name and price (formatted as a dollar amount.)
 *
 * Citations:
 * https://spring.io/guides/gs/consuming-rest-android/#run
 */
public class MainActivity extends AppCompatActivity {

    /* Credentials */
    private static final String ACCESS_TOKEN_STR = "QmGeSTFctQf06uWFMQAW1m7pJ4FUQ3";
    private static final String BUSINESS_ID_STR = "89746d57-c25f-4cec-9c63-34d7780b044b";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
    }

    @Override
    protected void onStart() {
        super.onStart();
        new HttpRequestTask().execute();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {

        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        // Handle action bar product clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_refresh) {
            new HttpRequestTask().execute();
            return true;
        }

        return super.onOptionsItemSelected(item);
    }


    /**
     * A placeholder fragment containing a simple view.
     */
    public static class PlaceholderFragment extends Fragment {

        public PlaceholderFragment() {
        }

        @Override
        public View onCreateView(LayoutInflater inflater, ViewGroup container,
                                 Bundle savedInstanceState) {
            View rootView = inflater.inflate(R.layout.content_main, container, false);
            return rootView;
        }
    }

    private class HttpRequestTask extends AsyncTask<Void,Void,Product[]> {
        @Override
        protected Product[] doInBackground(Void... params) {
            try {
                final String url =
                        "https://api.waveapps.com"
                                + "/businesses/" + BUSINESS_ID_STR
                                + "/products"
                                + "?access_token=" + ACCESS_TOKEN_STR;
                RestTemplate restTemplate = new RestTemplate();
                restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
                Product[] product = restTemplate.getForObject(url, Product[].class);
                return product;
            } catch (Exception e) {
                Log.e("MainActivity", e.getMessage(), e);
            }

            return null;
        }

        @Override
        protected void onPostExecute(Product[] products) {
            ArrayAdapter<Product> adapter = new ArrayAdapter<Product>(MainActivity.this,
                    android.R.layout.simple_list_item_1, products);
            ListView listView = (ListView) findViewById(R.id.products);
            listView.setAdapter(adapter);
        }

    }
}
