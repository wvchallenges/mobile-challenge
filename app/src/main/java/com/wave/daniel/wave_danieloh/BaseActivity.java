package com.wave.daniel.wave_danieloh;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Toast;

/**
 * Created by Daniel on 2016-11-12.
 */
public class BaseActivity extends AppCompatActivity {

    protected View mainView;

    private NetworkChangedReceiver networkChangedReceiver;
    protected boolean isConnectedToInternet;
    protected int networkType;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.isConnectedToInternet = true;

    }


    /**
     * displaying message with Snackbar
     */
    public void showSnackBar(String msg) {
        if (mainView != null) {
            Snackbar snackbar = Snackbar.make(mainView, msg, Snackbar.LENGTH_LONG);
            snackbar.show();

        } else {
            showToastMsg(msg);

        }

    }


    /**
     * displaying Toast message
     */
    public void showToastMsg(String msg) {
        Toast.makeText(this, msg, Toast.LENGTH_SHORT).show();
    }


    /**
     * BroadcastReceiver to monitor network status
     * */
    public class NetworkChangedReceiver extends BroadcastReceiver {
        @Override
        public void onReceive(Context context, Intent intent) {
            isNetworkAvailable(context);

        }
    }


    /**
     * check network availability
     * */
    public boolean isNetworkAvailable(Context context) {
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo activeNetwork = connectivityManager.getActiveNetworkInfo();

        if (activeNetwork != null) { // connected to the internet
            networkType = activeNetwork.getType();

            if (networkType == ConnectivityManager.TYPE_WIFI) {
                isConnectedToInternet = true;

            } else if (networkType == ConnectivityManager.TYPE_MOBILE) {
                isConnectedToInternet = true;

            }

        } else {
            isConnectedToInternet = false;

        }

        return isConnectedToInternet;
    }



    @Override
    protected void onResume() {
        super.onResume();

        //register NetworkChangedReceiver
        networkChangedReceiver = new NetworkChangedReceiver();
        final IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction(ConnectivityManager.CONNECTIVITY_ACTION);
        registerReceiver(networkChangedReceiver, intentFilter);

    }


    @Override
    protected void onStop() {
        super.onStop();

        //unregister NetworkChangedReceiver
        unregisterReceiver(networkChangedReceiver);

    }


}
