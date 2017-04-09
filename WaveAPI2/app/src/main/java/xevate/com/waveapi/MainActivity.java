package xevate.com.waveapi;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.graphics.Color;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.style.ForegroundColorSpan;
import android.util.Log;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.NumberFormat;
import java.util.ArrayList;

public class MainActivity extends Activity {
    final String access_token = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm";
    final String business_id = "89746d57-c25f-4cec-9c63-34d7780b044b";
    final String TAG = "mainACtivity";
    public CallWaveAPI SilentCheckLoad;
    private ListView listv;
    private TextView txtv;
    public ArrayList<Product> Prod_List;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        listv = (ListView) findViewById(android.R.id.list);
        txtv = (TextView) findViewById(R.id.txtview);

        SpannableStringBuilder builder = new SpannableStringBuilder();

        String str0 = "Fetch the product list for the user with" + System.getProperty("line.separator") + "Biz ID: ";
        builder.append(str0);
        SpannableString str1 = new SpannableString(business_id + System.getProperty("line.separator"));
        str1.setSpan(new ForegroundColorSpan(Color.BLUE), 0, str1.length(), 0);
        builder.append(str1);
        builder.append("Access_token: ");
        SpannableString str2 = new SpannableString(access_token);
        str2.setSpan(new ForegroundColorSpan(Color.BLUE), 0, str2.length(), 0);
        builder.append(str2);

        txtv.setText(builder, TextView.BufferType.SPANNABLE);

        if (isNetworkAvailable()) {

            Prod_List = Global.getInstance().getProdArrayList(); // initiate

            SilentCheckLoad = new CallWaveAPI();
            SilentCheckLoad.execute();
        } else {
            Toast.makeText(this, "Check internet connection!", Toast.LENGTH_LONG).show();
        }

    }

    private boolean isNetworkAvailable() {
        ConnectivityManager manager = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = manager.getActiveNetworkInfo();

        boolean isAvailable = false;
        if (networkInfo != null && networkInfo.isConnected()) {
            isAvailable = true;
        }

        return isAvailable;
    }

    private class CallWaveAPI extends AsyncTask<String, Integer, String> {

        private ProgressDialog dialog = new ProgressDialog(MainActivity.this);

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            this.dialog.setMessage("Fetching...");
            this.dialog.show();

        }

        @Override
        protected String doInBackground(String... params) {

            String urlclient = "https://api.waveapps.com/businesses/" + business_id + "/products/";
            URL url = null;
            BufferedReader reader = null;
            StringBuilder stringBuilder;

            String longprofeed = "";

            Log.i(TAG, "doInBackground is called for " + urlclient);
            try {
                url = new URL(urlclient);
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("GET");
                connection.setRequestProperty("Authorization", "Bearer " + access_token);

                connection.setReadTimeout(15 * 1000);
                connection.connect();

                reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                stringBuilder = new StringBuilder();

                String line = null;
                while ((line = reader.readLine()) != null) {
                    stringBuilder.append(line + "\n");
                }
                longprofeed = stringBuilder.toString();
                connection.disconnect();
            } catch (Exception e) {
                Log.e("log_tag", "Error in http connection " + e.toString());
             //   longprofeed = longprofeed + e.toString();
                return "failed";
            }


            try {
                JSONArray JSarray = new JSONArray(longprofeed);
                int lenstr = JSarray.length();
                String prod_name = "";
                Double prod_price = null;
                Global.getInstance().resetProdArrayList();
                for (int i = 0; i < lenstr; i++) {
                    JSONObject json_data = JSarray.getJSONObject(i);
                    prod_name = json_data.getString("name");
                    prod_price = Double.parseDouble(json_data.getString("price"));
                    Product prodi = new Product();
                    prodi.setProd(prod_name, prod_price);
                    Global.getInstance().add2ProdArrayList(prodi);
                }

                return "OK";
            } catch (JSONException e) {
                Log.e("log_tag", "Error parsing data " + e.toString());
                return "failed";
            }

        }


        @Override
        protected void onProgressUpdate(Integer... values) {
            super.onProgressUpdate(values);
        }

        //////////////////////////////////////////////////////////////////////////////////
        @Override
        protected void onPostExecute(String result) {
            super.onPostExecute(result);

            if (dialog.isShowing()) {
                dialog.dismiss();
            }
            if (result.contains("OK")) {
                int len = Prod_List.size();
                String[] ListProd = new String[len];
                NumberFormat formatter = NumberFormat.getCurrencyInstance();
                for (int i = 0; i < len; i++) {
                    Double converted_amount = Prod_List.get(i).getPrice();

                    ListProd[i] = Prod_List.get(i).getName() + " : " + formatter.format(converted_amount);
                    System.out.println(" ListProd[i] = " + ListProd[i]);
                }
                ItemRow setListAdapter = new ItemRow(getBaseContext(), ListProd);
                listv.setAdapter(setListAdapter);
            }else {
                Toast.makeText(MainActivity.this, "Failed to fetch", Toast.LENGTH_LONG).show();
            }

        }

    }
}
