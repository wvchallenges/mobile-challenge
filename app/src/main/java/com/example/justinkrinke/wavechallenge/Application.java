package com.example.justinkrinke.wavechallenge;

import com.example.justinkrinke.wavechallenge.util.Keys;

/**
 * Created by justinkrinke on 2016-03-29.
 */
public class Application extends android.app.Application {
    @Override
    public void onCreate(){
        super.onCreate();

        Keys.initialization(this.getApplicationContext());

    }
}
