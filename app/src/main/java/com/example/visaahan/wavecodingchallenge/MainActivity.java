package com.example.visaahan.wavecodingchallenge;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.android.volley.RequestQueue;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.content_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        RequestQueue queue = Volley.newRequestQueue(this);

        final String businessId = "89746d57-c25f-4cec-9c63-34d7780b044b";
        final String accessToken = "d1hQ2z5dedmPGq8wVqU3vFLP4OstFh";

        final String getProductListURL = WaveURLGenerator.getProductListURL(businessId,accessToken);
        final MainActivity ma = this;

        // Request a string response from the provided URL.
        StringRequest getProductListRequest = WaveRequest.createGETRequest(ma,getProductListURL);

        queue.add(getProductListRequest);
    }

    public void populateScreen(String input, boolean isError){
        final LinearLayout ll = (LinearLayout)findViewById(R.id.layout);

        if (isError){
            TextView tv = new TextView(this);
            tv.setText(input);
            ll.addView(tv);
        }
        else {
            try {
                JSONArray jsonArr = new JSONArray(input);
                int length = jsonArr.length();

                for (int i = 0; i < length; i++) {
                    JSONObject jsonObj = jsonArr.getJSONObject(i);
                    String name = jsonObj.getString("name");
                    Double price = jsonObj.getDouble("price");
                    TextView tv = new TextView(this);
                    tv.setText(name + " $" + String.format("%.2f", price));
                    ll.addView(tv);
                }
            }catch (JSONException e) {
                e.printStackTrace();
            }
        }
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
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
