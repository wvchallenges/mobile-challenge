package com.wave.daniel.wave_danieloh;

import android.app.Application;
import android.content.Context;

import com.wave.daniel.wave_danieloh.engine.Engine;

/**
 * Created by Daniel on 2016-11-12.
 */

public class WaveApplication extends Application {

    private static Context mContext;
    private static Engine mEngine;


    @Override
    public void onCreate() {
        super.onCreate();

        mContext = getApplicationContext();
        mEngine = getEngine();

    }


    /**
     * create singleton variable for commonly use functions
     * */
    public static Engine getEngine() {
        if (mEngine == null) {
            mEngine = Engine.getInstance(mContext);
        }

        mEngine.startUp();

        return mEngine;
    }

    /**
     * clear singleton variable
     * */
    public static void shutDownEngine() {
        if (mEngine != null) {
            mEngine.shutdown();
        }

    }



}
