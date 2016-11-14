package com.wave.daniel.wave_danieloh.engine;

import android.content.Context;

import com.wave.daniel.wave_danieloh.engine.volley_manager.VolleyManager;

/**
 * Created by Daniel on 2016-11-12.
 *
 * Engine Class contains singleton variables that commonly used in the app
 *
 */
public class Engine {

    private static Context mContext;

    private static Engine mEngine;
    private static VolleyManager mVolleyManager;


    /**
     * getInstance method for singleton design pattern
     * */
    public static Engine getInstance(Context context) {
        if (mEngine == null) {
            mEngine = new Engine(context);
        }

        return mEngine;
    }

    /**
     * private constructor for singleton design pattern
     * */
    private Engine(Context context) {
        mContext = context;
        startUp();

    }

    /**
     * To initialize singleton variables
     * */
    public static void startUp() {
        mVolleyManager = VolleyManager.getInstance(mContext);

    }

    /**
     * To clear singleton variables
     * */
    public static void shutdown() {
        mVolleyManager.shutdown();
        mVolleyManager = null;

    }

    /**
     * This method returns VolleyManager for network communication
     * */
    public static VolleyManager getVolleyManager() {
        if (mVolleyManager == null) {
            mVolleyManager = VolleyManager.getInstance(mContext);
        }

        return mVolleyManager;
    }


}
