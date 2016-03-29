package com.example.justinkrinke.wavechallenge.util;

import android.content.Context;

import com.example.justinkrinke.wavechallenge.R;

/**
 * App constants pulled from secure.xml for keys
 */
public class Keys {
    private static String bId;

    public static void initialization(Context context) {

        bId = context.getResources().getString(R.string.bId);
    }

    public static String getbId() {

        return bId;
    }
}
